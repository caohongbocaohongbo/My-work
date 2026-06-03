# Agent 编排与 KPI 考核规则

当任务需要多 Agent 协作时，遵循本文件中的 KPI 考核流转规则，确保每个阶段不卡住。

## 可用 Agent 列表（当前活跃）

| Agent | 职责 | 输入 | 输出 |
|-------|------|------|------|
| ux-agent | UX 设计 (Figma) | 需求文档 + DESIGN.md | Figma 设计链接 |
| design-director | 设计审查 (Figma) | Figma 链接 + DESIGN.md | 审查报告.md + PASS/FAIL |
| front-agent | 前端开发 | Figma 链接 + 需求文档 | index.html + 还原度对比表 |
| self-improving-agent | 自我优化 | 任务反馈 | 学习记录 |

## 已归档 Agent（按需恢复）

以下 agent 已归档至 `~/.claude/agent-presets/`，需要时运行恢复命令：

| Agent | 关键词 | 恢复命令 |
|-------|--------|----------|
| req-agent | 需求分析/需求文档 | `~/.claude/scripts/context-on-demand.sh enable agent req-agent` |
| back-agent | 后端/API/数据库 | `~/.claude/scripts/context-on-demand.sh enable agent back-agent` |
| test-agent | 测试/联调/回归 | `~/.claude/scripts/context-on-demand.sh enable agent test-agent` |
| github-agent | 部署/发布/GitHub | `~/.claude/scripts/context-on-demand.sh enable agent github-agent` |
| project-conductor | 多 agent 编排/全流程 | `~/.claude/scripts/context-on-demand.sh enable agent project-conductor` |
| agent-browser | 浏览器自动化测试 | `~/.claude/scripts/context-on-demand.sh enable agent agent-browser` |

## 核心规则

### 1. KPI 考核不得跳过

## 核心规则

### 1. KPI 考核不得跳过

每个 Agent 完成后，**必须对照 KPI 控制表逐项检查**，达标才可进入下一阶段。

### 2. 卡住处理流程

当任一 Agent 连续 2 次 KPI 不达标、超时或无法自修复时，输出至少 3 个按推荐度降序排列的方案，提交用户决策，**不得擅自跳过**。

### 3. KPI 控制表（活跃 Agent）

| Agent | 达标标准 | 最多重试 |
|-------|----------|----------|
| ux-agent | 用户确认设计方案 + ≥2 方案 + DESIGN.md 已读 | 3 次 |
| design-director | 合规度 ≥99% + 高危违规=0 + 审查报告 8 章节完整 | 2 次 |
| front-agent | UI 还原度 ≥95% + 对比表已输出 | 3 次 |

### 4. Skill 按需加载

- 默认零加载，Agent 显式声明所需 skill 后才加载
- ux-agent 常用：figma-use、figma-generate-design
- design-director 常用：figma-use、style-design
- front-agent 常用：frontend-design、ui-ux-pro-max
- 禁止打包加载、禁止 skill 链式预加载

### 5. 已归档 Agent 恢复

若工作流需要已归档 agent，先运行：
`~/.claude/scripts/context-on-demand.sh enable agent <名称>`
再重启 Claude Code 或新开会话后执行任务。

### 6. Agent 缺失处理

若所需 agent 不在 `~/.claude/agents/` 也不在 `~/.claude/agent-presets/`，使用 README.md 自行创建后注册到本文件。

## 标准工作流

完整流程参见 `workflows/standard-flow.md`。
