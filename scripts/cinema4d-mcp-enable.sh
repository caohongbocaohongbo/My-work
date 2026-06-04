#!/bin/bash
set -euo pipefail

REPO="/Users/fangcang/Downloads/cinema4d-mcp"
VENV="/Users/fangcang/.claude/mcp-venvs/cinema4d-mcp"
PYTHON="${CINEMA4D_MCP_PYTHON:-/opt/homebrew/bin/python3.11}"
C4D_HOST="${C4D_HOST:-127.0.0.1}"
C4D_PORT="${C4D_PORT:-5555}"

if [ ! -d "$REPO" ]; then
  echo "未找到 cinema4d-mcp 仓库：$REPO"
  echo "请先运行：git clone https://github.com/ttiimmaacc/cinema4d-mcp.git $REPO"
  exit 1
fi

if [ ! -x "$PYTHON" ]; then
  echo "未找到可用 Python 3.10+：$PYTHON"
  echo "建议先安装：brew install python@3.11"
  echo "也可以指定：CINEMA4D_MCP_PYTHON=/path/to/python3.11 $0"
  exit 1
fi

"$PYTHON" - <<'PY'
import sys
if sys.version_info < (3, 10):
    raise SystemExit("Cinema4D MCP Server 需要 Python 3.10+")
PY

if [ ! -d "$VENV" ]; then
  "$PYTHON" -m venv "$VENV"
fi

"$VENV/bin/python" -m pip install --upgrade pip >/dev/null
"$VENV/bin/python" -m pip install -e "$REPO"

claude mcp remove --scope user cinema4d >/dev/null 2>&1 || true
claude mcp add --scope user cinema4d -- "$VENV/bin/python" "$REPO/main.py"

echo ""
echo "已按需启用 Cinema 4D MCP。"
echo "使用前请确认 Cinema 4D 2023 已打开，并在 Extensions > Socket Server Plugin 中点击 Start Server。"
echo "验证命令：claude mcp list"
