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

## 启用/归档三件套联动（重要 · 避免"归档态无法启用"）

`Unknown skill` 的根因：物理目录、`skillOverrides` 级别、策略文档三者脱节。任一层不同步都会导致 skill 找不到或不触发。启用一个 skill 必须**三层同步**：

| 层 | 动作 | 校验 |
|----|------|------|
| ① 物理目录 | `enable skill <名>`（archive → `~/.claude/skills/`，含 data/scripts 全目录） | `ls ~/.claude/skills/<名>` 有实体 |
| ② override 级别 | `settings.local.json` 改为 `name-only`（关键字触发）或删除该键（默认 ON） | 查询脚本可见目标级别 |
| ③ 策略/README 文档 | 在对应 agent README + 本文件登记触发关键字 | 关键字表含该 skill |

> `context-on-demand.sh enable skill` **只做 ①**，不改 ②③——这正是历史上 `ui-ux-pro-max` / `gsap-advanced-animation` 搬到激活目录却仍 `user-invocable-only`、且 SKILL.md 声明 `conditional-auto` 与 override 打架的原因。启用后务必手动补 ②③。

**归档时反向三层**：`disable skill` 搬回 archive → override 恢复 `user-invocable-only` → 文档关键字表移除。

## 前端 Skill 归属（front-agent）
- `frontend-design`（name-only）：前端/界面/组件实现
- `ui-ux-pro-max`（name-only）：UI 风格/配色/字体/交互；prompt 有 DESIGN.md / Figma 链接 / copyStyle 时**不加载**
- `gsap-advanced-animation`（name-only）：GSAP/滚动/时间轴/卷轴动效
- 关键字明细见 `agents/front-agent/README.md` 与 `agents/CLAUDE.md` 第 4 条

## 新增 Skill 时
1. 默认设 `name-only`，避免污染 token 基线
2. 仅当 description 是命中必需时才默认 ON
3. 改动后用 `/context` 复核 token 变化

## Skill ≠ Agent
- `ui-ux-pro-max`、`copyStyle`、`hotel-admin-blue` 是 Skill（工具箱），不是 Agent（执行体）
- Agent 在 `~/.claude/agents/`，Skill 在 `~/.claude/skills/`
