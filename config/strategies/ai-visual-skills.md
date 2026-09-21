# AI 视觉生成 Skills 按需策略

## 目标

把 6 组 AI 视觉相关 Skills 统一放在 `skills-archive/ai-visual-skills/`，供 Claude Code、DeepSeek Harness、Codex、ChatGPT 共用一份副本。

## 禁止默认挂载

这些 Skills 都属于高上下文、高工具倾向能力。默认不进入任何智能体启动上下文；只有用户明确点名或任务关键词命中时才加载。

## 关键词路由

| 请求关键词 | Skill |
|---|---|
| 出图提示词、图片提示词库、提示词检索、图片参考对比、风格卡 | `open-image-prompts` |
| 拖拽动画、滚动动效、指针动效、触摸动效、状态驱动网页动画 | `oil-motion` |
| Three.js 材质、光效、程序化几何、体积云、水体、植被、VFX、视觉验证 | `threejs-awesome-graphics-agent-skills` |
| 一张图转 Three.js、图生 3D、参考图重建模型、可动程序化模型 | `img2threejs` |
| 极简海报、zine poster、杂志风海报、纸感拼贴、诗意海报 | `gc-minimal-zine-poster` |
| 文章配图、中文正文转插画、怪诞手绘、暖调绘本、产品方案、自定义 IP 录入 | `gimi-illustration-skill` |

## 20 分钟回收

- 启用时记录时间戳。
- 20 分钟没有再次启用或触碰，视为不用即消，应从当前智能体上下文移除。
- Claude Code 侧可运行：

```bash
/Users/fangcang/Documents/My-work-repo/scripts/skill-hotload.sh sweep
```

其它智能体遵循同样语义：本轮读取需要的 `SKILL.md`；任务结束后不要持久注入；超过 20 分钟再次需要时重新读取。

## 重复检查结果

- 已有相近能力：`skills-archive/video-skills/visual-skills/image`、`skills-archive/video-skills/visual-skills/video`、`skills/gsap-advanced-animation`。
- 未发现这 6 个同源仓库已在 `skills-archive` 或 Codex 本地 Skills 中归档。
- 本次只新增共享归档，不复制到各智能体的默认 Skills 目录。
