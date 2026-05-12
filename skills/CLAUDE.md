# Skills 使用与管理规则

本目录下的 Skills 用于辅助完成特定类型的设计/开发任务。调用 Skills 时遵循以下规则。

## 使用规则

### 1. Skills 可自由搭配

执行任务时，根据实际需要**自行组合多个 Skills** 来配合完成任务。没有一对一绑定限制。

典型组合示例：
- Figma 设计任务: `figma-use` + `figma-generate-design` + `design-md`
- 前端动效任务: `gsap-advanced-animation` + `make-interfaces-feel-better` + `emil-design-eng`
- UI 审查任务: `web-design-guidelines` + `ui-ux-pro-max` + `interaction-design`

### 2. Skill 缺失时的处理流程

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

### 3. Skill 维护

已有 Skill 需要完善时：
1. 读取现有 Skill 的 `SKILL.md`
2. 用 `skill-creator` 更新：补充缺失的触发条件、使用说明、参考文档
3. 保持 Skill 目录结构一致（SKILL.md + references/ 子目录）

### 4. 禁止行为

- **不得在 Skill 缺失时随便执行** — Skill 不存在时不可用通用方法替代执行设计/开发类专项任务
- **不得跳过 find-skills 搜索** — 必须先确认互联网上没有现成方案
- **不得创建空壳 Skill** — 创建的 Skill 必须包含可执行的实际指令
- **不得执行超出用户指令范围的操作** — Skills 只作为辅助工具，当用户有明确指定指令时严格按用户指令执行

### 5. Skill 目录标准结构

```
skills/<skill-name>/
├── SKILL.md           # 核心文件：name + description + triggers + instructions
└── references/        # 参考文档（API 参考、示例、最佳实践）
    ├── example-1.md
    └── ...
```

### 6. 本地 Skills 清单

| 类别 | Skill | 用途 |
|------|-------|------|
| Figma | figma-use | Figma Plugin API 操作 |
| Figma | figma-generate-design | 从代码到 Figma 设计 |
| Figma | figma-generate-diagram | FigJam 图表生成 |
| Figma | figma-generate-library | Figma 设计系统构建 |
| Figma | figma-implement-design | Figma 设计转代码 |
| Figma | figma-create-design-system-rules | 生成设计系统规则 |
| Figma | figma-code-connect | Code Connect 映射 |
| Figma | figma-use-figjam | FigJam 专用 API |
| 设计 | design-md | 设计系统文档生成 |
| 设计 | design-system | 设计规范与组件库搭建 |
| 设计 | style-design | UI 风格分析与提炼 |
| 设计 | hotel-admin-blue | SaaS 后台蓝色主题 |
| 前端 | frontend-design | 高质量前端界面生成 |
| 前端 | gsap-advanced-animation | GSAP 动效开发 |
| 前端 | ui-ux-pro-max | UI/UX 设计智能辅助 |
| 前端 | make-interfaces-feel-better | 界面精致化优化 |
| 前端 | emil-design-eng | Emil UI 设计哲学 |
| 前端 | web-design-guidelines | Web 界面最佳实践审查 |
| UX | ux-research | 用户研究与需求分析 |
| UX | interaction-design | 交互逻辑与微交互设计 |
| UX | information-architecture | 信息架构规划 |
| 工具 | find-skills | 搜索可用 Skills |
| 工具 | skill-creator | 创建/优化 Skills |
| 工具 | agent-reach | 多平台网络搜索 |
| 其他 | emblem-market-research | 加密市场数据分析 |

链接目标 Skills 通过 `~/.cc-switch/skills/` 管理，实际文件在 `/Users/fangcang/.cc-switch/skills/`。
