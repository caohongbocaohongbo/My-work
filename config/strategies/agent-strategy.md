# Agent 加载策略

## 核心原则
- Agent 全部按需加载，无常驻
- 仅任务明确需要时由主 Agent 声明并加载
- 禁止预加载或语义匹配自动启用

## Agent ≠ Skill
- **Agent** = 独立执行体（自带上下文窗口），位于 `~/.claude/agents/`
- **Skill** = Agent/主对话调用的工具箱，位于 `~/.claude/skills/`
- `ui-ux-pro-max`、`copyStyle`、`frontend-design`、`interaction-design`、`ux-research`、`gsap-advanced-animation` 是 **Skill**，不在本文档管辖（见 `skill-strategy.md`）

## 权威源
- 已安装 Agent：`~/.claude/agents/`
- 可恢复预设：`~/.claude/agent-presets/`
- 实时查询：`~/.claude/scripts/context-on-demand.sh list`

## 当前清单

### 已安装（不预加载，按需调用）
| Agent | 用途 |
|-------|------|
| `design-director` | 设计总监 / 整体方向 |
| `front-agent` | 前端实现 |
| `ux-agent` | UX 设计执行 |
| `self-improving-agent` | 经验沉淀到 `.learnings/` |
| `workflows` | 工作流编排 |

### 可恢复预设
| Agent | 关键字 | 启用 |
|-------|--------|------|
| `req-agent` | 需求、PRD | `context-on-demand.sh enable agent req-agent` |
| `back-agent` | 后端、API、数据库 | `context-on-demand.sh enable agent back-agent` |
| `test-agent` | 测试、联调、回归 | `context-on-demand.sh enable agent test-agent` |
| `github-agent` | 部署、发布、GitHub | `context-on-demand.sh enable agent github-agent` |
| `project-conductor` | 多 Agent 编排 | `context-on-demand.sh enable agent project-conductor` |
| `agent-browser` | 浏览器自动化 | `context-on-demand.sh enable agent agent-browser` |

## 子代理协作
- 子 Agent 启动时**不预加载**其他 Agent
- 需协作时向主 Agent 声明再加载
- 并行独立任务用 `dispatching-parallel-agents` skill
- 子 Agent 完成必须回传 ≤200 字摘要（产出 / 未决 / 下一步）

## 回收
- 已安装 Agent 不轻易归档
- 临时 enable 的预设用 `context-on-demand.sh disable agent <名称>` 归档
