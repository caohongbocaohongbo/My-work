# Standard Flow（标准工作流）

## 概述

端到端项目交付流程：需求 → 设计 → 前端 → 后端 → 测试 → 部署。

## 前置条件

- 用户已提供项目原始需求描述
- `agents/` 目录下所有 agent 和 skill 文件已就绪

## 执行流程

### 阶段 0：项目初始化

1. 确认项目名称和技术栈
2. 创建工作目录（如 `/Users/fangcang/Documents/projects/<project-name>/`）
3. 输出目录下创建 `requirements/`、`design/`、`frontend/`、`backend/`、`tests/`、`deploy/` 子目录
4. 记录开始时间戳：`START_TIME=$(date +%s)`

---

### 阶段 1：需求分析（req-agent）

**执行者**：req-agent
**输入**：用户原始需求描述
**输出**：`requirements/需求规格说明.md`

**步骤**：
1. 读取 `req-agent/README.md`
2. 依次执行 skills：
   - `requirement-extract.md` → 提取需求点
   - `pseudo-demand-filter.md` → 过滤伪需求
   - `superpower-analysis.md` → 完善需求
3. 汇总生成 `需求规格说明.md`

**KPI 检查**：
- [ ] 需求覆盖度 ≥95%（逐条比对原始输入）
- [ ] 每个功能有明确的验收标准
- [ ] 非功能需求已记录

**未达标**：返回 req-agent 修正（最多 3 次）

**继续条件**：覆盖度 ≥95%

---

### 阶段 2：UX 设计（ux-agent）

**执行者**：ux-agent
**触发条件**：阶段 1（req-agent）KPI 达标（需求覆盖度 >=95%）

**前置检查（阻断点）**：
1. 检查项目根目录是否存在 `DESIGN.md`，存在则作为样式约束文档
2. 若 `DESIGN.md` 不存在，查找 `README.md` 作为替代参考
3. **两者都不存在 → 阻断流程**，通知用户添加至少一个参考文档
4. **例外**：用户明确说"不需要参照 DESIGN.md"或"忽略 DESIGN.md"时可跳过此检查

**输入**：
- `requirements/需求规格说明.md`
- `DESIGN.md` 或 `README.md`（**必须存在**，或用户明确跳过）
**输出**：Figma 设计文件链接（含 node-id）
```
https://figma.com/design/<fileKey>/<fileName>?node-id=<nodeId>
```

**步骤**：
1. 读取 `ux-agent/README.md`
2. 依次执行 skills：
   - `wireframe-pencil.md` → 布局方案（≥2 个）
   - `style-theme-tune.md` → 视觉主题（≥2 套）
   - `req-to-figma.md` → 在 Figma 中按方案逐页构建设计文件（核心）
3. 在 Figma 中创建设计文件，每个方案独立一个 Page
4. 搭建页面结构和 Auto Layout，填充模拟数据，覆盖核心交互状态

**方案要求**：
- [ ] 每次执行至少提供 ≥2 个设计方案
- [ ] 每个方案独立 Figma Page，方便对比
- [ ] 方案间有明显可对比的差异维度（配色/布局/组件风格等）

**KPI 检查**：
- [ ] DESIGN.md / README.md 已读取（或用户明确跳过）
- [ ] 设计方案与 DESIGN.md 中的样式约束一致
- [ ] 所有需求页面均已在 Figma 中创建（每个方案）
- [ ] 核心交互状态已覆盖（hover、active、disabled、loading、error、空态）
- [ ] 方案差异说明已输出
- [ ] 用户在 Figma 中手动对比、选择一个方案并确认（必须）

**未达标**：收集用户反馈，在 Figma 中直接修改（最多 3 次）

**继续条件**：用户确认选中方案 → 清理未选中方案 → 提取 node-id → 输出 Figma 链接给 front-agent

---

### 阶段 3：前端开发（front-agent）

**执行者**：front-agent
**输入**：
- Figma 设计文件链接（含 node-id，由 ux-agent 产出，用户已确认）
  - 通过 `get_design_context` 获取设计 token 和参考代码
  - 通过 `get_screenshot` 获取 Figma 设计截图，作为还原基准
- `requirements/需求规格说明.md`
**输出**：
- `frontend/index.html`（或分解为 `index.html` / `styles.css` / `app.js`）
- **还原度对比表**（必须输出，至少 20 项检查）

**步骤**：
1. 读取 `front-agent/README.md`
2. 通过 Figma 链接获取设计 context（`get_design_context`）+ 截图（`get_screenshot`）
3. 依次执行 skills：
   - `ui-restore.md` → 像素级还原 Figma 设计
   - `responsive-layout.md` → 响应式适配
   - `api-render.md` → API 对接（暂用 mock，待后端就绪后切换）
4. 生成 `index.html`

**KPI 检查（硬性门禁，conductor 逐项核实）**：
- [ ] **还原度对比表已输出**（颜色/尺寸/字体/布局至少 20 项，缺失视为未完成）
- [ ] **UI 还原度 ≥95%**（conductor 核实对比表中各项评分）
- [ ] 桌面/平板/手机三端正常
- [ ] 所有交互功能可用

**未达标**：
1. 还原度对比表未输出 → 直接判定未完成，返回 front-agent
2. 还原度 < 95% → conductor 列出偏差项，返回 front-agent 修复
3. 每次修复后重新输出对比表 + 还原度分数
4. 最多 3 次修复循环

**门禁规则**：
```
生成代码 → 输出还原度对比表?
  ├── NO  → 未完成，返回修复
  └── YES → 还原度 ≥95%?
              ├── YES → 通过，进入下一阶段
              └── NO  → 修复代码（第 N 次）
                         ├── N ≤ 3 → 继续
                         └── N > 3 → 暂停，人工介入
```

**继续条件**：还原度对比表已输出 + 还原度 ≥95%

---

### 阶段 4：后端设计（back-agent）

**执行者**：back-agent
**输入**：`requirements/需求规格说明.md`
**输出**：
- `backend/API接口文档.md`
- `backend/数据库Schema.md`

**步骤**：
1. 读取 `back-agent/README.md`
2. 依次执行 skills：
   - `database-schema.md` → 数据模型
   - `api-design.md` → API 规范
   - `sdk-generation.md` → SDK 代码（可选）
3. 输出 API 文档和数据库 Schema

**KPI 检查**：
- [ ] API 端点与需求功能一一对应（100% 覆盖）
- [ ] 数据模型支持所有功能
- [ ] 请求/响应格式规范统一
- [ ] 错误码完整定义
- [ ] 功能接口覆盖率 100%

**未达标**：返回 back-agent 修正（最多 3 次）

**继续条件**：API 契约 100% 符合需求 + 功能接口覆盖率 100%

---

### 阶段 5：联调测试（test-agent）

**执行者**：test-agent
**输入**：
- `frontend/index.html`
- `backend/API接口文档.md`
- `requirements/需求规格说明.md`
**输出**：`tests/测试报告.md`

**步骤**：
1. 读取 `test-agent/README.md`
2. 依次执行 skills：
   - `api-test.md` → API 端点测试
   - `data-accuracy.md` → 数据准确性与功能接口覆盖率
   - `regression-check.md` → 回归测试（如适用）
3. 汇总生成 `测试报告.md`

**KPI 检查**：
- [ ] 功能覆盖率 ≥95%
- [ ] API 端点 100% 覆盖
- [ ] 数据准确性问题 0 个
- [ ] 核心业务流程端到端通过

**未达标**：
1. 列出失败用例，通知对应 agent（front/back）
2. agent 修复后重新提交
3. test-agent 运行 `regression-check.md`
4. 重新评估覆盖率（最多循环 3 次）

**继续条件**：覆盖率 ≥95%

---

### 阶段 6：部署发布（github-agent）

**执行者**：github-agent
**输入**：
- `frontend/index.html` 及其他源码
- `backend/` 目录内容（如有）
**输出**：`deploy/部署报告.md`

**步骤**：
1. 读取 `github-agent/README.md`
2. 依次执行 skills：
   - `repo-create.md` → 创建仓库并推送
   - `deploy-free-service.md` → 部署到免费平台
   - `auto-pr.md` → 创建 PR（可选）
3. 生成 `部署报告.md`

**KPI 检查**：
- [ ] GitHub 仓库可公开访问
- [ ] 在线预览地址可访问
- [ ] 所有页面/功能在线上正常
- [ ] HTTPS 正常

**失败处理**：换平台重试（最多 2 次）

**继续条件**：发布成功且可访问

---

## 超时与异常处理

### 单步超时（>25 分钟）

在每步执行时，conductor 持续监控耗时：

1. 开始时间 = 当前时间戳
2. 每 60 秒检查：当前时间 - 开始时间 > 1500 秒？
3. 超时 → 中断当前 agent → 运行 `resolve-deadlock.md`
4. 根据诊断结果：重试 / 拆分任务 / 跳过 / 人工介入

### 连续不达标（≥3 次）

同一 agent 连续 3 次不达标：
1. 暂停整个流程
2. 生成错误报告（含每次失败原因和尝试的修正）
3. 输出到 `error-report.md`
4. 请求人工介入

### 人工介入触发条件

- 同一 agent 连续 3 次不达标
- resolve-deadlock 无法解决卡住问题
- 用户主动中断流程
- 发现安全/合规等需要人类决策的问题

---

## 上下文传递模板

每次调用 subagent 时，conductor 传递以下信息：

```markdown
## 当前任务
[具体要做什么]

## 用户原始需求
[原始需求摘要]

## 上游输出
- 文件路径: [上一阶段输出文件]
- 关键信息: [摘录]

## KPI 目标
- 指标: [具体数值]
- 达标标准: [如何判定]

## 约束
- 技术栈: [如有]
- 时间限制: 25 分钟
- 其他: [如有]
```

---

## 流程状态文件

在整个流程中，维护一个 `workflow-status.json` 记录进度：

```json
{
  "project": "项目名称",
  "startedAt": "2026-05-06T10:00:00Z",
  "stages": {
    "req": { "status": "completed", "attempts": 1, "output": "requirements/需求规格说明.md" },
    "ux": { "status": "in_progress", "attempts": 2, "output": null },
    "front": { "status": "pending", "attempts": 0, "output": null },
    "back": { "status": "pending", "attempts": 0, "output": null },
    "test": { "status": "pending", "attempts": 0, "output": null },
    "github": { "status": "pending", "attempts": 0, "output": null }
  },
  "errors": []
}
```
