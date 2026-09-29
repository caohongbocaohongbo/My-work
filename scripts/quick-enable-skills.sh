#!/usr/bin/env bash
# quick-enable-skills.sh — 快速启用常用 Skills（如 agy 中的新加项）

set -euo pipefail

HOTLOAD="$HOME/.claude/scripts/skill-hotload.sh"

echo "🎯 按需启用 Skills（当前会话热加载）"
echo ""
echo "新增 Skills："
echo "  1. canvas-design     — Canvas 相关设计"
echo "  2. svg-drawing       — SVG 矢量绘制"
echo ""
echo "用法："
echo "  $HOTLOAD enable canvas-design"
echo "  $HOTLOAD enable svg-drawing"
echo "  $HOTLOAD status                 # 查看当前状态"
echo ""
echo "或直接运行："
for skill in canvas-design svg-drawing; do
    echo "  $HOTLOAD enable $skill"
done
