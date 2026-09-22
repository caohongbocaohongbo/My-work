# AI 视觉生成 Skills 共享归档

本目录保存 AI 出图、Three.js 图形、图生 3D、杂志风海报、文章配图相关 Skills。它是共享归档区，不是任何智能体的默认启动上下文。

## 已归档

| Skill | 来源 | 用途 | 触发关键词 |
|---|---|---|---|
| `open-image-prompts` | `NanmiCoder/open-image-prompts` | 本地检索出图提示词、提示词-图片对比、风格卡片 | 提示词对比、带图对比、出图提示词大全、提示词大全 |
| `threejs-awesome-graphics-agent-skills` | `scottstts/Threejs-Awesome-Graphics-Agent-Skills` | 24 个 Three.js 图形技能路由 | Three.js 图形、图片js特效、js图片特效 |
| `img2threejs` | `img2threejs/img2threejs` | 单张参考图重建为可动 Three.js 程序化模型 | 图片转3D模型、3D动态图、生成动态3D图、图生3D动图 |
| `gc-minimal-zine-poster` | `LiamGvchi/gc-minimal-zine-poster` | 极简杂志/zine 风海报提示词与出图流程 | 极简杂志海报、极简海报 |
| `gimi-illustration-skill` | `GiMi-Xiaomi/gimi-illustration-skill` | 中文正文配图、三种画风、自定义 IP 录入 | 正文变配图、文案生图 |

说明：`oil-oil/all-motion` / `oil-oil/oil-motion` 已按最新策略删除，不再作为共享 Skill 归档或关键词路由目标。

## 共享策略

- 本机只保留这一份归档副本：`/Users/fangcang/Documents/My-work-repo/skills-archive/ai-visual-skills/`。
- Claude Code、DeepSeek Harness、Codex、ChatGPT 都不要在启动时默认挂载这些 Skills。
- 仅当请求命中上表固定关键词时，按需启用对应目录；不要再用宽泛语义自动扩展触发。
- 启用后 20 分钟没有继续使用，应回收挂载；再次需要时重新启用。
- 归档区只保存文本、代码、脚本、清单和参考资料；示例大图、视频、构建产物等大媒体不入库。需要完整媒体时按各目录 `SOURCE.md` 回到上游仓库获取。

## 快速调用

Claude Code 可使用仓库脚本：

```bash
/Users/fangcang/Documents/My-work-repo/scripts/skill-hotload.sh enable open-image-prompts
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
