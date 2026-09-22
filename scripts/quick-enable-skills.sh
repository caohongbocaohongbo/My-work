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
echo "AI 视觉生成 Skills（共享归档，按需启用）："
echo "  3. open-image-prompts                  — 提示词对比 / 带图对比 / 出图提示词大全 / 提示词大全"
echo "  4. threejs-awesome-graphics-agent-skills — Three.js 图形 / 图片js特效 / js图片特效"
echo "  5. img2threejs                         — 图片转3D模型 / 3D动态图 / 生成动态3D图 / 图生3D动图"
echo "  6. gc-minimal-zine-poster              — 极简杂志海报 / 极简海报"
echo "  7. gimi-illustration-skill             — 正文变配图 / 文案生图"
echo ""
echo "用法："
echo "  $HOTLOAD enable canvas-design"
echo "  $HOTLOAD enable svg-drawing"
echo "  $HOTLOAD enable open-image-prompts"
echo "  $HOTLOAD enable threejs-awesome-graphics-agent-skills"
echo "  $HOTLOAD enable img2threejs"
echo "  $HOTLOAD enable gc-minimal-zine-poster"
echo "  $HOTLOAD enable gimi-illustration-skill"
echo "  $HOTLOAD sweep                  # 回收超过 20 分钟未触碰的 Skill"
echo "  $HOTLOAD status                 # 查看当前状态"
echo ""
echo "或直接运行："
for skill in canvas-design svg-drawing; do
    echo "  $HOTLOAD enable $skill"
done
for skill in open-image-prompts threejs-awesome-graphics-agent-skills img2threejs gc-minimal-zine-poster gimi-illustration-skill; do
    echo "  $HOTLOAD enable $skill"
done
