---
version: v4.1
name: 订单通 · FCG Design System UI Kit (Fangcang UI)
description: "订单通（DingdanTong）B2B SaaS 平台的统一设计系统与组件规范，对齐 Figma「FCG Design System - UI Kit (订单通)- v1」。Figma 是组件、变量、状态与尺寸的唯一权威来源；本文档用于同步记录 Figma 并指导页面/原型生成。生成页面默认以 1920px 宽度为设计基准，使用 Auto Layout 与响应式约束。布局 Frame、section、group 默认透明，禁止自动生成白色背景块；只有 Figma 组件本身或明确的 L1 容器/浮层可使用背景。"

# ============ 设计源 ============
figmaFile: https://www.figma.com/design/EvOEzvO2sCtM8JavVCJSZP/FCG-Design-System---UI-Kit--%E8%AE%A2%E5%8D%95%E9%80%9A---v1
figmaFoundationsNode: 0:3

# ============ 基准与冲突处理 ============
sourceOfTruth:
  priority: "Figma UI Kit"
  rule: "当本文档、README.md、旧页面或生成器默认样式与 Figma 定义冲突时，一律以 Figma 为准；先修正文档，再生成设计/原型。"
  verifiedFileName: "FCG Design System - UI Kit (订单通)- v1"

# ============ 页面 / 原型生成基准 ============
generation:
  defaultCanvasWidth: 1920px
  minDesktopContentWidth: 1024px
  layout: "Auto Layout first; fixed coordinates only for intentional decorative or chart internals"
  responsive: "Desktop 1920 baseline; 1024-1439 shrink; 768-1023 reduce columns; <768 single column"
  backgroundRule: "layout frames, sections, groups, and ordinary content containers default to transparent fills; do not keep Figma's default white fill unless this file explicitly says the object owns a background."

# ============ 主要按钮默认组件实例 ============
primaryButton:
  default: "style=basic, round=off, size=default, icon=none, type=primary, plain=off, background=on, state=default, disabled=off, loading=off"
  hover: "style=basic, round=off, size=default, icon=none, type=primary, plain=off, background=on, state=hover, disabled=off, loading=off"
  active: "style=basic, round=off, size=default, icon=none, type=primary, plain=off, background=on, state=active, disabled=off, loading=off"
  disabled: "style=basic, round=off, size=default, icon=none, type=primary, plain=off, background=on, state=default, disabled=on, loading=off"

# ============ Table / Tag / Alert 默认生成策略（已核对 Figma 原始变体） ============
# 下列为页面/原型生成时的组件实例选择规则，不会修改 Figma 母组件及其变体定义。
# 明确指定的设计需求 > 以下生成默认值；未指定时必须按这里选型。
componentDefaults:
  table:
    figmaPageNode: "75:1557"
    header:
      component: "Table Header"
      preferredVariant: "size=default, type=text, align=left, background=on"
      height: 58px
      sizeHeights:
        small: 32px
        default: 58px
        large: 48px
      scope: "58px 只作用于 Table Header；不能用于 Table Cell-basic、Table Cell-tree 或整个数据行。"
    body:
      componentOptions: ["Table Cell-basic", "Table Cell-tree"]
      preferredSize: "default"
      defaultHeight: 40px
      preserveIndependentSizing: true
      note: "Body 仍按自身 Figma 变体和内容决定高度；不得把表头 58px 同步给数据行。"
  tag:
    figmaPageNode: "75:1558"
    component: "Tag"
    preferred: "size=default, effect=light"
    preferredSize: "default"
    preferredEffect: "light"
    defaultHeight: 28px
    sizeHeights:
      small: 20px
      default: 28px
      large: 36px
    unspecifiedProperties: "type 按业务语义选择（无明确语义时 info）；closable=off, round=off。"
    overrideRule: "只有明确提出 size/effect，或有已核实的特定业务规范时才切换。"
  alert:
    figmaPageNode: "3045:18839"
    component: "Alert"
    preferredVariant: "type=info, close type=icon, align center=off, description=off, theme=light"
    widthReference: 600px
    heightWithoutDescription: 38px
    heightWithDescription: 64px
    typeRule: "根据业务语义选择 info / primary / success / warning / error，不自动以 Tag 组件替代 Alert。"
    variantConstraint: "description=on 时使用 align center=off；只能选择 Figma 中已有的 60 个变体。"

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

> **Figma 优先**：Figma 文件是组件、变量、状态与尺寸的唯一权威来源。所有页面/原型设计开始前，必须先完整读取本文件；README.md 仅作速查索引，不足以替代本文档。
>
> **设计源**：Figma 文件「FCG Design System - UI Kit (订单通)- v1」
> https://www.figma.com/design/EvOEzvO2sCtM8JavVCJSZP/FCG-Design-System---UI-Kit--%E8%AE%A2%E5%8D%95%E9%80%9A---v1?node-id=0-3

## 基准铁律

1. **以 Figma 为准**：本文档、README.md、旧页面截图或生成器默认样式与 Figma UI Kit 冲突时，一律以 Figma 中定义的组件属性、变量、状态和尺寸为准。
2. **文档只同步 Figma**：不得为了迁就旧文档或生成器习惯而改写组件含义；发现冲突时，先把 DESIGN.md / README.md 更新到 Figma，再生成页面或原型。
3. **生成结果双向一致**：无论从 Figma、DESIGN.md、README.md 还是代码原型出发，最终页面视觉必须落到同一套令牌、组件状态和响应式布局规则。
4. **不要继承 Figma 默认白底**：新建 Frame、section、group 或布局容器时，默认使用透明 `fills: []`；只有明确拥有背景职责的组件、L1 容器、弹层、表格表头或真实业务卡片才允许设置背景。

## 概述

订单通（DingdanTong）是面向酒店企业客户的 B2B SaaS 平台。本设计系统（FCG Design System UI Kit，品牌名 **Fangcang UI**）定义了订单通全部页面的设计令牌与可复用组件，保证跨页面、跨模块的视觉与交互一致。

**核心设计原则：**

1. **Figma 单一基准** —— 组件属性、变体轴、状态、尺寸和颜色以 Figma UI Kit 为准；文档只负责同步和解释。
2. **1920px 画布基准** —— 设计/原型默认画板宽度为 1920px，最小桌面内容宽度 1024px；主结构使用 Auto Layout 和响应式约束。
3. **布局层默认透明** —— 页面 section、布局 Frame、group、普通内容容器默认不设置背景，禁止自动生成白色背景块。
4. **单一主色** —— 主色（primary）#2f87ac 是唯一品牌蓝，用于主按钮、Tab 激活、操作链接、选中态。禁止另造蓝色。
5. **语义四色** —— 成功 #6a9f62 / 警告 #be964b / 错误 #c66261 / 信息 #97a6b8，每色含 9 档明度梯度（base + dark-2 + light-3/5/7/8/9）。
6. **8px 基础圆角** —— 组件基础圆角 8px，小控件 2px，胶囊 20px，圆形 999px。
7. **三档组件尺寸** —— 通用控件高度 24px / 32px / 40px。
8. **克制的阴影** —— 4 级阴影，仅在浮层/弹窗/下拉等需要抬升层级时使用，页面卡片默认扁平。
9. **不得出现 emoji** —— 图标一律使用 SVG（见「图标 Icon」）。

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
| ╔ Feedback | 反馈分类 | 分类页（Dialog / Tooltip / Alert） |
| ❖ Alert | 警告提示 | 组件页（node-id=3045:18839） |
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

**主要按钮基准实例（页面主操作必须使用）：**

| 状态 | Figma 组件属性 |
|------|----------------|
| 正常 | `style=basic, round=off, size=default, icon=none, type=primary, plain=off, background=on, state=default, disabled=off, loading=off` |
| Hover | `style=basic, round=off, size=default, icon=none, type=primary, plain=off, background=on, state=hover, disabled=off, loading=off` |
| Active | `style=basic, round=off, size=default, icon=none, type=primary, plain=off, background=on, state=active, disabled=off, loading=off` |
| 禁用 | `style=basic, round=off, size=default, icon=none, type=primary, plain=off, background=on, state=default, disabled=on, loading=off` |

主按钮只通过以上属性切换状态；不得另造 hover/active/disabled 色值或手写近似按钮样式。

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
| size | small / default / large | **32 / 58 / 48px**（表头真实高度；`default=58px` 已核实） |
| type | blank / check / radio / text | 空 / 复选 / 单选 / 文本 |
| align | left / center / right | 左 / 中 / 右 |
| background | off / on | 表头底色 |

**表头默认实例选择（生成铁律；仅作用于 Table Header）**：

- **没有特别说明时，优先使用 Figma `Table Header` 的 `size=default` 变体，实际高度固定为 58px。** 推荐实例：`size=default, type=text, align=left, background=on`（Figma 变体 node-id=234:10968；不同类型、对齐方式按业务需要选同规格变体）。
- Figma 已核验的尺寸映射为 `small=32px / default=58px / large=48px`；这里的 `default` 虽高于 `large`，仍以 Figma 的真实尺寸为准，**不得按常见 32/40/48 规格推断或重排**。
- 当业务明确要求紧凑/其他表头尺寸时，按要求选择 `small` 或 `large` 的真实组件变体；不要为了变更行高直接拉伸、缩放母组件。
- **作用域严格隔离**：58px 仅用于 Table Header，**不**适用于 Table Cell-basic、Table Cell-tree、Table Row 或 Table Body。不得因统一表格高度而批量修改数据行。
- 一整行表头应由多个一致高度的 Header 实例组成，通过 Auto Layout 横向排列；按业务语义使用 `type=check/radio/blank/text`，按字段设置 `align`，不要用手绘矩形、普通 Text 代替真实组件。

**表头精确样式（background=on）**：

| 属性 | 值 | 说明 |
|------|-----|------|
| 背景 background | #FBFCFE | 等同 token bg（#fbfcfe） |
| 边框 border | 1px solid #F0F4F7 | 等同 token border（#f0f4f7） |
| 圆角 border-radius | 12px 12px 0px 0px | 表格容器顶部两角 12px，底部 0（表格专用，非全局 token） |

**Table Cell-basic（基础单元格）**：

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | 32 / 40 / 48px（常规行高；部分带控件变体可由 Figma 定义为 52px） |
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

- 表头（background=on）：背景 #FBFCFE，边框 1px solid #F0F4F7，顶部圆角 12px 12px 0 0，文字 #949999。顶部圆角属于表格容器的外侧两角，内部 Header 单元格不逐个设置 12px 圆角。
- **Table Body 维持独立尺寸**：`Table Cell-basic` 和 `Table Cell-tree` 默认使用 `size=default`，真实高度 **40px**；`small=32px`，`large` 通常为 48px。个别包含控件的变体可高至 52px，按实际 Figma 组件尺寸和内容处理，不能强行压成 40px。
- 数据行文字 #313333；行分隔线 #F0F4F7；hover 行底 #f4f9fb。单元格宽度、换行及对齐遵循实际列内容与 Auto Layout，不以增加行高的方式补偿错误的列宽。
- **嵌套 Tag**：当 `type=tag` 时，优先放置真正的 Tag 实例，默认 `size=default, effect=light`（28px 高），数据行仍按各自的 Cell 组件规格生成。
- **生成验收**：没有额外需求时，表头各列高度均为 58px、数据行默认高度为 40px；更改 Header 尺寸不得改变 Body 的 size、height、hover 状态或选择控件。

### 12. Tag 标签

Figma 页面：❖ Tag（node-id=75:1558）。

| 变体轴 | 取值 | 中文 |
|--------|------|------|
| size | small / default / large | **20 / 28 / 36px**（Figma 真实高度；`default=28px`） |
| type | primary / success / warning / danger / info | 主要 / 成功 / 警告 / 危险 / 信息 |
| effect | light / dark / plain | 浅色 / 深色 / 朴素 |
| closable | off / on | 可关闭 |
| round | off / on | 胶囊圆角 |

**Tag 默认实例选择（生成铁律）**：

- **生成 Tag 时默认优先设置 `size=default, effect=light`**；除非需求明确指定其他大小/效果，或现有 Figma 业务模式明确要求其他变体，不得自行切成 `small/large` 或 `dark/plain`。
- Figma `Tag` 主组件的真实高度是 `small=20px / default=28px / large=36px`（例：`size=default, type=primary, effect=light, closable=off, round=off`，node-id=129:299）；不得沿用旧文档 `20/24/32px` 的错误映射。内部 `_tag_delete` 图标高度 10/12/14px 不等于 Tag 容器高度。
- `type` 应根据文案语义选择：primary=品牌/重点，success=完成/成功，warning=提醒/待处理，danger=异常/失败，info=常规中性状态。无明确语义时优先 `info`，但 **type 不得覆盖 `size=default, effect=light` 的默认优先级**。
- `closable=off, round=off` 为无特殊说明时的生成选择；只有业务需要删除交互时才开启 `closable`，只有明确要求胶囊样式时才开启 `round`。
- 必须复用 Figma `Tag` 真实组件实例及其文字/颜色/圆角结构；禁止用彩色矩形加文字近似重绘，尤其不得按 Button 的 24/32/40px 高度套用到 Tag。

**效果与样式**：

- light：语义色 light-9 浅底 + base 文字（**默认**）。
- dark：语义色 base 实底 + 白文字（明确要求时才用）。
- plain：白底 + base 文字 + 边框（明确要求时才用）。
- round=on 使用 20px 胶囊；圆角默认值跟随 Figma 当前 `round=off` 组件。
- **生成验收**：普通业务状态 Tag 默认为 28px 高且 light 浅底；Table 单元格内、状态列、详情面板复用同一规则，不得出现同屏无理由混用 dark/plain 或其他 size。

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

### 17. Alert 警告提示

Figma 页面：❖ Alert（node-id=3045:18839）。**已核对 Figma 原生 `Alert` 组件集**（node-id=3045:33786），现有 **60 个真实变体**；这是组件库现有组件的文档补全，不是新增一套自定义 Alert 视觉组件。

| 变体轴 | 取值 | 中文 / 使用说明 |
|--------|------|----------------|
| type | info / primary / success / warning / error | 信息 / 品牌提示 / 成功 / 警告 / 错误 |
| close type | icon / text | 图标关闭 / 文字关闭 |
| align center | off / on | 内容左对齐 / 居中对齐 |
| description | off / on | 无辅助描述 / 带辅助描述 |
| theme | light / dark | 浅色 / 深色主题 |

**默认实例（页面生成时优先）**：
`type=info, close type=icon, align center=off, description=off, theme=light`（Figma 变体 node-id=3045:33787）。

**尺寸与组合约束（以 Figma 真实组件为准）**：

- Figma 原始参考宽度 **600px**。页面内可按布局容器响应式适配宽度，但不随意改变文字、图标、关闭区之间的相对布局。
- `description=off` 对应高度 **38px**，`description=on` 对应高度 **64px**；根据文案长度和组件实际约束自适应，不将 38px/64px 强制用于无关业务容器。
- 仅从现有 60 个变体中选实例：`description=on` 时使用 `align center=off`；`description=off` 时可使用 `align center=off/on`。不得拼出 Figma 中不存在的 `description=on, align center=on` 组合。
- 语义选择：`info`=一般通知/说明，`primary`=品牌强调提示，`success`=操作成功，`warning`=风险/注意事项，`error`=失败/错误。使用 UI Kit 对应 `type + theme` 原始配色，不手写新色值。
- `close type=icon` 为默认方式；明确要求文字关闭时选 `close type=text`。关闭动作与是否显示 Alert 是业务交互逻辑，不额外发明 `closable` 或 `state` 变体轴。
- **背景归属**：Alert 本身可以按 Figma 实例保留语义色背景；放置 Alert 的 section/group/layout Frame 仍默认为透明，不再给外层重复套白色卡片。
- **组件边界**：Alert 用于页面内可持续阅读的状态通知，不能误用 Tag、Tooltip、Dialog 或 toast 样式模拟。除非需求另有说明，不默认增加标题、多按钮、自动消失倒计时等 Figma 未定义结构。

**生成验收**：所有 Alert 都来自真实组件集；type/theme/关闭形式与语义匹配；单行通知使用 38px 原始样式，带描述使用 64px 原始样式；布局、颜色及辅助图标不由生成器临时重绘。

### 18. Icon 图标

Figma 页面：Icon (on-going)（node-id=7:137）。

- 图标持续补充中，全部使用 SVG 图形
- 禁止使用 emoji 代替图标
- 图标尺寸跟随所在控件（16px 常规 / 24px 大图标）；颜色继承文字色或语义色

## 平台扩展组件（订单通业务组件）

> 以下组件来自订单通平台页面，不在上文已收录的 Figma UI Kit 18 个组件页内，但与 UI Kit 无重复，保留作为平台级扩展。

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

- 仅当节点语义为真实指标卡组件时使用背景；外层 section、grid、group 默认透明
- 真实指标卡：背景 #fbfcfe / 边框 #f0f4f7 / 圆角 8px / 内边距 16px
- Label 12px #949999；Value 22px SemiBold #313333，等宽数字
- 涨跌：Success #6a9f62 / Error #c66261

### Chart 图表面板

- 图表容器固定高度 252px；只有图表面板自身可使用 #fbfcfe 背景 + 1px #f0f4f7 边框
- 图表外层标题区、section、左右布局列默认透明，不自动套白底
- 图表主色沿用品牌蓝 #2f87ac；对比色/折线色按语义色板选取

### Progress 进度条

- 高度 8px，圆角 999px
- 轨道 #c5ceda，填充 #2f87ac 或语义色

## 主平台工作台布局

### 页面尺寸与网格

- 设计/原型默认画板宽度 **1920px**；首屏高度可按页面内容确定，桌面常用最小高度 1080px
- 页面根 Frame 使用 Auto Layout；桌面主结构为 `grid-template-columns: 240px 1fr`（侧边栏 + 内容区）
- 内容区宽度随画板 Fill；内容容器使用响应式约束，不把 1920px 内部元素写死为绝对坐标
- 最小桌面内容宽度 1024px；低于 1024px 时按断点收缩、改列或堆叠
- 内容区内边距：上下 30px，左右 `clamp(16px, 2.08vw, 40px)`
- 所有 section、列表、表单、卡片网格优先使用 Auto Layout；仅图表内部、插画或特殊定位元素可使用固定坐标

### 内容区背景归属（禁止默认白底）

- **页面底色**：页面根背景使用 `bg-page #f7f8fa`
- **L1 容器**：topbar、主内容壳层、弹窗、下拉、Popover 等确实需要承载层级的容器可使用 `bg #fbfcfe`
- **L2 / L3 布局层**：section、标题区、正文区、左右列、grid、stack、group、仅用于对齐的 Frame 默认透明，设置 `fills: []`
- **业务卡片**：只有 KPI、Statistic card、图表面板、信息面板等“真实卡片组件”才可使用背景；不要给卡片外层再套一层白底
- **L4 强语义元素**：pill、notice、segmented 选中态、按钮、标签等按各自组件规范使用语义底色

> 加背景前先自问：去掉这层背景，视觉层级会不会丢？会丢 → 保留；不会丢 → 透明。附图中那类无语义的白色矩形块属于错误生成结果，应删除背景或改为透明布局 Frame。

| 对象类型 | 默认背景 | 说明 |
|----------|----------|------|
| Page / Root frame | #f7f8fa | 页面底色 |
| Sidebar | #14263b | 平台扩展组件固定深蓝底 |
| Header / Topbar | #fbfcfe | 一级承载容器 |
| Section / layout Frame / group | transparent | 不承担背景，禁止默认白底 |
| Figma UI Kit 组件实例 | 按组件属性 | 以 Figma 组件定义为准 |
| Dialog / Tooltip / Select panel | #fbfcfe + shadow/border | 浮层需要承载背景 |
| KPI / Statistic / Chart card | 按组件语义 | 只给卡片自身背景，不给外层 section 背景 |

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

## 本次组件规范校验（v4.1，2026-10-08）

- **Table（优先级 1）**：检查表头 `size=default` 是否来自 Figma Table Header 原组件并为 **58px**；正文 Cell 默认 **40px**、保持独立。无任何明确需求时，禁止沿用旧的「表头 default=40px」规则。
- **Tag（优先级 2）**：检查 Tag 是否优先 `size=default, effect=light`；Figma 默认高度 **28px**；按语义挑选 `type`，不要无理由调整 `effect` 或 `size`。
- **Alert（优先级 3）**：复用 Figma 原有 `Alert` 组件集（60 个变体）；默认信息类浅色单行 **38px**，带描述 **64px**；不生成不存在的变体组合。
- **变更范围**：本次只更新 `DESIGN.md` 的生成默认选型、已核实的 Figma 尺寸与 Alert 文档；不修改 Figma 文件、其他组件母版、平台全局 Size Tokens 或已有页面。
- **回归要求**：创建含 Table、Tag、Alert 的页面时，分别检查组件 `mainComponent/variantProperties`、Header 与 Body 高度隔离、Tag 的 `effect/size`、Alert 的主题和描述状态。发现生成结果偏离时优先纠正组件实例选择，不用局部缩放/重绘掩盖。
