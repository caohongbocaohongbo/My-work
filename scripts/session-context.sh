#!/usr/bin/env bash
# session-context.sh — 会话级 skills/agents 软链管理（v4 方案C 的姊妹机制）
# 原理：开会话按 $CLAUDE_SCENE 从正本目录软链进 Claude 扫描目录；SessionEnd 关终端清除。
# 正本：skills → ~/.claude/skills-archive/   agents → ~/.claude/agent-presets/
# 视图：软链落在 ~/.claude/skills/ 与 ~/.claude/agents/（Claude Code 实际扫描处）
# 并发：每会话一份 manifest；unlink 用引用计数，仅当无其他活跃会话引用时才删软链。
# 孤儿：关窗未触发 SessionEnd 时，下次 SessionStart 的 reap 按 manifest 超时兜底清理。

set -uo pipefail

C="${HOME}/.claude"
MAP="${C}/config/scene-context.map"
MANI_DIR="${C}/cache/session-scene"
# 正本/视图目录（不用关联数组，兼容 macOS bash 3.2）
src_dir() { case "$1" in skill) echo "${C}/skills-archive";; agent) echo "${C}/agent-presets";; esac; }
dst_dir() { case "$1" in skill) echo "${C}/skills";;         agent) echo "${C}/agents";; esac; }
ORPHAN_MIN=720   # manifest 超过 12h 视为孤儿

mkdir -p "$MANI_DIR"

# 读取 session_id：优先参数 $1，否则从 stdin JSON 取
read_sid() {
  local sid="${1:-}"
  if [[ -z "$sid" && ! -t 0 ]]; then
    sid=$(python3 -c "import sys,json
try: print(json.load(sys.stdin).get('session_id',''))
except Exception: print('')" 2>/dev/null)
  fi
  printf '%s' "${sid:-}"
}

# 查询某 scene + type 的名称列表
scene_names() {
  local scene="$1" type="$2"
  [[ -f "$MAP" ]] || return 0
  awk -F'|' -v s="$scene" -v t="${type}s" '$1==s && $2==t{print $3}' "$MAP"
}

# 建立本会话软链，写 manifest
do_link() {
  local sid="$1" scene="${CLAUDE_SCENE:-}"
  [[ -z "$sid" || -z "$scene" ]] && return 0   # 无场景=默认纯净，不链
  local mani="${MANI_DIR}/${sid}" tmp="${MANI_DIR}/.${sid}.tmp"
  : > "$tmp"
  local type name src dst
  for type in skill agent; do
    for name in $(scene_names "$scene" "$type"); do
      src="$(src_dir "$type")/${name}"; dst="$(dst_dir "$type")/${name}"
      [[ -e "$src" ]] || continue
      [[ -e "$dst" ]] || ln -s "$src" "$dst" 2>/dev/null || true
      printf '%s:%s\n' "$type" "$name" >> "$tmp"
    done
  done
  mv -f "$tmp" "$mani"
}

# 对单个 sid 撤链（引用计数：其他 manifest 仍引用则保留软链）
do_unlink() {
  local sid="$1" mani="${MANI_DIR}/${sid}"
  [[ -f "$mani" ]] || return 0
  local line type name
  while IFS= read -r line; do
    [[ -z "$line" ]] && continue
    type="${line%%:*}"; name="${line#*:}"
    # 除自身外仍引用该项的活跃 manifest 数；为 0 才删软链
    local others
    others=$(grep -rlxF "$line" "$MANI_DIR" 2>/dev/null | grep -vx "$mani" | wc -l | tr -d ' ')
    if [[ "${others:-0}" -eq 0 ]]; then
      local d="$(dst_dir "$type")/${name}"
      [[ -L "$d" ]] && rm -f "$d"
    fi
  done < "$mani"
  rm -f "$mani"
}

# 孤儿兜底：清理超时 manifest
do_reap() {
  local m
  for m in "$MANI_DIR"/*; do
    [[ -f "$m" ]] || continue
    if find "$m" -mmin +${ORPHAN_MIN} 2>/dev/null | grep -q .; then
      do_unlink "$(basename "$m")"
    fi
  done
}

case "${1:-help}" in
  start)  sid=$(read_sid "${2:-}"); do_reap; do_link "$sid" ;;
  end)    sid=$(read_sid "${2:-}"); do_unlink "$sid" ;;
  link)   sid=$(read_sid "${2:-}"); do_link "$sid" ;;
  unlink) sid=$(read_sid "${2:-}"); do_unlink "$sid" ;;
  reap)   do_reap ;;
  status)
    echo "=== 场景映射 ($MAP) ==="; [[ -f "$MAP" ]] && grep -v '^#' "$MAP" | sed 's/^/  /'
    echo "=== 当前 skills/ 软链 ==="; find "${C}/skills" -maxdepth 1 -type l 2>/dev/null | xargs -I{} basename {} | sed 's/^/  /' || true
    echo "=== 活跃 manifest ==="; ls "$MANI_DIR" 2>/dev/null | sed 's/^/  /' || true
    ;;
  *) echo "用法: $(basename "$0") {start|end|link|unlink|reap|status} [session_id]" ;;
esac
