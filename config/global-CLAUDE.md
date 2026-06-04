# Global CLAUDE.md

## 固定配置

- **Permission Mode**: `bypassPermissions`（Figma/Pencil 设计工作无需确认）
- **语言**: Claude Code 所有回复必须中文输出；所有 `.md` 文档必须中文输出
- **设计约束**: 禁止 emoji，使用 SVG；UI 设计必须在 Figma 或 Pencil 中操作

## 多项目工作区

当前工作空间包含多个独立项目，修改前先确认目标子项目。

各项目的工作规则与启动命令见项目本地文档：
- `Documents/trae_projects/` — Vue 3 + Vite 前端
- `Downloads/素材/ai-goofish-monitor-master/` — Python 爬虫 + AI 分析
- `new-france/` — 股票监控系统

## 动态配置（按需加载）

| 关键字 | 文件 | 何时加载 |
|--------|------|---------|
| mcp、figma、pencil、cinema4d | `~/.claude/config/mcp-strategy.md` | MCP 启动时 |
| skill、skill-creator | `~/.claude/config/skill-strategy.md` | Skill 配置时 |
| agent、ui-ux、frontend | `~/.claude/config/agent-strategy.md` | Agent 工作时 |

## 备份统一规则（强制 · 所有智能体共用）

- **唯一备份位置**：`~/.claude/backups/`
- **禁止**在原文件旁生成 `.bak`、`.orig`、`_副本` 等散落备份
- **命名格式**：`{智能体名}_{备份概要}_{YYYYMMDD}_v{版本号}.{原扩展名}`
  - 智能体名：主对话用 `main`；子代理用其名（如 `front-agent`、`design-director`）；脚本/工具用脚本名（如 `mcp-cleanup`）
  - 备份概要：被备份对象 + 动作，短横线连接（如 `mcp-config-before-edit`、`settings-local-rollback`）
  - 日期：本地日期 `YYYYMMDD`
  - 版本号：当日同对象第 N 次备份，从 `v1` 起
  - 示例：`main_settings-local-before-mcp-cleanup_20260604_v1.json`
- **执行前**先 `mkdir -p ~/.claude/backups/` 兜底
- **保留策略**：同对象保留最近 3 个版本，更老的由生成方在写入新备份时清理
