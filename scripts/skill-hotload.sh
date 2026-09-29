#!/usr/bin/env bash
# skill-hotload.sh — Skills 热加载管理（基于软链接 + skillOverrides）
# 用法：skill-hotload.sh <命令> <skill-name>
# 命令：enable / disable / list / status

set -euo pipefail

CLAUDE_HOME="${HOME}/.claude"
SKILLS_DIR="${CLAUDE_HOME}/skills"
AGENTS_SKILLS_DIR="${HOME}/.agents/skills"
SETTINGS="${CLAUDE_HOME}/settings.local.json"
TOUCH_DIR="${CLAUDE_HOME}/cache/skill-hotload-touch"

mkdir -p "${TOUCH_DIR}"

# 颜色输出
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
info()  { echo -e "${GREEN}[✓]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[!]${NC}  $*"; }
error() { echo -e "${RED}[✗]${NC} $*" >&2; exit 1; }

# ─── 辅助函数：更新 skillOverrides ───────────────────────────
# 将 skill 从 skillOverrides 中设置为指定值（"name-only"/"user-invocable-only"/删除）
update_skill_override() {
    local skill_name="$1"
    local value="$2"  # "name-only" 或 "user-invocable-only" 或 "delete"

    python3 - "$SETTINGS" "$skill_name" "$value" <<'PY'
import json, sys, pathlib
settings_path = pathlib.Path(sys.argv[1])
skill_name = sys.argv[2]
value = sys.argv[3]

try:
    data = json.loads(settings_path.read_text())
except Exception as e:
    print(f"Error reading settings: {e}", file=sys.stderr)
    sys.exit(1)

if "skillOverrides" not in data:
    data["skillOverrides"] = {}

overrides = data["skillOverrides"]

if value == "delete":
    if skill_name in overrides:
        del overrides[skill_name]
        print(f"  [settings] skillOverrides 已删除 [{skill_name}]")
else:
    overrides[skill_name] = value
    print(f"  [settings] skillOverrides[{skill_name}] = {value}")

settings_path.write_text(json.dumps(data, indent=2, ensure_ascii=False))
PY
}

# ─── Skill 热加载命令 ───────────────────────────────────────
skill_enable() {
    local skill_name="$1"
    local target_path="${AGENTS_SKILLS_DIR}/${skill_name}"
    local link_path="${SKILLS_DIR}/${skill_name}"

    # 检查源是否存在
    if [[ ! -d "$target_path" ]]; then
        error "Skill 源不存在: ${target_path}"
    fi

    # 检查是否已存在
    if [[ -e "$link_path" ]]; then
        if [[ -L "$link_path" ]]; then
            info "Skill [${skill_name}] 已存在（软链接）"
        else
            error "Skill [${skill_name}] 已存在但非软链接，无法覆盖"
        fi
    else
        # 创建软链接
        ln -s "$target_path" "$link_path"
        info "创建软链接: ${skill_name} → ${target_path}"
    fi

    # 从 skillOverrides 中删除该 skill（使用默认可见性）
    update_skill_override "$skill_name" "delete"

    # 记录时间戳（用于自动回收）
    : > "${TOUCH_DIR}/${skill_name}"

    warn "Skill [${skill_name}] 已热加载。建议重启会话或运行 /context 验证。"
}

skill_disable() {
    local skill_name="$1"
    local link_path="${SKILLS_DIR}/${skill_name}"

    if [[ ! -e "$link_path" ]]; then
        warn "Skill [${skill_name}] 不存在或已禁用"
        return 0
    fi

    # 删除软链接
    rm -f "$link_path"
    info "已移除软链接: ${skill_name}"

    # 从 skillOverrides 中标记为 "user-invocable-only"（隐藏但可调用）
    update_skill_override "$skill_name" "user-invocable-only"

    # 清除时间戳
    rm -f "${TOUCH_DIR}/${skill_name}"

    warn "Skill [${skill_name}] 已禁用。建议重启会话或运行 /context 验证。"
}

skill_list() {
    echo "=== 可用的 Skill（来自 ~/.agents/skills/）==="
    if [[ -d "$AGENTS_SKILLS_DIR" ]]; then
        ls -1 "$AGENTS_SKILLS_DIR" | sed 's/^/  📦 /'
    else
        echo "  （目录不存在）"
    fi
}

skill_status() {
    echo "=== 当前活跃的 Skills（已软链接）==="
    if [[ -d "$SKILLS_DIR" ]]; then
        find "$SKILLS_DIR" -maxdepth 1 -type l | xargs -I{} basename {} | sed 's/^/  🔗 /' || echo "  （无）"
    else
        echo "  （无）"
    fi
    echo ""
    echo "=== skillOverrides 配置 ==="
    if [[ -f "$SETTINGS" ]]; then
        python3 - "$SETTINGS" <<'PY'
import json, pathlib
settings = pathlib.Path(pathlib.Path.home() / ".claude" / "settings.local.json")
try:
    data = json.loads(settings.read_text())
    overrides = data.get("skillOverrides", {})
    for skill, level in sorted(overrides.items()):
        print(f"  {skill:35} → {level}")
except:
    print("  （无法读取）")
PY
    fi
}

# ─── 主命令分发 ───────────────────────────────────────────────
cmd="${1:-help}"
shift || true

case "$cmd" in
    enable)
        [[ $# -eq 0 ]] && error "用法: skill-hotload.sh enable <skill-name>"
        skill_enable "$1"
        ;;
    disable)
        [[ $# -eq 0 ]] && error "用法: skill-hotload.sh disable <skill-name>"
        skill_disable "$1"
        ;;
    list)
        skill_list
        ;;
    status)
        skill_status
        ;;
    *)
        cat <<'HELP'
skill-hotload.sh — Skills 热加载管理

用法：
  skill-hotload.sh enable <skill-name>      启用 Skill（创建软链接，移除 skillOverrides）
  skill-hotload.sh disable <skill-name>     禁用 Skill（删除软链接，标记为 user-invocable-only）
  skill-hotload.sh list                     列出所有可用 Skill
  skill-hotload.sh status                   显示当前活跃 Skill + skillOverrides 配置

原理：
  • Skill 源存放：~/.agents/skills/（来自 agy cli）
  • Skill 链接：~/.claude/skills/（软链接，热加载）
  • 默认隐藏：skillOverrides 中标记为 user-invocable-only（防止污染 token）
  • 按需启用：enable 创建链接，delete 移除 skillOverrides 条目
  • 按需禁用：disable 删除链接，标记为 user-invocable-only

示例：
  skill-hotload.sh enable svg-drawing       # 启用 svg-drawing
  skill-hotload.sh status                   # 查看当前状态
  skill-hotload.sh disable svg-drawing      # 禁用 svg-drawing

HELP
        ;;
esac
