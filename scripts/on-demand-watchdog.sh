#!/usr/bin/env bash
# on-demand-watchdog.sh — 定时回收空闲的按需 MCP/Skill/Agent
# 由 launchd（com.fangcang.claude.ondemand.plist）每 5 分钟触发一次
# 阈值：默认 20 分钟，可通过 ON_DEMAND_IDLE_MINUTES 环境变量覆盖
# 日志：~/.claude/logs/on-demand-watchdog.log（自动滚动到 1MB 截断）

set -euo pipefail

CLAUDE_HOME="${HOME}/.claude"
LOG_DIR="${CLAUDE_HOME}/logs"
LOG_FILE="${LOG_DIR}/on-demand-watchdog.log"
SCRIPT="${CLAUDE_HOME}/scripts/context-on-demand.sh"

mkdir -p "${LOG_DIR}"

# 日志滚动：超过 1MB 截断为最近 200 行
if [[ -f "$LOG_FILE" ]] && [[ $(stat -f %z "$LOG_FILE" 2>/dev/null || stat -c %s "$LOG_FILE" 2>/dev/null || echo 0) -gt 1048576 ]]; then
    tail -n 200 "$LOG_FILE" > "${LOG_FILE}.tmp" && mv "${LOG_FILE}.tmp" "$LOG_FILE"
fi

ts() { date '+%Y-%m-%d %H:%M:%S'; }

{
    echo "[$(ts)] watchdog tick start (threshold=${ON_DEMAND_IDLE_MINUTES:-20}min)"
    if [[ ! -x "$SCRIPT" ]]; then
        echo "[$(ts)] ERROR: $SCRIPT 不存在或不可执行"
        exit 0
    fi
    # 调用 cleanup-stale，传递阈值
    bash "$SCRIPT" cleanup-stale "${ON_DEMAND_IDLE_MINUTES:-20}" 2>&1 || true
    echo "[$(ts)] watchdog tick end"
} >> "$LOG_FILE" 2>&1
