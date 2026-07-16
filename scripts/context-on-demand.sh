#!/usr/bin/env bash
# context-on-demand.sh — Claude Code 上下文按需加载管理脚本
# 用法：context-on-demand.sh <命令> [类型] [名称]
# 版本：1.0  日期：2026-06-03

set -euo pipefail

CLAUDE_HOME="${HOME}/.claude"
MCP_PRESETS="${CLAUDE_HOME}/mcp-presets"
SKILL_PRESETS="${CLAUDE_HOME}/skills-archive"
AGENT_PRESETS="${CLAUDE_HOME}/agent-presets"
SKILLS_DIR="${CLAUDE_HOME}/skills"
AGENTS_DIR="${CLAUDE_HOME}/agents"
TOUCH_DIR="${CLAUDE_HOME}/cache/on-demand-touch"
# 默认空闲阈值（分钟），可通过环境变量 ON_DEMAND_IDLE_MINUTES 覆盖
IDLE_MINUTES="${ON_DEMAND_IDLE_MINUTES:-20}"

mkdir -p "${TOUCH_DIR}"

# touch_mark <type> <name>  写入"最近使用"标记
touch_mark() {
    local type="$1" name="$2"
    : > "${TOUCH_DIR}/${type}_${name}"
}

# clear_mark <type> <name>
clear_mark() {
    local type="$1" name="$2"
    rm -f "${TOUCH_DIR}/${type}_${name}"
}

# remove_from_disabled <name>  把 MCP 从 settings.local.json 的 disabledMcpjsonServers 数组移除
# 避免 enable 写了 mcpServers 但仍被 disabled 列表拦截
remove_from_disabled() {
    local name="$1"
    local settings="${CLAUDE_HOME}/settings.local.json"
    [[ -f "$settings" ]] || return 0
    python3 - "$settings" "$name" <<'PY' || true
import json, sys, pathlib
p = pathlib.Path(sys.argv[1]); name = sys.argv[2]
try:
    d = json.loads(p.read_text())
except Exception:
    sys.exit(0)
arr = d.get('disabledMcpjsonServers', [])
if name in arr:
    arr.remove(name)
    d['disabledMcpjsonServers'] = arr
    p.write_text(json.dumps(d, indent=2, ensure_ascii=False))
    print(f"  [sync] settings.local.json → disabledMcpjsonServers 已剔除 [{name}]")
PY
}

# ─── 颜色 ───────────────────────────────────────────────
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
info()  { echo -e "${GREEN}[OK]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[!!]${NC}  $*"; }
error() { echo -e "${RED}[ERR]${NC} $*" >&2; exit 1; }

# ─── 重启提示 ────────────────────────────────────────────
restart_notice() {
    echo ""
    warn "Claude Code 当前会话无法热卸载 MCP/Skill/Agent。"
    warn "需要重启 Claude Code 或新开会话后，运行 /context 验证 token 变化。"
    echo ""
}

# ─── MCP 操作 ────────────────────────────────────────────
# [v4 已废止] 不再向 user-scope 写常驻 MCP（那是 v3 污染根源）。
# 方案C：MCP 通过启动器 alias 的 --mcp-config 会话级注入，关进程即回收。
mcp_enable() {
    local name="$1"
    local preset="${MCP_PRESETS}/${name}.json"
    [[ -f "$preset" ]] || error "预设不存在: ${preset}"
    # 名称 → 启动器 alias 映射
    local launcher
    case "$name" in
        figma-hosted) launcher="cfigma" ;;
        figma-desktop) launcher="cfigd" ;;
        pencil)       launcher="cpen" ;;
        open-design)  launcher="cod" ;;
        stitch)       launcher="cstitch" ;;
        *)            launcher="" ;;
    esac
    warn "v4 方案C：不再把 MCP 写入 user-scope（会常驻、占 token、关终端不消）。"
    if [[ -n "$launcher" ]]; then
        info "请【新开会话】用启动器注入：${launcher}"
    else
        info "请【新开会话】用：command claude --tools \"\$_CTOOLS\" --mcp-config \"\$CLAUDE_MCP_PRESETS/${name}.json\" --strict-mcp-config"
    fi
    info "设计全家桶：cdesign（figma-hosted+pencil+open-design+stitch）。关终端即自动回收。"
}

# 仅刷新时间戳，不重新注册（供 SessionStart hook / 关键词命中时调用）
mcp_touch() {
    local name="$1"
    touch_mark mcp "${name}"
    info "MCP [${name}] 时间戳已刷新"
}

mcp_disable() {
    local name="$1"
    # [v4] user-scope 已恒空，无常驻 MCP 可移除；方案C 靠关进程回收。
    # 兼容历史误写：若 user-scope 仍残留同名项，则清掉（一次性纠偏）。
    if claude mcp get "$name" 2>/dev/null | grep -qi "Scope:.*User"; then
        [[ "$DRY_RUN" == "1" ]] && { info "[dry-run] 清理残留 user-scope MCP '${name}'"; return; }
        claude mcp remove --scope user "$name" 2>/dev/null && \
            info "已清理残留 user-scope MCP [${name}]（纠偏，非常态）"
    else
        info "MCP [${name}]：user-scope 无常驻项。方案C 下关终端/退出即自动回收，无需 disable。"
    fi
    clear_mark mcp "${name}" 2>/dev/null || true
}

# ─── Skill 操作 ──────────────────────────────────────────
# set_override <name> <level|__delete__>  同步 settings.local.json 的 skillOverrides
#   level = name-only | user-invocable-only；__delete__ 表示删除该键（默认 ON）
set_override() {
    local name="$1" level="$2"
    local settings="${CLAUDE_HOME}/settings.local.json"
    [[ -f "$settings" ]] || { warn "settings.local.json 不存在，跳过 override 同步"; return 0; }
    [[ "$DRY_RUN" == "1" ]] && { info "[dry-run] skillOverrides[${name}] → ${level}"; return 0; }
    python3 - "$settings" "$name" "$level" <<'PY' || true
import json, sys, pathlib
p=pathlib.Path(sys.argv[1]); name=sys.argv[2]; level=sys.argv[3]
try: d=json.loads(p.read_text())
except Exception: sys.exit(0)
so=d.setdefault("skillOverrides",{})
old=so.get(name,"(未列出)")
if level=="__delete__": so.pop(name,None); new="(删除→默认ON)"
else: so[name]=level; new=level
p.write_text(json.dumps(d,indent=2,ensure_ascii=False))
print(f"  [sync] skillOverrides[{name}]: {old} → {new}")
PY
}

skill_enable() {
    local name="$1"
    # 可选第二参数：启用后的 override 级别，默认 name-only（关键字触发、不污染 token 基线）
    local level="${2:-name-only}"
    local preset_src="${SKILL_PRESETS}/${name}"
    local dest="${SKILLS_DIR}/${name}"
    [[ -d "$preset_src" ]] || error "Skill 预设不存在: ${preset_src}"
    if [[ "$DRY_RUN" == "1" ]]; then
        info "[dry-run] 将移动: ${preset_src} → ${dest}"
        set_override "${name}" "${level}"
        return
    fi
    mv "${preset_src}" "${dest}"
    touch_mark skill "${name}"
    set_override "${name}" "${level}"    # ② 联动 override 级别
    info "Skill [${name}] 已从预设恢复到 ${dest}（override=${level}），已记录使用时间戳"
    warn "③ 别忘了在对应 agent README + config/skill-strategy.md 登记触发关键字"
    warn "重启会话后 /context 可见变化"
}

skill_disable() {
    local name="$1"
    local src="${SKILLS_DIR}/${name}"
    local dest_dir="${SKILL_PRESETS}"
    mkdir -p "${dest_dir}"
    [[ -d "$src" ]] || error "Skill 目录不存在: ${src}"
    if [[ "$DRY_RUN" == "1" ]]; then
        info "[dry-run] 将归档: ${src} → ${dest_dir}/${name}"
        set_override "${name}" "user-invocable-only"
        return
    fi
    mv "${src}" "${dest_dir}/${name}"
    clear_mark skill "${name}"
    set_override "${name}" "user-invocable-only"   # ② 归档→隐藏，反向联动
    info "Skill [${name}] 已归档到 ${dest_dir}/${name}（override=user-invocable-only）"
    warn "③ 记得从 agent README + skill-strategy.md 关键字表移除该 skill"
    warn "重启会话后 /context 可见变化"
}

# ─── Agent 操作 ──────────────────────────────────────────
agent_enable() {
    local name="$1"
    local preset_src="${AGENT_PRESETS}/${name}"
    local dest="${AGENTS_DIR}/${name}"
    [[ -d "$preset_src" ]] || error "Agent 预设不存在: ${preset_src}"
    if [[ "$DRY_RUN" == "1" ]]; then
        info "[dry-run] 将移动: ${preset_src} → ${dest}"
        return
    fi
    mv "${preset_src}" "${dest}"
    touch_mark agent "${name}"
    info "Agent [${name}] 已从预设恢复到 ${dest}，已记录使用时间戳"
    warn "重启会话后 /context 可见变化"
}

agent_disable() {
    local name="$1"
    local src="${AGENTS_DIR}/${name}"
    local dest_dir="${AGENT_PRESETS}"
    mkdir -p "${dest_dir}"
    [[ -d "$src" ]] || error "Agent 目录不存在: ${src}"
    if [[ "$DRY_RUN" == "1" ]]; then
        info "[dry-run] 将归档: ${src} → ${dest_dir}/${name}"
        return
    fi
    mv "${src}" "${dest_dir}/${name}"
    clear_mark agent "${name}"
    info "Agent [${name}] 已归档到 ${dest_dir}/${name}"
    warn "重启会话后 /context 可见变化"
}

# ─── status ──────────────────────────────────────────────
cmd_status() {
    echo "=== MCP 预设（已归档，未常驻）==="
    if [[ -d "$MCP_PRESETS" ]]; then
        ls "${MCP_PRESETS}"/*.json 2>/dev/null | xargs -I{} basename {} .json | sed 's/^/  📦 /' || echo "  （空）"
    fi
    echo ""
    echo "=== Skill 预设（已归档）==="
    if [[ -d "$SKILL_PRESETS" ]]; then
        ls -d "${SKILL_PRESETS}"/*/  2>/dev/null | xargs -I{} basename {} | sed 's/^/  📦 /' || echo "  （空）"
    fi
    echo ""
    echo "=== Agent 预设（已归档）==="
    if [[ -d "$AGENT_PRESETS" ]]; then
        ls -d "${AGENT_PRESETS}"/*/  2>/dev/null | xargs -I{} basename {} | sed 's/^/  📦 /' || echo "  （空）"
    fi
    echo ""
    echo "=== 当前活跃 Skills ==="
    ls -d "${SKILLS_DIR}"/*/  2>/dev/null | xargs -I{} basename {} | sed 's/^/  ✅ /' || echo "  （空）"
    echo ""
    echo "=== 当前活跃 Agents ==="
    ls -d "${AGENTS_DIR}"/*/  2>/dev/null | xargs -I{} basename {} | sed 's/^/  ✅ /' || echo "  （空）"
}

# ─── list ────────────────────────────────────────────────
cmd_list() {
    echo "=== 可恢复的 MCP 预设 ==="
    for f in "${MCP_PRESETS}"/*.json; do
        [[ -f "$f" ]] && echo "  $(basename "$f" .json)  →  enable mcp $(basename "$f" .json)"
    done 2>/dev/null || true
    echo ""
    echo "=== 可恢复的 Skill 预设 ==="
    for d in "${SKILL_PRESETS}"/*/; do
        [[ -d "$d" ]] && echo "  $(basename "$d")  →  enable skill $(basename "$d")"
    done
    echo ""
    echo "=== 可恢复的 Agent 预设 ==="
    for d in "${AGENT_PRESETS}"/*/; do
        [[ -d "$d" ]] && echo "  $(basename "$d")  →  enable agent $(basename "$d")"
    done
}

# ─── cleanup-stale（watchdog 调用，按空闲时长自动 disable）────
cmd_cleanup_stale() {
    local threshold_min="${1:-${IDLE_MINUTES}}"
    local now=$(date +%s)
    local threshold_sec=$(( threshold_min * 60 ))
    local removed=0

    [[ -d "$TOUCH_DIR" ]] || { info "无 touch 记录，跳过"; return; }

    for mark in "${TOUCH_DIR}"/*; do
        [[ -f "$mark" ]] || continue
        local base=$(basename "$mark")
        local mtime=$(stat -f %m "$mark" 2>/dev/null || stat -c %Y "$mark" 2>/dev/null || echo 0)
        local idle=$(( now - mtime ))
        if (( idle >= threshold_sec )); then
            # 解析 type_name（type 仅 mcp/skill/agent，无下划线）
            local type="${base%%_*}"
            local name="${base#*_}"
            case "$type" in
                mcp)   mcp_disable   "$name" >/dev/null 2>&1 || true ;;
                skill) skill_disable "$name" >/dev/null 2>&1 || true ;;
                agent) agent_disable "$name" >/dev/null 2>&1 || true ;;
                *) warn "未知类型标记: $base"; continue ;;
            esac
            rm -f "$mark"
            info "已自动回收 ${type} [${name}]（空闲 $(( idle / 60 )) 分钟 ≥ ${threshold_min} 分钟）"
            removed=$(( removed + 1 ))
        fi
    done
    info "cleanup-stale 完成，共回收 ${removed} 项；阈值 ${threshold_min} 分钟"
}

# ─── cleanup（询面后批量回收）────────────────────────────
cmd_cleanup() {
    warn "cleanup 将归档所有低频 MCP / skill / agent（仅限预定义归档列表）"
    echo "（如需自定义，直接调用 disable 子命令）"
    echo ""
    info "当前无自动 cleanup 列表。请使用 disable 命令手动归档。"
}

# ─── 主入口 ──────────────────────────────────────────────
DRY_RUN=0
CMD="${1:-help}"
[[ "$CMD" == "dry-run" ]] && { DRY_RUN=1; CMD="${2:-help}"; shift 1; }
shift 1 || true

case "$CMD" in
    status)  cmd_status ;;
    list)    cmd_list ;;
    cleanup) cmd_cleanup ;;
    cleanup-stale) cmd_cleanup_stale "${1:-}" ;;
    touch)
        TYPE="${1:-}"; NAME="${2:-}"
        [[ -z "$TYPE" || -z "$NAME" ]] && error "用法: touch <mcp|skill|agent> <名称>"
        case "$TYPE" in
            mcp)   mcp_touch "$NAME" ;;
            skill) touch_mark skill "$NAME"; info "Skill [${NAME}] 时间戳已刷新" ;;
            agent) touch_mark agent "$NAME"; info "Agent [${NAME}] 时间戳已刷新" ;;
            *) error "未知类型: $TYPE" ;;
        esac
        ;;
    enable)
        TYPE="${1:-}"; NAME="${2:-}"
        [[ -z "$TYPE" || -z "$NAME" ]] && error "用法: enable <mcp|skill|agent> <名称>"
        case "$TYPE" in
            mcp)   mcp_enable   "$NAME" ;;
            skill) skill_enable "$NAME" ;;
            agent) agent_enable "$NAME" ;;
            *) error "未知类型: $TYPE（支持 mcp / skill / agent）" ;;
        esac
        ;;
    disable)
        TYPE="${1:-}"; NAME="${2:-}"
        [[ -z "$TYPE" || -z "$NAME" ]] && error "用法: disable <mcp|skill|agent> <名称>"
        case "$TYPE" in
            mcp)   mcp_disable   "$NAME" ;;
            skill) skill_disable "$NAME" ;;
            agent) agent_disable "$NAME" ;;
            *) error "未知类型: $TYPE（支持 mcp / skill / agent）" ;;
        esac
        ;;
    help|--help|-h)
        echo "用法: $(basename "$0") [dry-run] <命令> [类型] [名称]"
        echo ""
        echo "命令:"
        echo "  status                    — 显示已归档与活跃的 MCP/Skill/Agent"
        echo "  list                      — 列出所有可恢复的预设"
        echo "  enable  mcp <名称>        — 从预设恢复并启用 MCP"
        echo "  disable mcp <名称>        — 移除 MCP（存入预设备份）"
        echo "  enable  skill <名称>      — 从预设恢复 Skill"
        echo "  disable skill <名称>      — 归档 Skill 到预设"
        echo "  enable  agent <名称>      — 从预设恢复 Agent"
        echo "  disable agent <名称>      — 归档 Agent 到预设"
        echo "  cleanup                   — 交互式批量回收"
        echo "  cleanup-stale [分钟]      — 按空闲时长自动 disable（默认 ${IDLE_MINUTES} 分钟，watchdog 调用）"
        echo "  touch   <类型> <名称>     — 仅刷新最近使用时间戳，不重新注册"
        echo "  dry-run enable mcp ...    — 预览操作，不实际执行"
        echo ""
        warn "注意：MCP 变更需重启 Claude Code 或新开会话后才能在 /context 中体现"
        ;;
    *)
        error "未知命令: $CMD。运行 help 查看用法"
        ;;
esac
