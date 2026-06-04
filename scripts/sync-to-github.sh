#!/bin/bash
# My Work — 自动同步本地更改到 GitHub 仓库
# 同步源:
#   ~/.claude/{CLAUDE.md, config/, mcp.json, scripts/, skills/, agents/, mcp-presets/, agent-presets/}
#   ~/.claude/settings.local.json (运行态)
#   ~/.claude/settings.json (会被脱敏后写入 config/settings.reference.json)
#   ~/Documents/My-design-systen/
# 排除: backups/, sessions/, history.jsonl, projects/, *.bak*, *.tmp, .DS_Store
# 目标仓库: ~/Documents/My-work-repo → github.com/caohongbocaohongbo/My-work

set -e

REPO_DIR="$HOME/Documents/My-work-repo"
LOG_FILE="$HOME/.claude/sync-github.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

COMMON_EXCLUDES=(--exclude '.DS_Store' --exclude '*.bak*' --exclude '*.tmp' --exclude '*.orig')

mkdir -p "$REPO_DIR/config/strategies" "$REPO_DIR/scripts" "$REPO_DIR/presets/mcp" "$REPO_DIR/presets/agents"

# ── Skills (跟随软链) ───────────────────────────────
log "Syncing skills..."
rsync -avL --delete "$HOME/.claude/skills/" "$REPO_DIR/skills/" "${COMMON_EXCLUDES[@]}" 2>&1 | tail -1

# ── Agents (常驻) ───────────────────────────────────
log "Syncing agents..."
rsync -av --delete "$HOME/.claude/agents/" "$REPO_DIR/agents/" "${COMMON_EXCLUDES[@]}" 2>&1 | tail -1

# ── 全局 CLAUDE.md ──────────────────────────────────
log "Syncing global CLAUDE.md..."
cp "$HOME/.claude/CLAUDE.md" "$REPO_DIR/config/global-CLAUDE.md"

# ── 策略文档 ────────────────────────────────────────
log "Syncing strategy docs..."
rsync -av --delete "$HOME/.claude/config/" "$REPO_DIR/config/strategies/" "${COMMON_EXCLUDES[@]}" 2>&1 | tail -1

# ── MCP 入口 ────────────────────────────────────────
log "Syncing mcp.json..."
cp "$HOME/.claude/mcp.json" "$REPO_DIR/config/mcp.json"

# ── 脚本 ────────────────────────────────────────────
log "Syncing scripts..."
rsync -av --delete "$HOME/.claude/scripts/" "$REPO_DIR/scripts/" "${COMMON_EXCLUDES[@]}" 2>&1 | tail -1

# ── 预设 ────────────────────────────────────────────
log "Syncing MCP presets (sanitized)..."
rsync -av --delete "$HOME/.claude/mcp-presets/" "$REPO_DIR/presets/mcp/" "${COMMON_EXCLUDES[@]}" 2>&1 | tail -1
python3 - <<'PY'
import json, os, glob, re
pdir = os.path.expanduser("~/Documents/My-work-repo/presets/mcp")
SECRET_KEY_RE = re.compile(r"(KEY|TOKEN|SECRET|PASSWORD|AUTHORIZATION|API[-_]?KEY)", re.I)
for path in glob.glob(f"{pdir}/*.json"):
    with open(path) as f:
        try:
            d = json.load(f)
        except Exception:
            continue
    def scrub(node):
        if isinstance(node, dict):
            for k, v in list(node.items()):
                if isinstance(v, str) and SECRET_KEY_RE.search(k):
                    node[k] = "<FILL_ME_IN>"
                else:
                    scrub(v)
        elif isinstance(node, list):
            for item in node:
                scrub(item)
    scrub(d)
    d["_note"] = "脱敏模板。本地启用前自行填入真实凭据。"
    with open(path, "w") as f:
        json.dump(d, f, indent=2, ensure_ascii=False)
PY

log "Syncing Agent presets..."
rsync -av --delete "$HOME/.claude/agent-presets/" "$REPO_DIR/presets/agents/" "${COMMON_EXCLUDES[@]}" 2>&1 | tail -1

# ── settings.local (运行态) ────────────────────────
log "Syncing settings.local.json..."
cp "$HOME/.claude/settings.local.json" "$REPO_DIR/config/settings.local.json"

# ── settings.json 脱敏 ─────────────────────────────
log "Sanitizing and syncing settings.json..."
python3 - <<'PY'
import json, os
src = os.path.expanduser("~/.claude/settings.json")
dst = os.path.expanduser("~/Documents/My-work-repo/config/settings.reference.json")
with open(src) as f:
    d = json.load(f)
env = d.get("env", {})
for k in list(env.keys()):
    if any(s in k.upper() for s in ("KEY", "TOKEN", "SECRET", "PASSWORD")):
        env[k] = "<FILL_ME_IN>"
d["env"] = env
d["_note"] = "脱敏模板。新机器复制为 ~/.claude/settings.json 后填入真实凭据。"
with open(dst, "w") as f:
    json.dump(d, f, indent=2, ensure_ascii=False)
PY

# ── 设计系统 ────────────────────────────────────────
log "Syncing design-system..."
rsync -av --delete "$HOME/Documents/My-design-systen/" "$REPO_DIR/design-system/" \
    "${COMMON_EXCLUDES[@]}" --exclude '.git' --exclude '.github' 2>&1 | tail -1

# ── Git 提交 ────────────────────────────────────────
cd "$REPO_DIR"

if git diff --quiet && git diff --staged --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
    log "No changes detected, skipping push."
    exit 0
fi

log "Changes detected, committing and pushing..."
git add -A
git commit -m "自动同步: $(date '+%Y-%m-%d %H:%M:%S')" || true
git push origin main 2>&1

log "Sync completed successfully."
