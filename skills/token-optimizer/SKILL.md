---
name: token-optimizer
...
description: Token 消耗优化工具包。当需要降低 AI 使用成本、优化上下文窗口、减少 Token 浪费、组织代码库以适配 AI、或诊断 Token 消耗时使用。触发词包括"优化 Token"、"降低成本"、"上下文满了"、"Token 太多"、"组织代码"、"prompt 缓存"、"API 成本"等。涵盖文件组织、CLAUDE.md 优化、上下文管理、模型选择策略、MCP 管理、Prompt 架构、API 缓存 / Batch 等全部维度。所有建议均有实验数据支撑。
...
argument-hint: '[diagnose | optimize | audit]'
compatibility: Claude Code
...
license: MIT
...
metadata: author: amunozdev
version: 1.4.0
load_strategy: always
...
---


# Token Optimizer

一套全面的 Token 消耗优化工具包，适用于 **Claude Code 用户**（文件组织、CLAUDE.md、上下文卫生）和 **API 开发者**（Prompt 缓存、Batch API、Effort 调优、Prompt 架构）。建议均基于真实实验数据和 Anthropic 最新定价。

## 核心功能

### 1. 文件组织优化

影响力最高的单一优化。小而专注的文件可将 Token 消耗降低 18.2%，在聚焦任务上减少 92% 噪音。

**核心规则：**
- 文件最多 150 行 — 超过则按职责拆分
- 单一职责 — 一个文件只做一件事
- 描述性命名（kebab-case）— 文件名告诉 AI 里面是什么

**真实案例：** 修复邮件验证 Bug，单体文件需读取 814 行（49,466 Token），模块化后仅需 67 行（40,447 Token）— **节省 18.2%，噪音减少 92%**。

### 2. CLAUDE.md 优化

良好组织的 CLAUDE.md 可降低 Token 消耗 50-70%。

**关键原则：**
- 保持在 500 行以内 — 只放必要内容
- 具体明确 — "PostgreSQL + Prisma" 而非 "database"
- 包含项目结构和常用命令 — 省去 AI 猜测开销
- 使用触发词而非完整文档 — 引用 skills/文件获取详情

### 3. 上下文管理

Token 浪费通常来自累积的无关上下文，而非单次操作。

| 命令 | 使用时机 | 效果 |
|---------|-------------|--------|
| `/clear` | 切换任务、重大修正后 | 完全重置上下文 |
| `/compact` | 长对话（>50 轮） | 压缩历史，保留要点 |
| `/context` | 诊断高 Token 消耗 | 显示 Token 消耗明细 |

**延迟加载：** 不要在 CLAUDE.md 中前置所有信息。保持触发词 + 按需加载详情，实测可达 **54% 初始 Token 缩减**（7,584 → 3,434）。

### 4. 策略性模型选择

| 任务类型 | 模型 | 原因 |
|-----------|-------|------|
| 80% 日常任务 | Sonnet | 最佳性价比 |
| 复杂架构设计 | Opus | 需要深度推理 |
| 简单/快速任务 | Haiku | 比 Opus 便宜 18 倍 |

默认使用 Sonnet，仅在真正复杂问题上使用 Opus。Haiku 处理简单任务、测试和搜索。

### 5. MCP 与子代理优化

**MCP 管理：**
- 最多保持 10 个活跃 MCP（最多 80 个工具）
- 禁用当前任务不需要的 MCP
- 每个未使用的 MCP 仍会在每轮消耗 Token（工具描述会随每次请求发送）

**用子代理处理冗余输出：** 测试运行、构建日志、搜索结果等大输出放在子代理上下文中 — 只有摘要返回主对话。

### 6. Prompt 架构

- **直接、先放要求、说一遍。** 重复不会增加合规性，只会增加账单。
- **显式约束输出。** "50 字以内"、"最多 3 条"、"JSON 含 X、Y、Z 键，无需解释"
- **使用 XML 标签**（`<instructions>`、`<context>`、`<output_format>`）减少歧义
- **仅包含相关上下文。** 不要粘贴 500 行代码，一个函数就够。

### 7. API 专属优化

| 技术 | 节省 | 说明 |
|-----------|---------|-------|
| **Prompt 缓存** | 缓存读取 90% 折扣 | 缓存写入 1.25x，读取 0.1x。第 2 次调用即回本 |
| **Batch API** | 全部 Token 5 折 | <24h 延迟。与缓存叠加 → 最高 95% |
| **`effort: low`** | 大幅缩减 | 分类/提取任务无需深度推理 |
| **`budget_tokens` 上限** | 成比例 | 8K-16K 对大多数任务足够 |
| **预填 assistant 轮次** | 去除开场白 | `{"role": "assistant", "content": "{"}` 跳过 "好的！这是..." |
| **Token 高效工具** | 约 14% 输出节省 | Claude 4 默认开启；3.7 需加 header |

## 快速优化清单

1. **先运行 `/context`** → 建立基线
2. **拆分大文件**（>150 行）→ 节省 18%+ Token
3. **优化 CLAUDE.md** → 可减少 50-70% 消耗
4. **任务间使用 `/clear`** → 清除无关上下文
5. **长对话用 `/compact`** → 压缩历史
6. **冗余操作用子代理** → 测试输出、构建日志不污染主对话
7. **用合适的模型** → 日常用 Sonnet，简单任务用 Haiku
8. **限制活跃 MCP 到 ≤10** → 每个未用 MCP 每轮都消耗 Token
9. **用 `/cost` 追踪开销** → 配置状态栏持续显示
10. **API 用户启用 Prompt 缓存** → 详见 `references/api-optimization-guide.md`

## 诊断工作流

0. **先测量**：始终先让用户运行 `/context`，没有基线就无法验证优化效果
1. **读取实际代码**：在推荐任何优化前，查看实际文件和项目结构。扫描 >150 行的文件，检查 CLAUDE.md 大小，统计活跃 MCP 数量
2. **识别**：确定最大的浪费来源（大文件、臃肿的 CLAUDE.md、累积上下文、过多 MCP）
3. **推荐**：从快速优化清单中建议影响最大的优化
4. **验证**：修改后让用户重新运行 `/context` 测量改善

## 预期效果

| 优化项 | 效果 |
|-------------|--------|
| 模块化文件（聚焦任务） | **-18.2% Token** |
| 噪音减少（处理行数） | **-92%** |
| 优化 CLAUDE.md | **-50-70% 消耗** |
| 延迟加载上下文 | **-54% 初始 Token** |
| Haiku vs Opus（简单任务） | **-94% 成本** |

## 参考材料

- `references/file-organization-guide.md` — 命名规范、项目结构模板、实施清单
- `references/context-management-guide.md` — 延迟加载、子代理、MCP 管理、模型选择
- `references/metrics-report.md` — 完整实验数据和方法论
- `references/claude-md-template.md` — 即用型优化 CLAUDE.md 模板
- `references/api-optimization-guide.md` — Prompt 缓存、Batch API、Effort/Thinking Budget、预填技术
