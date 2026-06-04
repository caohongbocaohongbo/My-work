# copyStyle

一个本地 skill：从 URL、品牌名或截图中提取设计语言，生成完整的设计系统（color tokens、typography、spacing、components、light + dark mode、hero stage、icon kit）。生成结果具有足够的"意见"，使两次不同会话使用同一份生成的 skill 也能产出视觉一致的界面。

> 上游来源：fork 自 `dominikmartn/hue`（MIT License）。本地已重命名为 `copyStyle` 并按个人工作流改写，后续不再追同步上游。

## 安装

本仓库内已就位：`~/Documents/My-work-repo/skills/copyStyle/`

如需软链到 Claude Code 默认 skills 目录：

```
ln -s ~/Documents/My-work-repo/skills/copyStyle ~/.claude/skills/copyStyle
```

## 触发

- `/copyStyle`
- 复制风格 / 提取设计语言
- "从这张截图复制风格"
- "为 cursor.com 生成一个 design skill"
- "基于 raycast 创建设计语言"

会话中说出以上任一触发词，主对话即按 `SKILL.md` 流程进入分析。

## examples 目录

`examples/` 下有 17 个示例（16 个虚构 + 1 个真实 `meadow`），每个包含 `design-model.yaml` + `landing-page.html`，`ridge` / `stint` 另有 `app-screen.html`，`halcyon` 另有完整 `component-library.html`。可在浏览器直接打开查看渲染效果。

| brand | character |
|---|---|
| atlas | ivory engineering, classical maritime charts |
| auris | premium audio, monochrome dark |
| drift | hot pink fashion commerce |
| fizz | y2k pop photo-sharing, candy chrome |
| halcyon | cool teal sculptural glass |
| kiln | dark fired earth, molten terracotta |
| ledger | newsprint editorial, financial broadsheet |
| meadow | warm cream editorial (real, from mymind-design) |
| orivion | luminous red-violet glow |
| oxide | brutalist mono compute protocol |
| prism | cyberpunk holographic shader engine |
| relay | swiss transit, departure board precision |
| ridge | slate emerald dev platform |
| solvent | warm amber generative shader |
| stint | muted violet productivity |
| thrive | sage green wellness, light mode |
| velvet | noir editorial fragrance house |

## License

MIT（保留上游 dominikmartn/hue 的 MIT 许可证条款）。可自由 fork、改造。
