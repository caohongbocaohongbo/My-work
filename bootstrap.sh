#!/bin/bash
# bootstrap.sh — 新机器接管脚本
# 用途: 把仓库内的工作流配置安装到 ~/.claude/，让新机器无缝继承同一套
#       按需启用 + token 优化 + 备份统一规则的智能体协作机制
# 用法:
#   git clone https://github.com/caohongbocaohongbo/My-work.git ~/Documents/My-work-repo
#   bash ~/Documents/My-work-repo/bootstrap.sh
#
# 重复执行安全: 已存在文件会被先备份到 ~/.claude/backups/ 再覆盖

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_HOME="$HOME/.claude"
TS="$(date +%Y%m%d_%H%M%S)"

info()  { echo "[OK]  $*"; }
warn()  { echo "[!!]  $*"; }
error() { echo "[ERR] $*" >&2; exit 1; }

mkdir -p "$CLAUDE_HOME/backups"

backup_if_exists() {
    local target="$1"
    local label="$2"
    if [[ -e "$target" ]]; then
        local bk="$CLAUDE_HOME/backups/bootstrap_${label}-pre-install_$(date +%Y%m%d)_v1"
        local i=1
        while [[ -e "${bk}$( [[ -d $target ]] && echo '' || echo .bak)" ]]; do
            i=$((i+1))
            bk="$CLAUDE_HOME/backups/bootstrap_${label}-pre-install_$(date +%Y%m%d)_v${i}"
        done
        if [[ -d "$target" ]]; then
            cp -R "$target" "$bk"
        else
            cp "$target" "${bk}.bak"
        fi
        warn "已备份 $target → $bk"
    fi
}

echo "===================================="
echo "  My-Work 工作流 — 新机器接管"
echo "===================================="
echo "源仓库: $REPO_DIR"
echo "目标:   $CLAUDE_HOME"
echo ""
read -p "继续？(y/N) " ans
[[ "$ans" == "y" ]] || error "取消"

# 1. 全局 CLAUDE.md
backup_if_exists "$CLAUDE_HOME/CLAUDE.md" "CLAUDE-md"
cp "$REPO_DIR/config/global-CLAUDE.md" "$CLAUDE_HOME/CLAUDE.md"
info "已安装 全局 CLAUDE.md"

# 2. 策略文档
backup_if_exists "$CLAUDE_HOME/config" "config-dir"
mkdir -p "$CLAUDE_HOME/config"
cp "$REPO_DIR/config/strategies/"*.md "$CLAUDE_HOME/config/"
info "已安装 策略文档 (mcp/skill/agent)"

# 3. MCP 入口
backup_if_exists "$CLAUDE_HOME/mcp.json" "mcp-json"
cp "$REPO_DIR/config/mcp.json" "$CLAUDE_HOME/mcp.json"
info "已安装 mcp.json"

# 4. 脚本
backup_if_exists "$CLAUDE_HOME/scripts" "scripts-dir"
mkdir -p "$CLAUDE_HOME/scripts"
cp "$REPO_DIR/scripts/"*.sh "$CLAUDE_HOME/scripts/"
chmod +x "$CLAUDE_HOME/scripts/"*.sh
info "已安装 scripts (含 context-on-demand.sh)"

# 5. 同步脚本本体 (Stop hook 入口)
cp "$REPO_DIR/scripts/sync-to-github.sh" "$CLAUDE_HOME/sync-to-github.sh" 2>/dev/null || \
    warn "未找到 scripts/sync-to-github.sh —— 请手动确认同步入口"
[[ -f "$CLAUDE_HOME/sync-to-github.sh" ]] && chmod +x "$CLAUDE_HOME/sync-to-github.sh"

# 6. 预设
backup_if_exists "$CLAUDE_HOME/mcp-presets" "mcp-presets"
backup_if_exists "$CLAUDE_HOME/agent-presets" "agent-presets"
mkdir -p "$CLAUDE_HOME/mcp-presets" "$CLAUDE_HOME/agent-presets" "$CLAUDE_HOME/skill-presets"
cp -R "$REPO_DIR/presets/mcp/"* "$CLAUDE_HOME/mcp-presets/" 2>/dev/null || true
cp -R "$REPO_DIR/presets/agents/"* "$CLAUDE_HOME/agent-presets/" 2>/dev/null || true
info "已安装 presets (mcp + agents)"

# 7. agents 软链
backup_if_exists "$CLAUDE_HOME/agents" "agents-dir"
ln -snf "$REPO_DIR/agents" "$CLAUDE_HOME/agents"
info "已链接 agents → 仓库"

# 8. skills 软链
backup_if_exists "$CLAUDE_HOME/skills" "skills-dir"
ln -snf "$REPO_DIR/skills" "$CLAUDE_HOME/skills"
info "已链接 skills → 仓库"

# 9. settings.json 模板
if [[ -f "$CLAUDE_HOME/settings.json" ]]; then
    warn "已存在 $CLAUDE_HOME/settings.json — 保留不覆盖"
    warn "如需更新模板，参考 $REPO_DIR/config/settings.reference.json"
else
    cp "$REPO_DIR/config/settings.reference.json" "$CLAUDE_HOME/settings.json"
    warn "已安装 settings.json 模板 — 请编辑填入真实 API key/token"
    warn "  位置: $CLAUDE_HOME/settings.json"
fi

# 10. settings.local.json
if [[ -f "$CLAUDE_HOME/settings.local.json" ]]; then
    backup_if_exists "$CLAUDE_HOME/settings.local.json" "settings-local"
fi
cp "$REPO_DIR/config/settings.local.json" "$CLAUDE_HOME/settings.local.json"
info "已安装 settings.local.json"

echo ""
echo "===================================="
echo "  接管完成"
echo "===================================="
echo ""
echo "后续步骤:"
echo "  1. 编辑 $CLAUDE_HOME/settings.json 填入真实凭据"
echo "  2. 重启 Claude Code"
echo "  3. 运行 /context 验证 token 基线"
echo "  4. 运行 $CLAUDE_HOME/scripts/context-on-demand.sh list 查看可恢复预设"
echo ""
