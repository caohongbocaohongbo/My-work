# AI 视觉生成 Skills 按需策略

## 目标

把 5 组 AI 视觉相关 Skills 统一放在 `skills-archive/ai-visual-skills/`，供 Claude Code、DeepSeek Harness、Codex、ChatGPT 共用一份副本。

## 禁止默认挂载

这些 Skills 都属于高上下文、高工具倾向能力。默认不进入任何智能体启动上下文；只有任务命中下表固定关键词时才加载，不做宽泛语义扩展。

## 关键词路由

| 请求关键词 | Skill |
|---|---|
| 提示词对比、带图对比、出图提示词大全、提示词大全 | `open-image-prompts` |
| Three.js 图形、图片js特效、js图片特效 | `threejs-awesome-graphics-agent-skills` |
| 图片转3D模型、3D动态图、生成动态3D图、图生3D动图 | `img2threejs` |
| 极简杂志海报、极简海报 | `gc-minimal-zine-poster` |
| 正文变配图、文案生图 | `gimi-illustration-skill` |

## 已删除 Skill

- `oil-oil/all-motion` / `oil-oil/oil-motion`：按最新策略删除，不再归档，不再触发。

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
- 未发现保留的 5 个同源仓库已在 `skills-archive` 或 Codex 本地 Skills 中重复归档。
- 本次只新增共享归档，不复制到各智能体的默认 Skills 目录。
