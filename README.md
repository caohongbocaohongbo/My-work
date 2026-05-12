# My Work — AI 辅助设计开发工作流

[![Pages](https://img.shields.io/badge/GitHub%20Pages-My--work-10b981?style=classic)](https://caohongbocaohongbo.github.io/My-work/)

个人 AI 辅助设计与开发工作流配置仓库，包含 **Agents**（智能体）、**Skills**（技能）和 **DESIGN.md** 设计系统集合。

## 核心组成

### Agents（智能体）

7 个专业 Agent，通过 KPI 考核流转机制协作完成从需求分析到部署发布的完整链路：

- **project-conductor** — 主控编排，调度全流程
- **req-agent** — 需求分析与拆解
- **ux-agent** — UX 设计（Figma/Pencil）
- **front-agent** — 前端代码生成
- **back-agent** — 后端 API 与数据库设计
- **test-agent** — 联调测试与质量检查
- **github-agent** — 部署发布

### Skills（技能）

30+ 可复用技能，覆盖 Figma 设计、前端动效、UI/UX 审查、设计系统搭建等领域。Agent 可自由组合 Skills 完成任务。

### DESIGN.md（设计系统）

71 个知名品牌/产品的完整设计系统文档，包含色彩、排版、组件样式、布局原则等规范。AI Agent 可直接读取并生成像素级一致的 UI。

## 快速开始

1. 克隆仓库：`git clone https://github.com/caohongbocaohongbo/My-work.git`
2. 将 `CLAUDE.md` 内容合并到你的项目 `CLAUDE.md` 中
3. 选择目标品牌的 `DESIGN.md`，告诉 AI Agent："按照这个设计规范构建页面"

## 在线访问

GitHub Pages：https://caohongbocaohongbo.github.io/My-work/

## 自动同步

本地 `~/.claude/agents/`、`~/.claude/skills/` 和 `~/Documents/My-design-systen/` 目录更新时，自动推送至本仓库。

## 许可证

MIT License — 详见 [LICENSE](LICENSE)
