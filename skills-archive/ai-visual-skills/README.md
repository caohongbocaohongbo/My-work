# AI 视觉生成 Skills 共享归档

本目录保存 AI 出图、交互动画、Three.js 图形、图生 3D、杂志风海报、文章配图相关 Skills。它是共享归档区，不是任何智能体的默认启动上下文。

## 已归档

| Skill | 来源 | 用途 | 触发关键词 |
|---|---|---|---|
| `open-image-prompts` | `NanmiCoder/open-image-prompts` | 本地检索出图提示词、提示词-图片对比、风格卡片 | 出图提示词、prompt-image、图片参考、风格卡、提示词检索 |
| `oil-motion` | `oil-oil/oil-motion` | 网页拖拽、滚动、指针、触摸、状态驱动连续交互动画 | 拖拽动画、滚动动效、交互动画、motion runtime |
| `threejs-awesome-graphics-agent-skills` | `scottstts/Threejs-Awesome-Graphics-Agent-Skills` | 24 个 Three.js 图形技能路由 | Three.js、材质、光效、海洋、云、VFX、程序化几何 |
| `img2threejs` | `img2threejs/img2threejs` | 单张参考图重建为可动 Three.js 程序化模型 | 图生 3D、image to Three.js、程序化模型、动画-ready |
| `gc-minimal-zine-poster` | `LiamGvchi/gc-minimal-zine-poster` | 极简杂志/zine 风海报提示词与出图流程 | 极简海报、zine poster、纸感、杂志风 |
| `gimi-illustration-skill` | `GiMi-Xiaomi/gimi-illustration-skill` | 中文正文配图、三种画风、自定义 IP 录入 | 文章配图、插画、怪诞手绘、暖调绘本、录入 IP |

说明：用户原始清单里的 `oil-oil/all-motion` 当前不可访问；已按同作者、同用途的公开仓库 `oil-oil/oil-motion` 归档。

## 共享策略

- 本机只保留这一份归档副本：`/Users/fangcang/Documents/My-work-repo/skills-archive/ai-visual-skills/`。
- Claude Code、DeepSeek Harness、Codex、ChatGPT 都不要在启动时默认挂载这些 Skills。
- 仅当用户明确点名 Skill，或请求命中上表关键词时，按需启用对应目录。
- 启用后 20 分钟没有继续使用，应回收挂载；再次需要时重新启用。
- 归档区只保存文本、代码、脚本、清单和参考资料；示例大图、视频、构建产物等大媒体不入库。需要完整媒体时按各目录 `SOURCE.md` 回到上游仓库获取。

## 快速调用

Claude Code 可使用仓库脚本：

```bash
/Users/fangcang/Documents/My-work-repo/scripts/skill-hotload.sh enable open-image-prompts
/Users/fangcang/Documents/My-work-repo/scripts/skill-hotload.sh enable oil-motion
/Users/fangcang/Documents/My-work-repo/scripts/skill-hotload.sh enable threejs-awesome-graphics-agent-skills
/Users/fangcang/Documents/My-work-repo/scripts/skill-hotload.sh enable img2threejs
/Users/fangcang/Documents/My-work-repo/scripts/skill-hotload.sh enable gc-minimal-zine-poster
/Users/fangcang/Documents/My-work-repo/scripts/skill-hotload.sh enable gimi-illustration-skill
```

通用智能体调用方式：

1. 读取本 README 判断目标 Skill。
2. 读取对应目录的 `SKILL.md`。
3. 如果 `SKILL.md` 指向 `references/`、`docs/`、`scripts/` 或子技能，只加载当前任务需要的最小文件。
4. 任务结束或 20 分钟无继续使用时卸载/忘记该上下文。
