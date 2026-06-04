# My Work — Agent + Skills 工作流仓库（Claude Code 使用说明）

本仓库是个人 AI 辅助设计/开发工作流的**完整可移植配置**。当本机 `~/.claude/` 与本仓库同步且 Claude Code 读取到这份 `CLAUDE.md` 时，必须遵守下面的协作规则。

公开文档与 GitHub Pages：https://caohongbocaohongbo.github.io/My-work/

## 仓库结构

```
My-work-repo/
├── bootstrap.sh                # 新机器一键接管脚本
├── README.md                   # 公开文档
├── CLAUDE.md                   # 本文件
├── config/
│   ├── global-CLAUDE.md        # 全局规则（→ ~/.claude/CLAUDE.md）
│   ├── strategies/             # 按需启用三策略
│   ├── mcp.json                # MCP 入口
│   ├── settings.local.json     # 权限/hook/状态栏（运行态）
│   └── settings.reference.json # env 脱敏模板
├── scripts/                    # 按需启用与同步脚本
├── agents/                     # 5 个常驻 Agent
├── skills/                     # Skills 工具箱
├── presets/                    # 按需启用预设
│   ├── mcp/
│   └── agents/
└── design-system/              # 71 个品牌设计系统
```

## 核心协作约束（强制）

### 1. 按需启用
- 不预加载任何 MCP / Skill / 非常驻 Agent
- 触发关键字命中后通过 `scripts/context-on-demand.sh` 启用
- 任务结束主动询问用户是否回收
- 详见 `config/strategies/{mcp,skill,agent}-strategy.md`

### 2. 子代理摘要回传
- 子代理完成必须返回 ≤200 字摘要：**产出 / 未决 / 下一步**
- SubagentStop hook 已注入提示，所有子代理共享

### 3. 备份统一规则
- 唯一位置：`~/.claude/backups/`
- 命名：`{智能体名}_{备份概要}_{YYYYMMDD}_v{版本号}.{扩展名}`
- 严禁在原文件旁生成 `.bak` / `.orig` / `_副本`
- 同对象保留最近 3 个版本

### 4. 输出与设计约束
- 所有回复中文输出，所有 `.md` 文档中文输出
- 禁止 emoji，使用 SVG
- UI 设计在 Figma 或 Pencil 中操作

### 5. 跨智能体协作机制
- 全部主对话和子代理共享 `~/.claude/CLAUDE.md` + 三策略文档 + 同一备份位置 + 同一 hook 链
- Agent ≠ Skill：Agent 是执行体（`agents/`），Skill 是工具箱（`skills/`）

## 自动同步与移植

- Stop hook → `~/.claude/sync-to-github.sh`：每次会话结束自动 push
- 推送前 `settings.json` 中的 API token 自动脱敏为 `<FILL_ME_IN>`
- 新机器 `bash bootstrap.sh` 即可完整接管

## 不同步的内容（保持本地）

- `~/.claude/backups/` — 本地备份产物
- `~/.claude/sessions/` `~/.claude/history.jsonl` `~/.claude/projects/` — 会话级运行态
- 任何 `.bak*` / `.tmp` / `.orig` 文件
