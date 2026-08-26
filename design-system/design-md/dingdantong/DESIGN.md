---
version: v3
name: 订单通 · FCG Design System UI Kit (Fangcang UI)
description: "订单通（DingdanTong）B2B SaaS 平台的统一设计系统与组件规范，对齐 Figma「FCG Design System - UI Kit - 订单通 v1」。本文档是页面设计前必须读取的唯一事实来源，覆盖 Foundations 设计令牌（颜色 / 字体 / 圆角 / 阴影 / 尺寸）与全部 UI Kit 组件（按钮、按钮组、链接、复选框、单选框、开关、输入框、数字输入框、选择器、日期时间选择器、表单、表格、标签、统计数值、标签页、对话框、文字提示）。品牌色为 #2f87ac 冷蓝，语义色采用成功/警告/错误/信息四色体系，字体 Inter + PingFang SC。文档同时保留订单通平台级业务组件（侧边栏、顶栏、翻页器、KPI 指标卡、图表等）作为平台扩展。"

# ============ 设计源 ============
figmaFile: https://www.figma.com/design/EvOEzvO2sCtM8JavVCJSZP/FCG-Design-System---UI-Kit--%E8%AE%A2%E5%8D%95%E9%80%9A---v1
figmaFoundationsNode: 0:3

# ============ 颜色（对齐 Figma ✦ Foundations / Variables） ============
colors:
  # --- 品牌 Primary ---
  primary: "#2f87ac"
  primary-dark-2: "#215e78"
  primary-light-3: "#9ecfe4"
  primary-light-5: "#dfebf1"
  primary-light-7: "#e5f0f5"
  primary-light-8: "#e1eef5"
  primary-light-9: "#f4f9fb"
  # --- 成功 Success ---
  success: "#6a9f62"
  success-dark-2: "#60905a"
  success-light-3: "#85c26b"
  success-light-5: "#a4d092"
  success-light-7: "#c4dfb9"
  success-light-8: "#d5e6cd"
  success-light-9: "#f4faf6"
  # --- 警告 Warning ---
  warning: "#be964b"
  warning-dark-2: "#b88230"
  warning-light-3: "#eebe77"
  warning-light-5: "#f2d09d"
  warning-light-7: "#f8e3c5"
  warning-light-8: "#faecd8"
  warning-light-9: "#fcf6ec"
  # --- 错误 Error ---
  error: "#c66261"
  error-dark-2: "#a83a38"
  error-light-3: "#d98a86"
  error-light-5: "#e5afaa"
  error-light-7: "#f0cdcb"
  error-light-8: "#f5dede"
  error-light-9: "#fae8e7"
  # --- 信息 Info ---
  info: "#97a6b8"
  info-dark-2: "#97a6b8"
  info-light-3: "#b1b3b8"
  info-light-5: "#c7c9cc"
  info-light-7: "#dedfe0"
  info-light-8: "#e9e9eb"
  info-light-9: "#f4f4f5"
  # --- 文字 Text ---
  text-primary: "#313333"
  text-regular: "#313333"
  text-secondary: "#949999"
  text-placeholder: "#a1aaaa"
  text-disabled: "#c0cccc"
  # --- 背景 Background ---
  bg: "#fbfcfe"
  bg-page: "#f7f8fa"
  bg-overlay: "#fbfcfe"
  bg-transparent: "#fbfcfe00"
  # --- 边框 Border ---
  border: "#f0f4f7"
  border-extra-light: "#f0f4f7"
  border-darker: "#c5ceda"
  # --- 填充 Fill ---
  fill: "#e7f5fb"
  fill-dark: "#f4f9fb"
  fill-darker: "#e6e8eb"
  fill-blank: "#ffffff"
  # --- 遮罩 / 浮层 ---
  mask: "#ffffffe5"
  mask-extra-light: "#ffffff4d"
  overlay: "#000000cc"
  overlay-light: "#000000b2"
  overlay-lighter: "#00000080"
  # --- 基础 ---
  white: "#ffffff"
  black: "#000000"
  # --- 平台扩展（订单通业务色，非 UI Kit 变量，保留自原文档） ---
  sidebar-bg: "#14263b"
  sidebar-active: "#2ea0ce"

# ============ 字体（对齐 Figma Typography Variables） ============
typography:
  font-family: "'Inter', 'PingFang SC', 'Microsoft YaHei', sans-serif"
  xs:
    fontSize: 12px
    lineHeight: 20px
  sm:
    fontSize: 13px
    lineHeight: 22px
  base:
    fontSize: 14px
    lineHeight: 22px
  md:
    fontSize: 16px
    lineHeight: 24px
  lg:
    fontSize: 18px
    lineHeight: 26px
  xl:
    fontSize: 20px
    lineHeight: 28px
  weight-regular: 400
  weight-medium: 500
  weight-bold: 700

# ============ 圆角（对齐 Figma Radius Variables） ============
radius:
  none: 0px
  sm: 2px
  base: 8px
  round: 20px
  circle: 999px

# ============ 通用组件尺寸（对齐 Figma Size Variables） ============
size:
  sm: 24px
  base: 32px
  lg: 40px

# ============ 阴影（对齐 Figma Shadow Variables） ============
shadows:
  lighter: "0 0 6px rgba(0, 0, 0, 0.12)"
  light: "0 0 12px rgba(0, 0, 0, 0.12)"
  base: "0 8px 20px rgba(0, 0, 0, 0.08), 0 12px 32px 4px rgba(0, 0, 0, 0.04)"
  dark: "0 8px 16px -8px rgba(0, 0, 0, 0.16), 0 12px 32px rgba(0, 0, 0, 0.12), 0 16px 48px 16px rgba(0, 0, 0, 0.08)"

# ============ 间距（4px 基准，平台级辅助刻度） ============
spacing:
  "1": 4px
  "2": 8px
  "3": 12px
  "4": 16px
  "5": 20px
  "6": 24px
  "8": 32px
  "10": 40px

easing:
  out: "cubic-bezier(0.2, 0.8, 0.2, 1)"
  fast: "0.12s cubic-bezier(0.2, 0.8, 0.2, 1)"
  base: "0.18s cubic-bezier(0.2, 0.8, 0.2, 1)"
---

# 订单通 · FCG Design System UI Kit

> **唯一事实来源**：所有页面设计开始前，必须先完整读取本文件。README.md 仅作速查索引，不足以替代本文档。
>
> **设计源**：Figma 文件「FCG Design System - UI Kit - 订单通 v1」
> https://www.figma.com/design/EvOEzvO2sCtM8JavVCJSZP/FCG-Design-System---UI-Kit--%E8%AE%A2%E5%8D%95%E9%80%9A---v1?node-id=0-3

## 概述

订单通（DingdanTong）是面向酒店企业客户的 B2B SaaS 平台。本设计系统（FCG Design System UI Kit，品牌名 **Fangcang UI**）定义了订单通全部页面的设计令牌与可复用组件，保证跨页面、跨模块的视觉与交互一致。

**核心设计原则：**

1. **单一主色** —— 主色（primary）#2f87ac 是唯一品牌蓝，用于主按钮、Tab 激活、操作链接、选中态。禁止另造蓝色。
2. **语义四色** —— 成功 #6a9f62 / 警告 #be964b / 错误 #c66261 / 信息 #97a6b8，每色含 9 档明度梯度（base + dark-2 + light-3/5/7/8/9）。
3. **8px 基础圆角** —— 组件基础圆角 8px，小控件 2px，胶囊 20px，圆形 999px。
4. **三档组件尺寸** —— 通用控件高度 24px / 32px / 40px。
5. **克制的阴影** —— 4 级阴影，仅在浮层/弹窗/下拉等需要抬升层级时使用，页面卡片默认扁平。
6. **不得出现 emoji** —— 图标一律使用 SVG（见「图标 Icon」）。

### Figma 页面结构（左侧导航 → 中文对照）

| Figma 页面（英文） | 中文 | 说明 |
|-------------------|------|------|
| Cover | 封面 | 文件封面，非组件 |
| ✦ Foundations | 基础令牌 | 颜色 / 字体 / 圆角与阴影，对应本文档设计令牌 |
| Internal Only Canvas | 仅内部画布 | 内部使用，不对外 |
| Icon (on-going) | 图标（持续补充） | 图标库 |
| ╔ Basic | 基础分类 | 分类页（Button / Button Group / Link） |
| ❖ Button | 按钮 | 组件页 |
| ❖ Button Group | 按钮组 | 组件页 |
| ❖ Link | 链接 | 组件页 |
| ╔ Form | 表单分类 | 分类页（表单系列组件） |
| ❖ Checkbox | 复选框 | 组件页 |
| ❖ Datetime Picker | 日期时间选择器 | 组件页 |
| ❖ Switch | 开关 | 组件页 |
| ❖ Form | 表单 | 组件页 |
| ❖ Input | 输入框 | 组件页 |
| ❖ Input Number | 数字输入框 | 组件页 |
| ❖ Radio | 单选框 | 组件页 |
| ❖ Select | 选择器 | 组件页 |
| ❖ Table | 表格 | 组件页 |
| ❖ Tag | 标签 | 组件页 |
| ❖ Statistic | 统计数值 | 组件页 |
| ╔ Navigation | 导航分类 | 分类页（Tabs） |
| ❖ Tabs | 标签页 | 组件页 |
| ╔ Feedback | 反馈分类 | 分类页（Dialog / Tooltip） |
| ❖ Dialog | 对话框 | 组件页 |
| ❖ Tooltip | 文字提示 | 组件页 |
| ✧ Internal Components | 内部组件 | 内部使用，不对外 |
| ✧ Slot | 插槽 | 内部使用，不对外 |

## Foundations 设计令牌

以下令牌严格对齐 Figma「✦ Foundations」（node-id=0:3）页面与 Variables 变量库。

### 颜色 Color

#### 品牌色 Primary

| 令牌 | 色值 | 用途 |
|------|------|------|
| primary | #2f87ac | 主色：主按钮、激活态、链接、选中态 |
| primary-dark-2 | #215e78 | 主色 hover / 按下加深 |
| primary-light-3 | #9ecfe4 | 主色浅色（图标辅助） |
| primary-light-5 | #dfebf1 | 主色浅底 |
| primary-light-7 | #e5f0f5 | 主色更浅底 |
| primary-light-8 | #e1eef5 | 主色描边 / 浅底（输入框默认边框） |
| primary-light-9 | #f4f9fb | 主色最浅底（激活浅底） |

#### 语义色 Semantic

| 语义 | base | dark-2 | light-3 | light-5 | light-7 | light-8 | light-9 |
|------|------|--------|---------|---------|---------|---------|---------|
| Success 成功 | #6a9f62 | #60905a | #85c26b | #a4d092 | #c4dfb9 | #d5e6cd | #f4faf6 |
| Warning 警告 | #be964b | #b88230 | #eebe77 | #f2d09d | #f8e3c5 | #faecd8 | #fcf6ec |
| Error 错误 | #c66261 | #a83a38 | #d98a86 | #e5afaa | #f0cdcb | #f5dede | #fae8e7 |
| Info 信息 | #97a6b8 | #97a6b8 | #b1b3b8 | #c7c9cc | #dedfe0 | #e9e9eb | #f4f4f5 |

语义色使用规则：
- **base**：语义组件主色（文字 / 图标 / 实心按钮 / 标签实底）
- **dark-2**：hover / 按下加深
- **light-9**：语义浅底（标签浅底、提示条背景）
- **light-8**：语义浅底描边

#### 文字 Text

| 令牌 | 色值 | 用途 |
|------|------|------|
| text-primary | #313333 | 主文字（标题、正文、激活项） |
| text-regular | #313333 | 常规文字（同主文字） |
| text-secondary | #949999 | 次要文字（描述、辅助说明） |
| text-placeholder | #a1aaaa | 占位文本 |
| text-disabled | #c0cccc | 禁用文字 |

#### 背景 / 边框 / 填充

| 令牌 | 色值 | 用途 |
|------|------|------|
| bg | #fbfcfe | 组件背景、弹层背景 |
| bg-page | #f7f8fa | 页面底色 |
| bg-overlay | #fbfcfe | 浮层背景 |
| border | #f0f4f7 | 默认边框、行分隔线 |
| border-extra-light | #f0f4f7 | 极浅边框 |
| border-darker | #c5ceda | 强调边框（输入框 hover/焦点前） |
| fill | #e7f5fb | 填充（选中浅底） |
| fill-dark | #f4f9fb | 填充（浅底） |
| fill-darker | #e6e8eb | 填充（深灰） |
| fill-blank | #ffffff | 空白填充（白） |

#### 遮罩 / 浮层

| 令牌 | 色值 | 用途 |
|------|------|------|
| mask | rgba(255,255,255,0.898) | 白色遮罩 |
| mask-extra-light | rgba(255,255,255,0.302) | 极浅白遮罩 |
| overlay | rgba(0,0,0,0.80) | 弹窗遮罩 |
| overlay-light | rgba(0,0,0,0.70) | 浅遮罩 |
| overlay-lighter | rgba(0,0,0,0.50) | 更浅遮罩 |

### 字体 Typography

**字体栈**：Inter, PingFang SC, Microsoft YaHei, sans-serif（Inter 承载拉丁字符、数字、标点；PingFang SC 承载中文字符；Figma 中不可用时以 Inter 替代）
- 数字默认等宽（font-variant-numeric: tabular-nums）

| 字号 Token | 字号 | 行高 | 可用字重 | 用途 |
|-----------|------|------|---------|------|
| xl | 20px | 28px | Regular / Medium / Bold | 大标题 |
| lg | 18px | 26px | Regular / Medium / Bold | 次级大标题 |
| md | 16px | 24px | Regular / Medium / Bold | 区块标题 |
| base | 14px | 22px | Regular / Medium / Bold | 正文 / 按钮 / 表格 |
| sm | 13px | 22px | Regular / Medium / Bold | 次要正文 / 控件 |
| xs | 12px | 20px | Regular / Medium / Bold | 辅助文字 / 标签 |

**字重**：Regular 400 / Medium 500 / Bold 700。标题与强调优先 Medium、Bold，正文 Regular。

### 圆角 Radius

| 令牌 | 值 | 用途 |
|------|-----|------|
| none | 0px | 无圆角 |
| sm | 2px | 极小圆角（辅助元素） |
| base | 8px | 基础圆角（按钮、输入框、卡片） |
| round | 20px | 胶囊圆角（圆角按钮、标签） |
| circle | 999px | 圆形（圆形按钮、开关圆钮） |

### 阴影 Shadow

| 令牌 | 值 | 用途 |
|------|-----|------|
| lighter | 0 0 6px rgba(0,0,0,0.12) | 极浅阴影 |
| light | 0 0 12px rgba(0,0,0,0.12) | 浅阴影 |
| base | 0 8px 20px rgba(0,0,0,0.08), 0 12px 32px 4px rgba(0,0,0,0.04) | 标准阴影（下拉、浮层） |
| dark | 0 8px 16px -8px rgba(0,0,0,0.16), 0 12px 32px rgba(0,0,0,0.12), 0 16px 48px 16px rgba(0,0,0,0.08) | 深阴影（弹窗） |

### 通用组件尺寸 Size

| 令牌 | 值 | 用途 |
|------|-----|------|
| sm | 24px | 小尺寸控件 |
| base | 32px | 默认尺寸控件 |
| lg | 40px | 大尺寸控件 |

### 间距 Spacing

基准 4px 平台级辅助刻度（Figma 未定义独立间距变量，遵循 4px 网格）：

| Token | 值 | 用途 |
|-------|-----|------|
| spacing.1 | 4px | 图标与文字间距 |
| spacing.2 | 8px | 紧凑元素间距 |
| spacing.3 | 12px | 卡片内边距（小） |
| spacing.4 | 16px | 标准内边距 |
| spacing.5 | 20px | 卡片间距 |
| spacing.6 | 24px | 区块间距 |
| spacing.8 | 32px | 大区块间距 |
| spacing.10 | 40px | 页面级间距 |

## 组件 Components

> 以下组件严格对齐 Figma UI Kit 各「❖」页面。组件命名沿用 Figma 页面英文名 + 中文对照；同一语义组件若与旧文档重复，以本文档（Figma）为准。

### 1. Button 按钮

Figma 页面：❖ Button（node-id=48:6417）。10 个变体轴，共 1000+ 变体。

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | 小 24px / 默认 32px / 大 40px（高度） |
| type | primary / default / danger | 主要 / 默认 / 危险 |
| style | basic / circle / icon / link / text | 基础 / 圆形图标 / 图标 / 文字链接 / 文字 |
| round | off / on | 直角 8px / 胶囊 20px |
| icon | none / left / right / only | 无图标 / 左图标 / 右图标 / 仅图标 |
| plain | off / on | 朴素模式（去底、去边框） |
| background | off / on | 背景显隐 |
| state | default / hover / active | 默认 / 悬停 / 按下 |
| disabled | off / on | 禁用 |
| loading | off / on | 加载中（spinner） |

**尺寸**：高度 24px / 32px / 40px；左右内边距 12px；图标按钮为正方形（24/32/40）。

**类型语义**：
- primary：实心主按钮 —— 背景 #2f87ac，文字 #ffffff；hover #215e78。
- default：次级按钮 —— 背景 #ffffff，边框 #f0f4f7，文字 #313333。
- danger：危险按钮 —— 背景 #c66261，文字 #ffffff。

**样式语义**：
- basic：标准按钮（有背景/边框）
- circle：圆形图标按钮（999px 圆角）
- icon：图标按钮
- link：链接式按钮（主色文字，无边框）
- text：纯文字按钮（无背景无边框）

**状态**：default / hover / active / disabled / loading。Loading 时文字替换为 spinner，按钮保持禁用。

### 2. Button Group 按钮组

Figma 页面：❖ Button Group（node-id=410:19775）。高度 32px。

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| type | default / primary / confirm / delete / split-default / split-primary | 默认 / 主要 / 确认 / 删除 / 分离-默认 / 分离-主要 |

- 多个按钮横向拼接为一组，相邻按钮共享边框
- confirm（确认，绿色语义）/ delete（删除，红色语义）用于危险或确认场景
- split-*：带下拉拆分的主按钮 + 附加操作

### 3. Link 链接

Figma 页面：❖ Link（node-id=49:6471）。高度 22px。

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| type | primary / default / danger | 主要 / 默认 / 危险 |
| underline | off / on | 下划线显隐 |
| icon | none / left / right | 图标位置 |
| state | default / hover | 默认 / 悬停 |
| disabled | off / on | 禁用 |

- primary 链接文字 #2f87ac；danger 文字 #c66261；default 文字 #313333
- hover 态加深；disabled 用 #c0cccc

### 4. Checkbox 复选框 / Checkbox Group 复选组

Figma 页面：❖ Checkbox（node-id=63:6474）。

**Checkbox**：

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | 24 / 32 / 40px |
| checked | off / on | 选中 |
| indeterminate | off / on | 半选 |
| border | off / on | 描边模式 |
| state | default / hover | 默认 / 悬停 |
| disabled | off / on | 禁用 |

- 选中态勾选色 #2f87ac；边框默认 #c5ceda，选中 #2f87ac

**Checkbox Group**：

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | 24 / 32 / 40px |
| type | border / button / icon | 描边组 / 按钮组 / 图标组 |
| num | 2–10 | 选项数量 |

### 5. Radio 单选框 / Radio Group 单选组

Figma 页面：❖ Radio（node-id=63:6480）。

**Radio**：

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | 24 / 32 / 40px |
| checked | off / on | 选中 |
| border | off / on | 描边模式 |
| state | default / hover | 默认 / 悬停 |
| disabled | off / on | 禁用 |

- 选中态圆点 #2f87ac；外圈边框选中 #2f87ac

**Radio Group**（同 Checkbox Group 结构）：

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | 24 / 32 / 40px |
| type | border / button / icon | 描边组 / 按钮组 / 图标组 |
| num | 2–10 | 选项数量 |

### 6. Switch 开关

Figma 页面：❖ Switch（node-id=63:6484）。

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | 24 / 32 / 40px（高） |
| type | default / text / text-inline / icon / icon-inline / action-icon | 默认 / 文字 / 文字内联 / 图标 / 图标内联 / 动作图标 |
| switch | off / on | 关 / 开 |
| custom | off / on | 自定义内容 |

- 开态轨道 #2f87ac，关态轨道 #c5ceda，圆钮 #ffffff
- 轨道 pill 圆角 999px

### 7. Input 输入框 / Input Number 数字输入框

Figma 页面：❖ Input（node-id=63:6479）、❖ Input Number（node-id=228:23494）。

**Input**：

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | 24 / 32 / 40px（textarea 60px） |
| filled | off / on | 填充底 |
| icon | none / prefix / suffix | 图标：无 / 前缀 / 后缀 |
| textarea | off / on | 多行文本 |
| maxlength | off / on | 字数统计 |
| required | off / on | 必填 |
| state | default / focus / hover | 默认 / 聚焦 / 悬停 |
| disabled | off / on | 禁用 |

- 默认边框 #c5ceda（1px）；focus 边框 #2f87ac；hover 边框加深
- 占位文字 #a1aaaa；输入文字 #313333

**Input-extend（扩展输入框）**：

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | 24 / 32 / 40px |
| filled | off / on | 填充底 |
| slot | off / on | 插槽 |
| type | formatter / password / preffix-icon / preffix-select / preffix-text / suffix-icon / suffix-select / suffix-text | 格式化 / 密码 / 前缀图标 / 前缀选择器 / 前缀文本 / 后缀图标 / 后缀选择器 / 后缀文本 |
| required | off / on | 必填 |
| state | default / focus / hover | 默认 / 聚焦 / 悬停 |
| disabled | off / on | 禁用 |

**Input Number**：

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | 24 / 32 / 40px（宽 90 / 120 / 144px） |
| position | default / right | 步进按钮位置 |
| state | default / focus / hover | 默认 / 聚焦 / 悬停 |
| disabled | off / on | 禁用 |
| minimum | off / on | 最小值限制 |

### 8. Select 选择器

Figma 页面：❖ Select（node-id=63:6482）。

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | 24 / 32 / 40px |
| selected | off / on | 已选值 |
| multiple | off / on | 多选 |
| collapse | off / on | 折叠标签 |
| filterable | off / on | 可搜索 |
| required | off / on | 必填 |
| state | default / focus / hover | 默认 / 聚焦 / 悬停 |
| disabled | off / on | 禁用 |

- 触发器与输入框同规格；下拉面板背景 #fbfcfe，选项 hover #f4f9fb，选中 #e7f5fb

### 9. Datetime Picker 日期时间选择器

Figma 页面：❖ Datetime Picker（node-id=63:6477）。高度 32px。

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| type | date / datetime / time | 日期 / 日期时间 / 时间 |
| focus | off / on | 聚焦 |
| selected | off / on | 已选 |
| range | off / on | 范围选择 |
| shortcut | off / on | 快捷选项 |

- 宽度 240 / 312 / 400 / 624 / 744px（按 type / range 组合）
- 面板圆角 8px，阴影使用标准阴影

### 10. Form 表单 / Form Item 表单项

Figma 页面：❖ Form（node-id=63:6478）。

**Form（标签对齐）**：

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| align | left / right / top | 标签左对齐 / 右对齐 / 顶部 |

**Form Item（表单项）**：

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| type | input / password / formatter / http: / select / checkbox / options / radio / switch / textarea / upload / datetime | 输入框 / 密码 / 格式化 / 网址 / 选择器 / 复选框 / 选项 / 单选框 / 开关 / 多行文本 / 上传 / 日期时间 |
| size | small / default / large | 24 / 32 / 40px |

- 标签 + 控件的标准组合行；标签对齐方式由 Form 的 align 控制
- Form-item-left/right/top 对应标签位置，规格一致

### 11. Table 表格

Figma 页面：❖ Table（node-id=75:1557）。

**Table Header（表头）**：

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | 32 / 40 / 48px（行高） |
| type | blank / check / radio / text | 空 / 复选 / 单选 / 文本 |
| align | left / center / right | 左 / 中 / 右 |
| background | off / on | 表头底色 |

**表头精确样式（background=on）**：

| 属性 | 值 | 说明 |
|------|-----|------|
| 背景 background | #FBFCFE | 等同 token bg（#fbfcfe） |
| 边框 border | 1px solid #F0F4F7 | 等同 token border（#f0f4f7） |
| 圆角 border-radius | 12px 12px 0px 0px | 表格容器顶部两角 12px，底部 0（表格专用，非全局 token） |

**Table Cell-basic（基础单元格）**：

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | 32 / 40 / 48px |
| type | text / tag / button / action / check / radio / switch / select / input / date / time / icon-left / icon-right | 文本 / 标签 / 按钮 / 操作 / 复选 / 单选 / 开关 / 选择器 / 输入 / 日期 / 时间 / 左图标 / 右图标 |
| state | default / hover | 默认 / 悬停 |
| background | off / on | 行底色 |
| align | left / center / right | 左 / 中 / 右 |

**Table Cell-tree（树形单元格）**：

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | 32 / 40 / 48px |
| fold | off / on | 折叠 |
| type | icon / with text | 图标 / 带文本 |
| background | off / on | 行底色 |
| children | off / on | 子节点 |
| state | default / hover | 默认 / 悬停 |

- 表头（background=on）：背景 #FBFCFE，边框 1px solid #F0F4F7，顶部圆角 12px 12px 0 0，文字 #949999
- 数据行文字 #313333；行分隔线 #F0F4F7；hover 行底 #f4f9fb

### 12. Tag 标签

Figma 页面：❖ Tag（node-id=75:1558）。

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | 20 / 24 / 32px（高） |
| type | primary / success / warning / danger / info | 主要 / 成功 / 警告 / 危险 / 信息 |
| effect | light / dark / plain | 浅色 / 深色 / 朴素 |
| closable | off / on | 可关闭 |
| round | off / on | 胶囊圆角 |

- light：语义色 light-9 浅底 + base 文字
- dark：语义色 base 实底 + 白文字
- plain：白底 + base 文字 + 边框
- round=on 使用 20px 胶囊

**Check Tag（可选标签）**：

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| checked | off / on | 选中 |

### 13. Statistic 统计数值

Figma 页面：❖ Statistic（node-id=516:21143）。

| 变体轴 | 取值 | 尺寸 | 中文 |
|--------|------|------|------|
| type | basic | 240×76 | 基础（标题 + 数值） |
| type | card | 240×92 | 卡片（数值 + 副信息） |
| type | countdown | 240×128 | 倒计时 |

- 数值字号 16px 起（可放大），字重 Bold，等宽数字
- 标题 #949999，数值 #313333

### 14. Tabs 标签页

Figma 页面：❖ Tabs（node-id=75:1568）。

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| type | default / card / border-card | 默认 / 卡片 / 描边卡片 |
| closable | off / on | 可关闭 |
| position | default / left / right | 位置 |
| custom-icon | off / on | 自定义图标 |
| add | off / on | 新增按钮 |

- 横向 Tab 高度 40px；纵向 Tab 高度 400px
- 激活 Tab 文字 #2f87ac + 底部 2px 主色指示线（default 类型）

### 15. Dialog 对话框

Figma 页面：❖ Dialog（node-id=75:1570）。

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| align | default / center | 顶部对齐 / 居中 |

- 默认尺寸 600×300；大尺寸 800×600
- 背景 #fbfcfe，圆角 8px，阴影使用深阴影
- 遮罩 rgba(0,0,0,0.80)

### 16. Tooltip 文字提示 / Popconfirm 气泡确认

Figma 页面：❖ Tooltip（node-id=75:1578）。

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| placement | top / top-start / top-end / bottom / bottom-start / bottom-end / left / left-start / left-end / right / right-start / right-end | 12 方向 |
| effect | dark / light / border | 深色 / 浅色 / 描边 |
| multiple | off / on | 多行内容 |

- dark：深色底 + 白字
- light：白底 + #313333 文字 + 阴影
- border：白底 + 边框
- Popconfirm（气泡确认框）：用于操作二次确认，含确认/取消按钮

### 17. Icon 图标

Figma 页面：Icon (on-going)（node-id=7:137）。

- 图标持续补充中，全部使用 SVG 图形
- 禁止使用 emoji 代替图标
- 图标尺寸跟随所在控件（16px 常规 / 24px 大图标）；颜色继承文字色或语义色

## 平台扩展组件（订单通业务组件）

> 以下组件来自订单通平台页面，不在 Figma UI Kit 的 17 个组件页内，但与 UI Kit 无重复，保留作为平台级扩展。

### Sidebar 侧边栏

- 宽度 240px，深蓝底 #14263b，高度 100vh
- 品牌名 22px / Inter SemiBold / #ffffff
- 菜单项 220×34px，圆角 8px
- 菜单项文字 13px / Inter Regular / rgba(255,255,255,0.8)
- 激活项：左侧 2×22px 指示线 #2ea0ce + 背景 rgba(46,160,206,0.18)

### Header 顶栏

- 64px 白色顶栏，含面包屑 pill + 升级 pill
- 面包屑文字 #949999；当前页 #313333

### Pagination 翻页器

- 容器背景 #fbfcfe，圆角 8px，最小高度 52px
- 导航按钮 42×30px；数字按钮 30×30px
- 激活页：背景 #f4f9fb，边框 #e1eef5，文字 #2f87ac Bold
- 总记录数文字 12px #949999

### KPI 指标卡片（数据洞察模块）

- 背景 #fbfcfe / 边框 #f0f4f7 / 圆角 8px / 内边距 16px
- Label 12px #949999；Value 22px SemiBold #313333，等宽数字
- 涨跌：Success #6a9f62 / Error #c66261

### Chart 图表面板

- 固定高度 252px；白底 + 1px 边框
- 图表主色沿用品牌蓝 #2f87ac；对比色/折线色按语义色板选取

### Progress 进度条

- 高度 8px，圆角 999px
- 轨道 #c5ceda，填充 #2f87ac 或语义色

## 主平台工作台布局

### 页面尺寸与网格

- 设计基准宽度 **1920px**；最小内容宽度 1024px
- 网格结构：grid-template-columns: 240px 1fr（侧边栏 + 内容区）
- 内容区内边距：上下 30px，左右 40px（响应式 clamp 至 24px）

### 内容区背景归属（三层结构）

- **L1 容器**（topbar、main-body、浮层卡片）：白底 #fbfcfe
- **L2 子区 / L3 元素**（标题、正文、布局 Frame）：透明，不承担背景
- **L4 强语义浮层**（pill、notice、segmented 选中态、按钮）：按各组件规范语义底色

> 加背景前先自问：去掉这层背景，视觉层级会不会丢？会丢 → 保留；不会丢 → 透明。

## 交互状态

### 全状态覆盖矩阵

| 状态 | 说明 | 设计表现 |
|------|------|---------|
| Default | 正常可交互 | 标准样式 |
| Hover | 鼠标悬停 | 颜色微调 / 边框加深 / cursor:pointer |
| Focus | 键盘聚焦 | 可见聚焦环（主色边框或 0 0 0 3px 环） |
| Active | 按下 | scale(0.98) / 背景加深 |
| Loading | 进行中 | spinner + 保持禁用 |
| Disabled | 不可交互 | 文字 #c0cccc / opacity 0.4-0.5 / cursor:not-allowed |
| Empty | 无数据 | 插图 + 提示 + 引导按钮 |
| Error | 失败 | 错误图标 + 原因 + 重试按钮 |
| Success | 成功 | 成功色对勾 + 文案（3s 自动消失） |

### 过渡动效

- 微交互（hover / focus / press）：0.12s
- 标准过渡（菜单 / 面板 / Tab）：0.18s
- 进入方向：expand（从触发源展开）、fadeIn（淡入）、slideUp（下方 8px 滑入）
- 退出为进入时长的 60–70%；遵循 prefers-reduced-motion

## 响应式

| 断点 | 视口 | 策略 |
|------|------|------|
| Desktop | ≥1440px | 完整 1920px 基准布局 |
| Narrow Desktop | 1024–1439px | 自动收缩 |
| Tablet | 768–1023px | 列数缩减，单列堆叠 |
| Mobile | <768px | 全单列，最小触控 44×44px |

- 页面水平内边距：clamp(16px, 2.08vw, 40px)
- 所有可交互元素最小触控区域 44×44px；触控目标间距 ≥8px

## 已知缺口

- Icon 图标库仍在持续补充（Figma 页面标注 on-going）
- 暗色模式：仅提供 shadow dark 变量，组件暗色适配待补充
- 移动端表格卡片化展示的具体实现待补充
- 间距变量未在 Figma Variables 中定义（当前采用 4px 基准辅助刻度）
