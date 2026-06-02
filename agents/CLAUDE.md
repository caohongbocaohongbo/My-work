# Agent 编排与 KPI 考核规则

当任务需要多 Agent 协作时，遵循本文件中的 KPI 考核流转规则，确保每个阶段不卡住。

## 可用 Agent 列表

| Agent | 职责 | 输入 | 输出 |
|-------|------|------|------|
| req-agent | 需求分析 | 用户原始描述 | 需求规格说明.md |
| ux-agent | UX 设计 (Figma) | 需求文档 + DESIGN.md | Figma 设计链接 |
| design-director | 设计审查 (Figma) | ux-agent 的 Figma 链接 + DESIGN.md | 审查报告.md + PASS/FAIL 判定 |
| front-agent | 前端开发 | Figma 链接 + 需求文档 | index.html + 还原度对比表 |
| back-agent | 后端设计 | 需求文档 | API 文档 + DB Schema |
| test-agent | 联调测试 | 前后端产物 | 测试报告.md |
| github-agent | 部署发布 | 源码 | 部署报告.md |
| project-conductor | 主控编排 | 用户需求 | 全流程调度 + KPI 检查 |

## 核心规则

### 1. KPI 考核不得跳过

每个 Agent 完成后，**必须对照 KPI 控制表逐项检查**，达标才可进入下一阶段。

### 2. 卡住处理流程

当任一 Agent 出现以下情况时判定为卡住：
- 同一 Agent 连续 2 次 KPI 不达标
- 单步执行超时（>25 分钟）
- Agent 返回错误且自身无法修复

**卡住后必须立即执行**：
1. 分析卡住原因，给出 **按执行项目领域相关度的最优建议降序排列**（至少 3 个方案）
2. 每个方案包含：建议描述、预估成功率、所需时间、风险点
3. 提交给用户选择决策，**不得擅自跳过或降低标准**
4. 用户选定方案后继续执行

### 3. KPI 控制表

| Agent | KPI 指标 | 达标标准 | 最多重试 |
|-------|----------|----------|----------|
| req-agent | 需求覆盖度 | ≥95% | 3 次 |
| ux-agent | 设计方案确认 + DESIGN.md 读取 | 用户确认 + ≥2 方案 | 3 次 |
| design-director | 设计合规度 >=99% + 高危违规=0 + 组件使用率 100% + 审查报告已输出 | 综合合规度数值 + 高危违规数 + 组件使用率 + 审查报告 8 章节完整 | 2 次 |
| front-agent | UI 还原度 + 对比表 | ≥95% + 对比表已输出 | 3 次 |
| back-agent | API 契约符合需求 | 功能接口覆盖率 100% | 3 次 |
| test-agent | 功能覆盖率 | ≥95% | 3 次 |
| github-agent | 发布可访问 | 在线 URL 正常 | 2 次 |

### 4. 建议降序排列模板

当卡住时，按以下格式输出建议：

```markdown
## 卡住诊断：<Agent名称> - <卡住原因>

### 建议方案（按推荐度降序）

1. **[方案名称]**（推荐）
   - 描述：<具体操作>
   - 预估成功率：<百分比>
   - 所需时间：<估计>
   - 风险：<潜在风险>

2. **[备选方案]**
   - ...

3. **[兜底方案]**
   - ...

### 请选择方案或提供其他指示
```

### 5. 子 Agent 缺失处理

若工作流需要的 Agent 在 `${CLAUDE_HOME}/.claude/agents/` 下不存在：
1. 自行创建对应 Agent 目录，包含 `README.md`（职责 + KPI + 技能列表）
2. 在 `skills/` 子目录下创建所需技能文件
3. 将新 Agent 注册到本文件的 Agent 列表中
4. 按标准流程调用执行

### 6. Skill 按需加载策略

**Skill 是 Agent 的工具箱，不是会话默认配件。** 默认不加载任何 skill，由 Agent 在任务启动时按需声明和加载。

#### 加载原则

- **默认零加载**：会话启动时不自动加载 skill，节省 token 给实际任务
- **Agent 显式声明**：Agent 执行任务前，分析所需能力，显式通过 `Skill` 工具加载对应 skill
- **用完即释放**：skill 使用完毕后不保留在上下文，下次需要时重新加载
- **禁止预加载**：不得"可能用到就提前加载"，只在确定需要时加载

#### 各 Agent 推荐 Skill 清单

| Agent | 常需 Skill | 加载时机 |
|-------|-----------|----------|
| req-agent | 无（纯文本分析） | — |
| ux-agent | figma-use, figma-generate-design, design-md | 开始 Figma 设计时 |
| design-director | figma-use, style-design, design-system | 开始 Figma 设计审查时 |
| front-agent | frontend-design, ui-ux-pro-max, gsap-advanced-animation | 开始前端编码时 |
| back-agent | 无（纯后端设计） | — |
| test-agent | agent-browser | 需要浏览器测试时 |
| github-agent | 无 | — |
| project-conductor | 无（纯编排） | — |

#### 禁止行为

- **禁止一次性加载所有 skill** — 只加载当前阶段需要的
- **禁止 skill 链式预加载** — 不能"当前阶段加载下个阶段的 skill"
- **禁止空载运行** — Agent 启动时必须检查是否有多余 skill 占用上下文

### 7. 重试与人工介入

- 同一 Agent 连续 3 次 KPI 不达标 → **暂停流程** + 输出错误报告 + 请求人工介入
- **design-director 特殊规则**：同一设计稿连续 2 次审查不通过 → 暂停 + 输出升级报告 + 请求人工介入（设计阶段返工成本高，比普通 Agent 少 1 次重试机会）
- 卡住方案用户全部否决 → 请求人工介入
- 严禁在 KPI 未验证的情况下标记任务完成

## 标准工作流

完整流程参见 `workflows/standard-flow.md`。

快速流转检查清单：
```
req-agent KPI ✓ → ux-agent KPI ✓ → design-director KPI ✓ → front-agent KPI ✓ → back-agent KPI ✓ → test-agent KPI ✓ → github-agent KPI ✓
```

### 8. Agent 内部 Skill 查找规则（去重后）

以下 Skill 与 `skills/` 去重后仅保留在 Agent 子目录中：

| Skill | 所在 Agent |
|-------|-----------|
| `frontend-design` | `front-agent/skills/` |
| `ui-ux-pro-max` | `front-agent/skills/` |
| `interaction-design` | `ux-agent/skills/` |
| `design-spec-compliance` | `design-director/skills/` |
| `component-consistency-check` | `design-director/skills/` |
| `design-review-report` | `design-director/skills/` |

当 Agent 需要某个 Skill 时，按以下层级查找：

```
需要 Skill: <name>
├── 1. ${CLAUDE_HOME}/.claude/skills/<name>/          ← 先查 skills/
├── 2. ${CLAUDE_HOME}/.claude/agents/*/skills/<name>  ← 再查 agent 内部
├── 3. ${CLAUDE_HOME}/.claude/skills-archive/<name>/  ← 最后查归档
└── 未找到 → 使用 find-skills 搜索或 skill-creator 创建
```

所有 Agent 在执行任务前应检查所需 Skill 是否已在上下文中；若缺失则从上述路径加载。

快速流转检查清单：
```
req-agent KPI ✓ → ux-agent KPI ✓ → design-director KPI ✓ → front-agent KPI ✓ → back-agent KPI ✓ → test-agent KPI ✓ → github-agent KPI ✓
```
