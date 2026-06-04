# My Work — AI 辅助设计开发工作流

[![Pages](https://img.shields.io/badge/GitHub%20Pages-My--work-10b981?style=classic)](https://caohongbocaohongbo.github.io/My-work/)

个人 AI 辅助设计/开发工作流的**完整可移植配置仓库**。一台电脑配好，新机器一键接管，所有智能体共用同一套**按需启用 + token 优化 + 统一备份**机制。

## 三层协作机制

### 1. 按需启用（省 token）
- **MCP / Skill / Agent 全部按需加载**，不预启动
- 策略权威源：`config/strategies/{mcp,skill,agent}-strategy.md`
- 加载/卸载入口：`scripts/context-on-demand.sh`

### 2. 上下文摘要回传
- 子代理完成必须回传 ≤200 字摘要（产出 / 未决 / 下一步）
- 通过 SubagentStop hook 强制提示

### 3. 跨智能体共用规则
- 全局规则：`config/global-CLAUDE.md`（中文输出、禁 emoji、备份命名等）
- 所有主对话和子代理共享同一套权限、hook、备份位置

## 仓库结构

```
My-work-repo/
├── bootstrap.sh                # 新机器接管脚本
├── config/
│   ├── global-CLAUDE.md        # 全局规则（→ ~/.claude/CLAUDE.md）
│   ├── strategies/             # 按需启用三策略（→ ~/.claude/config/）
│   │   ├── mcp-strategy.md
│   │   ├── skill-strategy.md
│   │   └── agent-strategy.md
│   ├── mcp.json                # MCP 服务定义（→ ~/.claude/mcp.json）
│   ├── settings.local.json     # 权限/hook/状态栏（→ ~/.claude/settings.local.json）
│   └── settings.reference.json # env 模板（脱敏，新机器需填 token）
├── scripts/                    # 按需启用脚本（→ ~/.claude/scripts/）
│   ├── context-on-demand.sh    # MCP/Skill/Agent 启用/禁用
│   ├── cinema4d-mcp-enable.sh
│   ├── cinema4d-mcp-disable.sh
│   ├── open-design-mcp.sh
│   └── sync-to-github.sh       # Stop hook 入口
├── agents/                     # 5 个常驻 Agent（→ ~/.claude/agents/）
├── skills/                     # Skills 工具箱（→ ~/.claude/skills/）
├── presets/                    # 按需启用预设
│   ├── mcp/                    # pencil / open-design / stitch
│   └── agents/                 # req / back / test / github / project-conductor / agent-browser
└── design-system/              # 71 个品牌设计系统
```

## 新机器接管

```bash
git clone https://github.com/caohongbocaohongbo/My-work.git ~/Documents/My-work-repo
bash ~/Documents/My-work-repo/bootstrap.sh
# 编辑 ~/.claude/settings.json 填入 API key/token
# 重启 Claude Code
```

`bootstrap.sh` 会自动：
- 备份新机器上已有的 `~/.claude/` 同名文件到 `~/.claude/backups/`
- 安装全局 CLAUDE.md、策略文档、MCP 定义、脚本、预设
- 软链 `agents/` 和 `skills/` 到仓库（修改立即生效）
- 安装脱敏的 settings.json 模板

## Agent 体系

**5 个常驻**（`agents/`，按需调用不预加载）：
- `design-director` 设计总监 · `front-agent` 前端 · `ux-agent` UX · `self-improving-agent` 经验沉淀 · `workflows` 编排

**6 个按需**（`presets/agents/`，关键字触发或手动 enable）：
- `req-agent` 需求 · `back-agent` 后端 · `test-agent` 测试 · `github-agent` 部署 · `project-conductor` 全流程编排 · `agent-browser` 浏览器自动化

启用：`~/.claude/scripts/context-on-demand.sh enable agent <名称>`

## Skill 体系

30+ 可复用 Skills 在 `skills/`。展示级别由 `config/settings.local.json` 的 `skillOverrides` 控制：
- **默认 ON** — 高频核心（figma-use / token-optimizer 等）
- **name-only** — 中频，需 `/skill` 调用
- **user-invocable-only** — 低频隐藏，完全不占 token

## 备份统一规则

- 唯一位置：`~/.claude/backups/`
- 命名：`{智能体名}_{备份概要}_{YYYYMMDD}_v{版本号}.{扩展名}`
- 同对象保留最近 3 个版本

## 自动同步

`~/.claude/sync-to-github.sh` 通过 Stop hook 在每次会话结束时执行，自动把：
- `~/.claude/` 下的规则文件 / 策略 / 脚本 / 预设
- `~/Documents/My-design-systen/`

同步到本仓库并 push。`settings.json` 中的 API token 推送前自动脱敏。

## 在线访问

GitHub Pages：https://caohongbocaohongbo.github.io/My-work/

## 许可证

MIT License — 详见 [LICENSE](LICENSE)
