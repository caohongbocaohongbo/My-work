---
name: skill-creator
...
description: 帮用户设计、创建或优化 Claude Code skill，并把 skill 写到正确位置。
...
allowed-tools: - Read
- Write
- Edit
- Glob
- Grep
- Bash(ls *)
- Bash(which *)
- AskUserQuestion
argument-hint: <skill-name>
...
arguments: - skill-name
load_strategy: manual
...
triggers: - 创建 skill
- 新建技能
- skill-creator
---


# Skill Creator

用于设计、创建或优化 Claude Code 的自定义 skill。

## Inputs
- `$skill-name`: 要创建或优化的 skill 名称，例如 `deploy-preview`、`review-copy`、`skill-creator`

## Goal
帮助用户把一个可重复的工作流沉淀为可复用的 Claude Code skill，并生成结构清晰、可直接放入 `.claude/skills/<name>/SKILL.md` 或 `~/.claude/skills/<name>/SKILL.md` 的内容。

## Steps

### 1. 明确 skill 的目标和使用场景
先问清楚这个 skill 是做什么的、谁来触发、什么时候触发、有没有参数、是项目专属还是个人通用。

重点确认：
- 要解决的重复动作是什么
- 触发方式是什么，例如 `/deploy-preview`、`/review-copy`
- 是否需要参数，参数分别是什么
- 应该保存到项目目录还是个人目录
- 是否有不能做的事或必须遵守的规则

**Success criteria**:
- 已确认 skill 名称
- 已确认 skill 目标和典型触发场景
- 已确认保存位置
- 已确认是否需要参数

### 2. 拆解成稳定工作流
把用户想要的流程拆成 3 到 7 个稳定步骤，避免空泛描述。

每一步都要写清：
- 做什么
- 依赖什么输入
- 成功标准是什么
- 哪些地方必须停下来让用户确认
- 是否有硬性约束

**Success criteria**:
- 已得到结构化步骤
- 每一步都有明确成功标准
- 已识别所有需要人工确认的节点

### 3. 检查已有 skills，避免覆盖和重复
先检查目标位置下是否已经存在同名 skill，必要时读取已有 `SKILL.md`，避免直接覆盖。

优先检查：
- 项目级：`.claude/skills/<skill-name>/SKILL.md`
- 个人级：`~/.claude/skills/<skill-name>/SKILL.md`

如果已存在：
- 先告诉用户已有 skill
- 说明是更新、重写还是保留并创建新名字

**Success criteria**:
- 已确认目标位置是否已有同名 skill
- 若已存在，已和用户确认处理方式

### 4. 生成 SKILL.md
按 Claude Code 可识别格式写出 `SKILL.md`，至少包含 frontmatter 和清晰的步骤说明。

推荐格式：

```markdown
---
name: skill-name
description: 一句话说明 skill 做什么、什么时候用
allowed-tools:
  - Read
  - Edit
when_to_use: 详细说明触发时机和例子
argument-hint: "<arg1> [arg2]"
arguments:
  - arg1
---

# Skill Title

## Inputs
- `$arg1`: 说明

## Goal
技能目标

## Steps
### 1. 第一步
具体说明

**Success criteria**:
- 条件 1
- 条件 2
```

如果是有副作用的 skill，比如部署、发消息、删东西，明确写出人工确认点。

**Success criteria**:
- 已生成完整的 `SKILL.md`
- frontmatter 可读且字段合理
- 步骤、成功标准、参数说明完整

### 5. 写入文件并说明怎么用
在用户指定的位置创建目录并写入 `SKILL.md`。

写完后告诉用户：
- 文件路径
- 如何调用，例如 `/skill-name`
- 如果有参数，给出调用示例

**Success criteria**:
- 文件已落盘到正确位置
- 用户拿到可直接使用的调用方式

## Rules
- 不要在未确认目标位置时直接写文件。
- 如果同名 skill 已存在，不要直接覆盖，先读取并确认。
- 不要把步骤写成空泛口号，必须可执行。
- 有副作用的 skill 必须显式写人工确认点。
- 优先生成简洁、可维护的 skill，不要堆过多抽象字段。
