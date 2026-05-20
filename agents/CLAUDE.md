# Agent 编排与 KPI 考核规则

当任务需要多 Agent 协作时，遵循本文件中的 KPI 考核流转规则，确保每个阶段不卡住。

## 可用 Agent 列表

| Agent | 职责 | 输入 | 输出 |
|-------|------|------|------|
| req-agent | 需求分析 | 用户原始描述 | 需求规格说明.md |
| ux-agent | UX 设计 (Figma) | 需求文档 + DESIGN.md | Figma 设计链接 |
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

若工作流需要的 Agent 在 `/Users/fangcang/.claude/agents/` 下不存在：
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
- 卡住方案用户全部否决 → 请求人工介入
- 严禁在 KPI 未验证的情况下标记任务完成

## 标准工作流

完整流程参见 `workflows/standard-flow.md`。

快速流转检查清单：
```
req-agent KPI ✓ → ux-agent KPI ✓ → front-agent KPI ✓ → back-agent KPI ✓ → test-agent KPI ✓ → github-agent KPI ✓
```
