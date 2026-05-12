# My Work — Agent + Skills 工作流仓库

本仓库是个人 AI 辅助设计/开发工作流的完整配置，包含 Agents、Skills 和 DESIGN.md 设计系统集合。

在线访问地址：https://caohongbocaohongbo.github.io/My-work/

## 仓库结构

```
My-work/
├── CLAUDE.md              # 本文件 — Claude Code 使用说明
├── README.md              # 公开文档
├── agents/                # Agent 定义（含 KPI 考核规则）
│   ├── CLAUDE.md          # Agent 编排规则
│   ├── project-conductor/ # 主控编排 Agent
│   ├── req-agent/         # 需求分析 Agent
│   ├── ux-agent/          # UX 设计 Agent (Figma/Pencil)
│   ├── front-agent/       # 前端开发 Agent
│   ├── back-agent/        # 后端设计 Agent
│   ├── test-agent/        # 联调测试 Agent
│   ├── github-agent/      # 部署发布 Agent
│   └── workflows/         # 标准工作流定义
├── skills/                # 可复用 Skills（Agent 可自由调用）
│   ├── CLAUDE.md          # Skills 使用与管理规则
│   ├── figma-*/           # Figma 相关 Skills
│   ├── design-*/          # 设计系统相关 Skills
│   ├── frontend-*/        # 前端相关 Skills
│   ├── ux-*/              # UX 相关 Skills
│   └── ...                # 更多 Skills
├── design-system/         # DESIGN.md 设计系统集合（71 个品牌）
│   ├── README.md          # 使用说明
│   └── design-md/         # 各品牌 DESIGN.md 文件
├── CONTRIBUTING.md        # 贡献指南
├── LICENSE                # MIT 许可证
└── .github/               # GitHub 配置
```

## 使用方式

### 1. 标准工作流

当用户提出需求时，project-conductor 自动编排 Agent 链路：

```
用户需求 → req-agent → ux-agent → front-agent → back-agent → test-agent → github-agent
              ↓ KPI       ↓ KPI       ↓ KPI         ↓ KPI        ↓ KPI         ↓ KPI
```

每个 Agent 完成后需通过 KPI 考核才进入下一阶段。

### 2. Agent + Skills 自由搭配

执行任务时，Agent 可根据实际需要自由组合 Skills。典型组合：

| 任务类型 | Agent | 搭配 Skills |
|----------|-------|-------------|
| Figma 设计任务 | ux-agent | figma-use + figma-generate-design + design-md |
| 前端动效开发 | front-agent | gsap-advanced-animation + make-interfaces-feel-better + emil-design-eng |
| UI 审查 | front-agent | web-design-guidelines + ui-ux-pro-max + interaction-design |
| 设计系统搭建 | ux-agent | design-system + figma-generate-library + design-md |
| 新品牌 DESIGN.md | any | design-md + agent-reach + style-design |
| 后端 API 设计 | back-agent | api-design + database-schema |

### 3. DESIGN.md 使用

当需要特定品牌风格的 UI 时：

1. 从 `design-system/design-md/<品牌名>/DESIGN.md` 选择目标品牌
2. 将 DESIGN.md 复制到工作目录
3. 告诉 Agent："按照 DESIGN.md 的设计规范构建页面"

### 4. Skill 缺失处理

当需要的能力在 skills/ 下不存在时：
- `find-skills` → 搜索互联网现有 Skill
- `skill-creator` → 创建新 Skill 并注册到系统

## 本地同步更新

本地对应目录与 GitHub 仓库自动同步：

| 本地路径 | 仓库路径 |
|----------|----------|
| `~/.claude/agents/` | `agents/` |
| `~/.claude/skills/` | `skills/` |
| `~/Documents/My-design-systen/` | `design-system/` |

当本地文件有更新时，自动推送至 GitHub 仓库。
