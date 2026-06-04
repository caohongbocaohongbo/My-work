# Skill 加载策略

## 核心原则
- Skill 是 Agent 的工具箱，不是会话的默认配件
- 禁止根据 Skill description 做语义匹配自动加载
- 仅 Agent 或用户显式指令时加载

## 权威源
**`~/.claude/settings.local.json` → `skillOverrides` 是唯一权威，文档不复制清单**

三级展示规则：

| 级别 | 含义 | 适用 |
|------|------|------|
| 未列出（默认 ON） | 完整 description 注入 | 高频核心：figma-use / figma-generate-design / token-optimizer / make-interfaces-feel-better |
| `name-only` | 仅暴露名称，需 `/skill` 才加载 | 中频：design-system / systematic-debugging / writing-plans |
| `user-invocable-only` | 完全隐藏，只能 `/skill` 调用 | 低频：emblem-market-research / hue / agent-browser |

实时清单查询：
```bash
python3 -c "import json; d=json.load(open('$HOME/.claude/settings.local.json'))['skillOverrides']; [print(f'{v:25} {k}') for k,v in sorted(d.items(), key=lambda x:x[1])]"
```

## 已归档 Skill
- 物理位置：`~/.claude/skills-archive/`（不进入 Skill 列表，不消耗 token）
- 启用：`~/.claude/scripts/context-on-demand.sh enable skill <名称>`
- 归档：`~/.claude/scripts/context-on-demand.sh disable skill <名称>`
- 查询：`~/.claude/scripts/context-on-demand.sh list`

## 新增 Skill 时
1. 默认设 `name-only`，避免污染 token 基线
2. 仅当 description 是命中必需时才默认 ON
3. 改动后用 `/context` 复核 token 变化

## Skill ≠ Agent
- `ui-ux-pro-max`、`copyStyle`、`hotel-admin-blue` 是 Skill（工具箱），不是 Agent（执行体）
- Agent 在 `~/.claude/agents/`，Skill 在 `~/.claude/skills/`
