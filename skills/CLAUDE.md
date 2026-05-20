# Skills 使用与管理规则

本目录下的 Skills 用于辅助完成特定类型的设计/开发任务。调用 Skills 时遵循以下规则。

## 使用规则

### 1. Skill 按需加载（最高优先级）

**Skill 默认不加载。** 遵循 `~/.claude/CLAUDE.md` 中"Skill 按需加载策略"：

- 会话启动时 skill 列表为空，不消耗 token
- 只有 Agent 确定任务需要某 skill 时，才通过 `Skill` 工具显式加载
- 禁止因"可能用到"而预加载 skill
- 各 Agent 的推荐 skill 清单见 `agents/CLAUDE.md`

### 2. Skills 可由 Agent 自由组合

Agent 执行任务时，根据实际需要自行组合所需 Skills。典型组合示例：
- Figma 设计任务: `figma-use` + `figma-generate-design` + `design-md`
- 前端动效任务: `gsap-advanced-animation` + `make-interfaces-feel-better` + `emil-design-eng`
- UI 审查任务: `web-design-guidelines` + `ui-ux-pro-max` + `interaction-design`

### 3. Skill 缺失时的处理流程

当执行工作流需要某个领域能力，但本地 `/Users/fangcang/.claude/skills/` 下**没有对应 Skill** 时：

```
需要 Skill?
├── YES → find-skills 搜索是否存在现成 Skill
│   ├── 找到 → 安装/链接到本地 skills 目录
│   └── 未找到 → skill-creator 创建新 Skill
│       ├── 编写 SKILL.md（Description + Triggers + Instructions）
│       ├── 写入对应目录
│       └── 测试可用后继续任务
└── 不需要 → 继续当前流程
```

### 4. Skill 维护

已有 Skill 需要完善时：
1. 读取现有 Skill 的 `SKILL.md`
2. 用 `skill-creator` 更新：补充缺失的触发条件、使用说明、参考文档
3. 保持 Skill 目录结构一致（SKILL.md + references/ 子目录）

### 5. 禁止行为

- **不得在 Skill 缺失时随便执行** — Skill 不存在时不可用通用方法替代执行设计/开发类专项任务
- **不得跳过 find-skills 搜索** — 必须先确认互联网上没有现成方案
- **不得创建空壳 Skill** — 创建的 Skill 必须包含可执行的实际指令
- **不得执行超出用户指令范围的操作** — Skills 只作为辅助工具，当用户有明确指定指令时严格按用户指令执行
- **不得默认预加载 Skill** — 会话启动时 skill 列表必须为空，只有 Agent 确定需要时才加载
- **不得一次性加载所有 skill** — 只加载当前阶段需要的，禁止"打包加载"

### 6. Skill 目录标准结构

```
skills/<skill-name>/
├── SKILL.md           # 核心文件：name + description + triggers + instructions
└── references/        # 参考文档（API 参考、示例、最佳实践）
    ├── example-1.md
    └── ...
```

### 7. 当前 Skills 清单（按需加载）

| 类别 | Skill | 用途 |
|------|-------|------|
| Figma | figma-use | Figma Plugin API 操作（ux-agent 核心） |
| Figma | figma-generate-design | 从代码到 Figma 设计（ux-agent 核心） |
| Figma | figma-create-new-file | 创建新 Figma 文件 |
| 设计 | design-md | 设计系统文档生成（ux-agent 核心） |
| 设计 | design-system | 设计规范与组件库搭建 |
| 设计 | style-design | UI 风格分析与提炼 |
| 前端 | frontend-design | 高质量前端界面生成（front-agent 核心） |
| 前端 | gsap-advanced-animation | GSAP 动效开发（front-agent） |
| 前端 | ui-ux-pro-max | UI/UX 设计智能辅助（front-agent 核心） |
| 前端 | make-interfaces-feel-better | 界面精致化优化（front-agent） |
| 前端 | web-design-guidelines | Web 界面最佳实践审查 |
| UX | ux-research | 用户研究与需求分析 |
| UX | interaction-design | 交互逻辑与微交互设计 |
| 工具 | agent-browser | 浏览器自动化（test-agent 核心） |
| 工具 | find-skills | 搜索可用 Skills |
| 工具 | skill-creator | 创建/优化 Skills |
| 工具 | brainstorming | 复杂任务规划 |
| 工具 | token-optimizer | Token 消耗诊断与优化 |
| 工具 | self-improving-agent | 自优化学习系统 |

### 8. 已归档 Skills

以下 skill 因使用频率极低已移至 `~/.claude/skills-archive/`，需要时手动恢复：

| Skill | 归档原因 |
|-------|----------|
| agent-reach | WebSearch 工具可替代 |
| emblem-market-research | 加密市场数据，与当前工作无关 |
| emil-design-eng | 特定设计风格偏好 |
| figma-code-connect | 仅建立 Figma↔代码关联时用 |
| figma-create-design-system-rules | 仅新建项目时用一次 |
| figma-generate-diagram | FigJam 图表，极少使用 |
| figma-generate-library | 仅从零搭建组件库时用 |
| figma-implement-design | front-agent 已内建此能力 |
| figma-use-figjam | 与 figma-use 重叠 |
| hotel-admin-blue | 酒店 SaaS 后台，领域极窄 |
| information-architecture | ux-agent 已内建此能力 |
