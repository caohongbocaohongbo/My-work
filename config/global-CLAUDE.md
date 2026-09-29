# Global CLAUDE.md

## 固定配置

- **Permission Mode**: `bypassPermissions`（Figma/Pencil 设计工作无需确认）
- **语言**: Claude Code 所有回复必须中文输出；所有 `.md` 文档必须中文输出
- **设计约束**: 禁止 emoji，使用 SVG；UI 设计必须在 Figma 或 Pencil 中操作

## 共享视觉工作流

`universal-design-production-workflow` 是用户授权的自动触发例外：按其 description 匹配视觉设计意图时读取入口，不要求显式点名。启动仅保留名称、描述和路径，正文与参考文档按阶段读取；该技能不受旧策略中“禁止语义自动加载”“启动技能列表为空”的限制。安装配置本技能不触发设计执行。

## 多项目工作区

当前工作空间包含多个独立项目，修改前先确认目标子项目。各项目工作规则与启动命令见项目本地文档：
- `Documents/trae_projects/` — Vue 3 + Vite 前端
- `Downloads/素材/ai-goofish-monitor-master/` — Python 爬虫 + AI 分析
- `new-france/` — 股票监控系统

## 动态配置（按需加载 · 命中关键字才读取）

加载方式：用户消息中出现下表关键字时，再 `Read` 对应文件。**读完直接执行，不向本文件回传摘要或日志**，保持本文件克制。

| 关键字 | 文件 |
|--------|------|
| mcp、figma、pencil、cinema4d | `~/.claude/config/mcp-strategy.md` |
| skill、skill-creator | `~/.claude/config/skill-strategy.md` |
| agent、ui-ux、frontend | `~/.claude/config/agent-strategy.md` |
| 备份、备份统一、备份位置、备份命名、目录创建、新建目录、mkdir、policy | `~/.claude/config/policy.md` |
