#!/bin/bash
set -euo pipefail

claude mcp remove --scope user cinema4d >/dev/null 2>&1 || true
echo "已禁用 Cinema 4D MCP，不再作为 Claude Code 常驻 MCP 加载。"
