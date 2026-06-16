---
version: v2
name: 订单通 · 数据洞察 (DingdanTong Data Insights)
description: 订单通数据洞察模块，一套独立的 B2B SaaS 数据分析界面，用于酒店企业客户的经营总览、流失分析、企业 360 画像和潜力机会发掘。页面采用全宽布局、无侧边栏、无顶部 Header，内容区域以浅蓝灰色底色承载白色数据卡片。品牌色为 #2F87AC 冷蓝，辅以克制的数据色板和语义状态色。字体使用 Inter + PingFang SC 双字体体系，数字默认等宽。设计语言延续订单通主平台的克制专业调性，但更聚焦于数据可视化和指标卡片的呈现。

colors:
  # --- 页面底色 ---
  page: "#f4f7fb"
  # --- 表面 ---
  surface: "#ffffff"
  surface-2: "#f8fafc"
  surface-3: "#f1f5f9"
  table-header-bg: "#FBFCFE"
  # --- 描边 ---
  line: "#e6ecf2"
  line-soft: "#eef3f7"
  line-strong: "#d5dde7"
  # --- 文字 ---
  ink-900: "#1f2d3d"
  ink-700: "#4d6278"
  ink-500: "#617285"
  ink-300: "#8d9bae"
  ink-200: "#b6c0cd"
  table-header-text: "#97A6B8"
  # --- 品牌 ---
  brand-50: "#eef8fc"
  brand-100: "#d9eef7"
  brand-300: "#86c8df"
  brand-500: "#2F87AC"
  brand-600: "#2587b1"
  brand-700: "#1f6f92"
  # --- 语义色 ---
  success-50: "#ecfdf5"
  success-700: "#047857"
  warning-50: "#fffbeb"
  warning-700: "#b45309"
  danger-50: "#fef2f2"
  danger-700: "#be123c"
  info-50: "#eef8fc"
  info-700: "#1f6f92"
  # --- 图表色板 ---
  chart-bar: "#A2C2E4"
  chart-bar-compare: "#BDE7ED"
  chart-line: "#caa24e"
  data-1: "#A2C2E4"
  data-2: "#A2C2E4"
  data-3: "#BDE7ED"
  data-4: "#caa24e"
  data-5: "#c084fc"
  data-neutral: "#cbd5e1"

typography:
  page-heading:
    fontFamily: "'Inter', 'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 22px
    fontWeight: 600
    lineHeight: 1.2
    letterSpacing: -0.01em
    color: "{colors.ink-900}"
  section-title:
    fontFamily: "'Inter', 'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 16px
    fontWeight: 600
    lineHeight: 1.3
    color: "{colors.ink-900}"
  card-title:
    fontFamily: "'Inter', 'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 14px
    fontWeight: 600
    lineHeight: 1.4
    color: "{colors.ink-900}"
  body:
    fontFamily: "'Inter', 'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 13px
    fontWeight: 400
    lineHeight: 1.5
    color: "{colors.ink-700}"
  meta:
    fontFamily: "'Inter', 'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 12px
    fontWeight: 400
    lineHeight: 1.4
    color: "{colors.ink-500}"
  micro:
    fontFamily: "'Inter', 'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 11px
    fontWeight: 400
    lineHeight: 1.3
    color: "{colors.ink-300}"
  table-header:
    fontFamily: "'Poppins', 'Inter', sans-serif"
    fontSize: 12px
    fontWeight: 600
    lineHeight: 18px
    color: "{colors.table-header-text}"
  num-lg:
    fontFamily: "'Inter', 'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 28px
    fontWeight: 600
    lineHeight: 1.2
  num-md:
    fontFamily: "'Inter', 'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 22px
    fontWeight: 600
    lineHeight: 1.2
  num-sm:
    fontFamily: "'Inter', 'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 16px
    fontWeight: 600
    lineHeight: 1.3
  tab-active:
    fontFamily: "'Inter', 'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 13px
    fontWeight: 600
    lineHeight: 1.38
    color: "{colors.ink-900}"
  tab-inactive:
    fontFamily: "'Inter', 'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 13px
    fontWeight: 500
    lineHeight: 1.38
    color: "{colors.ink-300}"

rounded:
  sm: 6px
  md: 8px
  lg: 12px
  full: 999px

controlHeight:
  sm: 28px
  md: 32px
  lg: 36px

spacing:
  "1": 4px
  "2": 8px
  "3": 12px
  "4": 16px
  "5": 20px
  "6": 24px
  "8": 32px
  "10": 40px

shadows:
  panel: "0 1px 2px rgba(15, 23, 42, 0.04)"
  float: "0 4px 12px rgba(15, 23, 42, 0.06)"
  pop: "0 8px 24px rgba(15, 23, 42, 0.08)"

easing:
  out: "cubic-bezier(0.2, 0.8, 0.2, 1)"
  fast: "0.12s cubic-bezier(0.2, 0.8, 0.2, 1)"
  base: "0.18s cubic-bezier(0.2, 0.8, 0.2, 1)"
---

## 概述

订单通数据洞察模块是订单通 B2B SaaS 平台的独立数据分析区域，包含四个独立页面：**经营总览**、**流失分析**、**企业 360**、**潜力机会**。每个页面为独立的静态 HTML 文件，默认打开即展示对应主题的数据面板。

与订单通主平台不同，数据洞察模块采用**全宽布局**：无侧边栏导航、无顶部 Header 栏。内容区域自动浮动填充整个视口，以浅蓝灰色底色 (`{colors.page}` #f4f7fb) 承载白色数据卡片，通过卡片间的间距和极克制的阴影 (`{shadows.panel}`) 建立层次。

**核心特征：**
- 单品牌色 `{colors.brand-500}` (#2F87AC) 承担所有主操作、激活态；图表主色独立为 `{colors.chart-bar}` (#A2C2E4)
- Inter + PingFang SC 双字体体系，数字默认 tabular-nums 等宽
- 4px 基准间距系统，8 档梯度
- 3 档圆角（6px / 8px / 12px），统一柔和的视觉节奏
- 3 档控件高度（28px / 32px / 36px）
- 极克制阴影策略，仅 3 级
- 图表色板 5+1 色，覆盖柱状图、折线图、进度条等场景

## 主平台工作台布局

### 适用范围

以下规范适用于订单通**主平台工作台**页面（如订单管理、订单通知设置、财务、客户、设置等），与数据洞察模块的全宽无侧边栏布局不同。

### 页面尺寸

- **设计基准宽度：1920px**（全平台统一）
- 最小宽度：1024px

### 整体网格结构

```
<div class="layout" style="display: grid; grid-template-columns: 240px 1fr; min-height: 100vh;">
  <aside class="sidebar"><!-- 240px 固定侧边导航 --></aside>
  <main class="content"><!-- 剩余宽度，1920px 下为 1680px --></main>
</div>
```

| 区域 | 宽度 | 背景色 |
|------|------|--------|
| `aside` 侧边栏 | **240px**（固定） | `#14263b` |
| `main` 内容区 | **1fr**（1920px 下为 1680px） | `{colors.page}` #f4f7fb |

### 内容区内边距

`main.content` 内部所有 section（功能卡片/面板）遵循统一内边距：

| 方向 | 值 |
|------|----|
| 左右 (padding-inline) | **40px** |
| 上下 (padding-block) | **30px** |

```css
.content {
  padding: 30px 40px;
}
```

页面标题栏 (topbar)、主功能面板 (main-panel) 均从此内边距区域起始，无需对视口额外设置外边距。

### 侧边栏导航 (aside / sidebar)

| 属性 | 值 |
|------|----|
| 宽度 | **240px** |
| 高度 | 100vh（粘性满屏） |
| 背景色 | `#14263b` |
| 品牌名 | 22px / Inter Semi Bold / #ffffff，x:16 y:22 |
| 菜单项尺寸 | 220×34px，x:10，间距起始 y:72，行间距 40px |
| 菜单项圆角 | 8px |
| 菜单项文字 | 13px / Inter Regular / rgba(255,255,255,0.8) |
| **激活项背景** | `rgba(46,160,206,0.18)`（brand-active 18% 透明度） |
| **激活指示线** | 左侧 2×22px 竖线，颜色 `#2ea0ce`，圆角 1px，y:6 |
| **激活项文字** | rgba(255,255,255,1.0)（完全不透明） |

### 容器背景归属规则（强制）

> 适用于 Figma 设计稿组织与代码 DOM 双向约束，用于确保后续修改背景/主题时只需改 2 个节点，不必逐层下钻。

#### 三层结构

页面右侧内容区由**两个、且仅两个**带表面色的 layout 容器承担背景：

```
aside.sidebar                              ── 深色 #14263b（独立体系，不在本规则约束内）
main.content
├─ section.topbar       ◉ 白色 surface ── 顶部标签 / 状态 / 工具栏 layout
└─ section.main-body    ◉ 白色 surface ── 主体内容区 layout
    └─ 所有内部 Frame   ◯ 透明无填充   ── 仅参与布局，不承担背景
```

#### 背景归属表

| 层级 | 节点示例 | 背景策略 | Figma `fills` |
|------|----------|----------|---------------|
| **L1 容器** | `topbar`、`main-body`、独立浮层卡片（modal/toast/popover） | 白色 surface (`{colors.surface}` #ffffff) | `[{type:'SOLID', color:#ffffff}]` |
| **L2 子区** | 大段功能分区（如「商户信息分组」「订单列表区」） | 透明（继承父容器底色） | `[]`（空数组）|
| **L3 元素** | `section-head`、`page-head`、`title-row`、标题/小标题/正文 Frame、KV 行、check-grid 行、form-grid 列 | 透明 | `[]` |
| **L4 强语义浮层** | pill 胶囊、notice 提示框、segmented 选中态、step-nav 激活态、按钮 | 按各组件规范的语义底色（brand-50 / success-50 / warning-50 …） | 按组件规范 |

#### 禁止与例外

- **禁止**给标题（h1/h2/h3）、小标题（label/sub-title）、正文（body/help/hint）、纯布局分组 Frame 添加白色或灰色 `surface` 填充
- **禁止**在 L2/L3 层重复白色背景套娃（白卡套白卡），任何嵌套若不改变视觉深浅都属浪费
- **唯一例外 1 · sub-card**（`{colors.surface-2}` #f8fafc 浅灰底）：用于在 L1 白色容器内部需要二次分组的场景（如「商户信息」「证照信息」），允许带浅灰底 + `{colors.line}` 边框；但其内部仍遵循 L3 透明规则
- **唯一例外 2 · 数据/状态卡片**（如 timeline-box、check-card、upload-card）：因需独立边框与轻阴影传达"对象感"，可带白色底 + 边框；但卡片内部的标题/正文 Frame 依然透明
- **唯一例外 3 · 表格表头**（`{colors.table-header-bg}` #FBFCFE）：表头行允许独立底色

#### 一句话判断标准

> **加背景之前先问自己：去掉这层背景，视觉层级会不会丢？**
> 会丢 → 保留（说明它承担了 L1/L4 角色）；不会丢 → 设为透明（它是 L2/L3）。

#### Figma 实操约定

- 新建 Frame 默认填充设为空 `[]`，仅在确认归属 L1/L4 时再回填 surface 色
- 大批量纠错时，可对整个 `main-body` 子树执行：`找出所有 fills 为白色 + 不属于 L4 组件库的 Frame → 改为透明`
- 修改主题/暗黑模式时，只动 L1 两个容器 + L4 组件规范，L2/L3 自动跟随

## 画布与视口

### 设计基准宽度

- **设计基准宽度：1920px** — 所有页面以 1920px 宽度为设计稿标准，开发还原时以 1920px 为参考
- **弹窗/对话框例外**：弹窗、对话框、抽屉、tooltip、下拉菜单等浮层组件不受 1920px 约束，按其自身内容宽度设计
- **最小内容宽度：1024px** — 低于此宽度触发 Tablet 响应式断点

### 自适应自动布局策略

页面采用**约束型全宽布局**，通过自动布局引擎实现视口自适应：

- **内容容器**：使用 `max-width: 1920px` + `margin: 0 auto` 居中，确保超宽屏幕（>1920px）内容不无限拉伸
- **收缩策略**：视口 <1920px 时，内容区域通过 Flex/Grid 自动收缩，不出现水平滚动条
- **自动布局引擎**：优先使用 CSS Grid（卡片网格、图表区）+ Flexbox（工具栏、表单行），所有子元素尺寸由 `fr` / `flex` / `%` 定义，禁止固定 `width` 像素值用于布局容器
- **内边距自适应**：使用 `clamp()` 函数或响应式断点控制页面级水平内边距，1920px 时为 `40px`，1024px 时缩减为 `24px`

### 基础网格

- 页面底层使用 **12 列网格**，列宽 `1fr`，列间距 `{spacing.6}` (24px)
- 1920px 基准下，内容可用宽度约 **1840px**（扣除左右各 40px 水平内边距），单列宽度约 **131px**
- 卡片、图表、表格等区块按列跨度放置，不设固定像素宽度

## 颜色

### 页面底色
- **Page** (`{colors.page}` — #f4f7fb): 全局页面底色，浅蓝灰，为白色卡片提供柔和对比

### 表面
- **Surface** (`{colors.surface}` — #ffffff): 默认卡片和面板底色
- **Surface-2** (`{colors.surface-2}` — #f8fafc): 次级表面，用于 hover 态
- **Table Header BG** (`{colors.table-header-bg}` — #FBFCFE): 表格表头背景色
- **Surface-3** (`{colors.surface-3}` — #f1f5f9): 三级表面，用于分隔区域

### 描边
- **Line** (`{colors.line}` — #e6ecf2): 默认描边，卡片/表格边框
- **Line Soft** (`{colors.line-soft}` — #eef3f7): 柔和描边，图表网格线
- **Line Strong** (`{colors.line-strong}` — #d5dde7): 强调描边，输入框边框

### 文字
- **Ink 900** (`{colors.ink-900}` — #1f2d3d): 主文字，页面标题、卡片标题
- **Ink 700** (`{colors.ink-700}` — #4d6278): 正文，表格数据
- **Ink 500** (`{colors.ink-500}` — #617285): 次要文字，控件标签
- **Ink 300** (`{colors.ink-300}` — #8d9bae): 辅助文字，面包屑
- **Ink 200** (`{colors.ink-200}` — #b6c0cd): 禁用态文字
- **Table Header Text** (`{colors.table-header-text}` — #97A6B8): 表格表头文字色

### 品牌
- **Brand 50** (`{colors.brand-50}` — #eef8fc): 品牌色最浅底
- **Brand 100** (`{colors.brand-100}` — #d9eef7): 品牌浅底，hover 态
- **Brand 300** (`{colors.brand-300}` — #86c8df): 品牌中浅
- **Brand 500** (`{colors.brand-500}` — #eef8fc): **主品牌色**，按钮、激活态、图表主色
- **Brand 600** (`{colors.brand-600}` — #2587b1): hover 加深
- **Brand 700** (`{colors.brand-700}` — #1f6f92): 最深品牌色

### 语义色
- **Success** (背景 `{colors.success-50}` #ecfdf5, 文字 `{colors.success-700}` #047857): 正向指标 / 已支付
- **Warning** (背景 `{colors.warning-50}` #fffbeb, 文字 `{colors.warning-700}` #b45309): 警示 / 待处理
- **Danger** (背景 `{colors.danger-50}` #fef2f2, 文字 `{colors.danger-700}` #be123c): 危险 / 流失告警
- **Info** (背景 `{colors.info-50}` #eef8fc, 文字 `{colors.info-700}` #1f6f92): 信息提示

### 图表色板
- **Chart Bar** (`{colors.chart-bar}` — #A2C2E4): 一维图表柱状图主色，单色图表统一使用
- **Chart Bar Compare** (`{colors.chart-bar-compare}` — #BDE7ED): 双色图表对比柱颜色
- **Chart Line** (`{colors.chart-line}` — #caa24e): 图表折线/同比趋势线颜色
- **Data 1** (`{colors.data-1}` — #A2C2E4): 图表主数据色
- **Data 2** (`{colors.data-2}` — #A2C2E4): 图表数据色2
- **Data 3** (`{colors.data-3}` — #BDE7ED): 图表数据色3
- **Data 4** (`{colors.data-4}` — #caa24e): 图表数据色4
- **Data 5** (`{colors.data-5}` — #c084fc): 图表数据色5
- **Data Neutral** (`{colors.data-neutral}` — #cbd5e1): 中性灰，用于对比基线、进度条背景

## 字体

### 字体家族
主字体栈：`'Inter', 'PingFang SC', 'Microsoft YaHei', sans-serif`

- Inter 承载拉丁字符、数字、标点
- PingFang SC 承载中文字符
- Microsoft YaHei 作为 Windows 中文字体回退

### 字号层级

| Token | 字号 | 字重 | 用途 |
|--------|------|------|------|
| `{typography.page-heading}` | 22px | 600 | 页面标题 |
| `{typography.section-title}` | 16px | 600 | 区块标题 |
| `{typography.card-title}` | 14px | 600 | 卡片标题 / 段落标题 |
| `{typography.body}` | 13px | 400 | 正文 |
| `{typography.meta}` | 12px | 400 | 控件、副文、表格 |
| `{typography.micro}` | 11px | 400 | 标签、辅助 |
| `{typography.table-header}` | 12px | 600 | 表格表头（Poppins） |

### 指标数字

| Token | 字号 | 字重 | 用途 |
|--------|------|------|------|
| `{typography.num-lg}` | 28px | 600 | 大指标值（KPI 卡片主数值） |
| `{typography.num-md}` | 22px | 600 | 中指标值 |
| `{typography.num-sm}` | 16px | 600 | 小指标值 |

### 字体原则
- 数字默认等宽 (`font-variant-numeric: tabular-nums`)，避免指标值跳动
- `font-feature-settings: 'tnum' 1, 'cv11' 1` 确保数字对齐
- 全页面 `-webkit-font-smoothing: antialiased` 提升渲染质量
- 汉字与拉丁混排时，行高统一 1.2-1.5

## 布局

### 自动布局引擎

页面全局采用 **CSS Grid + Flexbox 双引擎自动布局**，杜绝固定像素宽度在布局容器上的使用。

#### Flexbox 场景
- **工具栏 (toolbar-v2)**：`display: flex; align-items: center; gap: {spacing.3}; flex-wrap: wrap`
- **表单行/筛选区**：`display: flex; gap: {spacing.4}`，子元素以 `flex` 比例分配空间
- **按钮组**：`display: inline-flex; gap: {spacing.2}`
- **页面面板切换**：`display: flex; flex-direction: column`

#### CSS Grid 场景
- **指标卡片网格 (kpi-grid-v2)**：`display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: {spacing.6}` — 自动计算列数，卡片宽度自适应
- **图表 + 表格双栏区**：`display: grid; grid-template-columns: 1fr 1fr; gap: {spacing.6}` — 等分两列，自动跟随容器宽度
- **页面整体 12 列网格**：`display: grid; grid-template-columns: repeat(12, 1fr); gap: {spacing.6}` — 区块按列跨度放置

#### 约束与自适应规则
- 所有布局容器宽度使用 `%` / `fr` / `auto` / `minmax()` 定义，不设固定 `px` 值
- 内容最大宽度约束：`max-width: 1920px; margin: 0 auto` 在 `<main>` 级别
- 最小内容宽度约束：`min-width: 1024px`（低于此值触发响应式断点重排）
- 卡片、表格等内部使用 `width: 100%` 撑满父容器
- 间距统一使用 `gap` 属性，不依赖 `margin` 控制子元素间距（便于自动布局计算）

### 页面结构
```
<body class="bg-[#f4f7fb]">
  <div class="min-h-screen">
    <main style="max-width: 1920px; margin: 0 auto; min-width: 1024px">
      <!-- 页面面板 (page-panel) -->
      <section class="page-panel active" id="...">
        <div class="page-canvas-v2">
          <!-- Tab 导航 (tabs-v2) -->
          <!-- 工具栏 (toolbar-v2) -->
          <!-- 指标卡片区 (kpi-grid-v2, CSS Grid auto-fill) -->
          <!-- 图表区 (chart-board) -->
          <!-- 数据表格区 -->
        </div>
      </section>
    </main>
  </div>
</body>
```

- 无侧边栏，无顶部 Header
- 主容器 `min-h-screen` 全视口高度
- `<main>` 带 `max-width: 1920px; margin: 0 auto; min-width: 1024px` 实现画布居中与自适应
- `<main>` 水平内边距响应式：1920px 基准为 `40px`，1024px 时缩减为 `24px`
- 页面面板通过 `display: none/block` 切换显示

### 间距系统
基准单位 4px，8 档梯度：

| Token | 值 | 典型用途 |
|--------|-----|----------|
| `{spacing.1}` | 4px | 图标与文字间距、chip 内边距 |
| `{spacing.2}` | 8px | 紧凑元素间距 |
| `{spacing.3}` | 12px | 卡片内边距（小） |
| `{spacing.4}` | 16px | 标准内边距 |
| `{spacing.5}` | 20px | 卡片间距 |
| `{spacing.6}` | 24px | 区块间距 |
| `{spacing.8}` | 32px | 大区块间距 |
| `{spacing.10}` | 40px | 页面级间距 |

### 圆角
| Token | 值 | 用途 |
|--------|-----|------|
| `{rounded.sm}` | 4px | Chip / 小控件 / 标签 |
| `{rounded.md}` | 4px | 按钮 / 输入框 / 卡片 |
| `{rounded.lg}` | 12px | 容器卡 / 大面板 |
| `{rounded.full}` | 999px | 开关轨道 / 圆钮 / pill 胶囊标签 |

### 阴影
系统采用极克制阴影策略，仅 3 级：

| Token | 值 | 用途 |
|--------|-----|------|
| `{shadows.panel}` | 0 1px 2px rgba(15,23,42,0.04) | 卡片默认 |
| `{shadows.float}` | 0 4px 12px rgba(15,23,42,0.06) | 悬浮卡片 |
| `{shadows.pop}` | 0 8px 24px rgba(15,23,42,0.08) | 弹出层 |

### 控件高度
| Token | 值 | 用途 |
|--------|-----|------|
| `{controlHeight.sm}` | 30px | 小按钮 / 紧凑控件 |
| `{controlHeight.md}` | 38px | 标准按钮 / 输入框 |
| `{controlHeight.lg}` | 38px | 大按钮 / 搜索框 |

## 信息层级

### Z-Index 分层体系

统一的 z-index 分层确保浮层、弹窗、遮罩的堆叠关系始终正确：

| 层级 | z-index | 用途 |
|------|---------|------|
| 基础内容 | `0` | 页面卡片、表格、图表等地面内容 |
| 悬浮卡片 | `10` | hover 态抬升的卡片（kpi-card hover） |
| Sticky 工具栏 | `20` | 吸附在顶部的筛选栏/操作栏 |
| 下拉菜单 | `30` | customer-menu、select 弹出选项 |
| Tooltip | `40` | info-tip、图表 hover 提示 |
| 遮罩层 | `50` | 弹窗/抽屉背后的半透明遮罩 |
| 弹窗/对话框 | `60` | 模态弹窗、确认对话框 |
| 全局通知 | `100` | Toast、全局消息条 |

### 视觉权重规则

建立从页面标题到辅助文字的 5 级视觉权重，确保用户按正确顺序浏览信息：

| 层级 | 视觉元素 | 字号/字重 | 颜色 | 用途 |
|------|---------|----------|------|------|
| **L1 主标题** | 页面标题 | 22px / 600 | `{colors.ink-900}` | 页面核心定位，用户第一眼落点 |
| **L2 区块** | 区块标题、大 KPI 数值 | 16-28px / 600 | `{colors.ink-900}` | 区块划分锚点，快速扫描定位 |
| **L3 内容** | 卡片标题、表格数据、正文 | 13-14px / 400-600 | `{colors.ink-700}` | 核心信息承载，占比最大 |
| **L4 辅助** | 标签、控件文字、图例 | 12px / 400-500 | `{colors.ink-500}` | 辅助说明，不抢主信息注意力 |
| **L5 微弱** | 占位文字、禁用态、水印 | 11-12px / 400 | `{colors.ink-200} / {colors.ink-300}` | 仅在被需要时关注 |

### 内容优先级模式

- **F-Pattern（经营总览 / 流失分析）**：用户先水平扫描顶部 KPI 卡片行，再垂直扫描左侧列表/图表，适合数据看板
- **Z-Pattern（企业 360 / 潜力机会）**：用户从左到右、从上到下扫描，适合信息密度中等的详情页
- 页面主操作（查询、导出按钮）放置在 **右上角工具栏** 位置，符合视觉扫描终点的操作直觉
- 次要操作（重置、取消）放在主操作**左侧或下方**，降低视觉权重

### 间距与层级对应

间距本身是信息层级的一部分——间距越大，表示逻辑分隔越强：

| 间距 Token | 值 | 层级含义 |
|------------|-----|---------|
| `{spacing.10}` | 40px | 页面级分隔（不同功能区块之间） |
| `{spacing.8}` | 32px | 大区块分隔（图表区与表格区之间） |
| `{spacing.6}` | 24px | 区块内部分隔（卡片网格与下方内容之间） |
| `{spacing.4}` | 16px | 组件间分隔（卡片之间、字段之间） |
| `{spacing.2}` | 8px | 紧密元素分隔（图标与文字、chip 之间） |

## 组件

### 页面面板 (page-panel)
- 每个页面为一个 `<section class="page-panel">` 
- 通过 `.active` 类控制显示
- 默认隐藏 (`display: none`)，激活后 `display: block`
- 四个页面面板 ID：`overview`（经营总览）、`risk-share`（流失分析）、`customer`（企业 360）、`opportunity`（潜力机会）

### 页面画布 (page-canvas-v2)
- 面板内的内容容器，承载 Tab、工具栏、卡片、图表、表格等
- 使用 design token 变量控制间距和排版

### Tab 导航 (tabs-v2)
- 水平 Tab 栏，用于页面内子视图切换
- 激活态：深色文字 + 底部品牌色指示线
- 非激活态：浅灰色文字
- 典型用法：销售数据 / 下载中心 切换

### 工具栏 (toolbar-v2)
- 位于 Tab 下方的操作栏
- 包含筛选器（客户选择器、时间粒度选择器等）
- 水平排列，元素间距由 `--space-3` 控制

### 按钮 (BUTTON COMPONENTS)

基于 Figma 组件集 `BUTTON COMPONENTS` (node-id=58:2)，含 `button-outline-primary`、`button-secondary`、`button-primary-filled` 三种变体，每种含 Default / Hover / Active / Disabled 四个状态。

#### 设计原则

- **常规任务默认使用 `button-outline-primary` 或 `button-secondary`**
- **`button-primary-filled` 禁止默认使用**，仅当用户**明确指定**需要实心高强调 CTA 按钮时才参与设计
- 按钮圆角统一 `{rounded.md}` (4px)
- 文字统一：Inter SemiBold 13px，行高 18px
- 内边距统一：`{spacing.3}` (14px) 左右，`{spacing.2}` (8px) 上下
- Transition：`{easing.fast}` (0.12s)

#### 三层按钮体系

```
强调程度：button-outline-primary  >  button-secondary  >  (button-primary-filled 需指定)
用途定位：  品牌主操作              中性次操作              高强调 CTA（禁默认使用）
```

---

#### button-outline-primary（品牌主操作）

用于需要品牌色引导的主要操作，如查询、导出。

| 状态 | 背景 | 边框 | 文字色 |
|------|------|------|--------|
| **Default** | `{colors.table-header-bg}` (#EEF8FC) | `0.6px solid #e1eef5` | `{colors.brand-500}` (#2F87AC) |
| **Hover** | `#f4fbfe` | `0.6px solid #d9edf6` | `{colors.brand-500}` (#2F87AC) |
| **Active** | `#f4fbfe` | `0.6px solid #d9edf6` | `#1f6d8a`（加深） |
| **Disabled** | `{colors.table-header-bg}` (#FBFCFE) | `0.6px solid #f0f4f7` | `{colors.table-header-text}` (#97A6B8) |

---

#### button-secondary（中性次操作）

用于需要降低视觉权重的次要操作，如重置、取消、返回。

| 状态 | 背景 | 边框 | 文字色 |
|------|------|------|--------|
| **Default** | `{colors.surface}` (#ffffff) | `1px solid {colors.line-strong}` (#d5dde7) | `{colors.ink-700}` (#4d6278) |
| **Hover** | `{colors.surface-2}` (#f8fafc) | `1px solid {colors.line-strong}` (#d5dde7) | `{colors.ink-700}` (#4d6278) |
| **Active** | `{colors.surface-3}` (#f1f5f9) | `1px solid #c0cad5` | `{colors.ink-700}` (#4d6278) |
| **Disabled** | `{colors.surface}` (#ffffff) | `1px solid {colors.line-soft}` (#eef3f7) | `{colors.ink-200}` (#b6c0cd) |

---

#### button-primary-filled（高强调 CTA，需显式指定才可使用）

**⚠️ 禁止默认使用。** 仅当用户明确要求或场景确需最高强调级别时才使用。

| 状态 | 背景 | 文字色 |
|------|------|--------|
| **Default** | `{colors.brand-500}` (#EEF8FC) | `{colors.surface}` (#2F87AC) |
| **Hover** | `#F4FBFE` | `{colors.surface}` (#1F6D8A) |
| **Active** | `#1f6d8a` | `{colors.surface}` (#ffffff) |
| **Disabled** | `#b8d8e7` | `{colors.surface}` (#ffffff) |

---

#### 按钮使用场景速查

| 按钮 | 推荐组件 | 理由 |
|------|---------|------|
| 查询 | `button-outline-primary` | 品牌主操作 |
| 导出 | `button-outline-primary` | 品牌主操作 |
| 确定 | `button-outline-primary` | 弹窗主操作 |
| 确认新增/修改 | `button-outline-primary` | 弹窗主操作 |
| + 新增 | `button-outline-primary` | 页面主操作 |
| 批量修改 | `button-outline-primary` | 页面主操作 |
| 重置 | `button-secondary` | 中性次操作，降低权重 |
| 取消 | `button-secondary` | 弹窗次操作，降低权重 |
| 返回 | `button-secondary` | 导航次操作 |
| 确认删除 | 自定义 (danger 色) | 危险操作需特殊处理 |

#### 三种按钮速查表

| 变体 | 默认背景 | 默认边框 | 默认文字 | 默认使用 |
|------|---------|---------|---------|---------|
| `outline-primary` | `#FBFCFE` | `0.6px #D9EEF7` | `#2F87AC` | **是** |
| `secondary` | `#ffffff` | `1px #d5dde7` | `#313333` | **是** |
| `primary-filled` | `#EEF8FC` | 无 | `#2F87AC` | **否**，需显式指定 |

### 分段控制器 / 时间粒度筛选 (Seg / Time Grain)

基于 Figma 组件集 `Seg / Time Grain` (node-id=137:32)，含 Default / Custom 两个状态变体。

**容器 (.seg.seg--toolbar)**：
- Flex 行布局，按钮间距 2px
- 最小高度 36px (`{controlHeight.lg}`)
- 允许换行 (`flex-wrap: wrap`)

**按钮 (.time-filter-btn)**：
- 高度 24–28px，左右内边距 `{spacing.3}` (12px)
- 圆角 5px
- **默认**: 透明背景、无边框、`{colors.ink-500}` (#617285) 文字、Regular 字重
- **Hover**: 文字加深至 `{colors.ink-900}`
- **激活 (.active)**: `{colors.surface-3}` (#f1f5f9) 背景、`{colors.ink-900}` 文字、Medium 字重

**自定义按钮 (.time-custom-btn)**：
- 同为 seg 按钮，默认无边框透明
- 点击后隐藏自身，显示日期选择器
- 日期选择器：`{colors.surface-3}` 背景、无边框、圆角 5px、高度 28px
- 日期输入框：透明背景、无边框、12px Regular

**交互 (2 态切换)**：
| 操作 | 效果 |
|------|------|
| 点击预设粒度（按日/按周/半月/按月/按季） | 激活该按钮，隐藏日期选择器，恢复自定义按钮 |
| 点击「自定义」 | 取消所有预设，隐藏自定义按钮，显示日期选择器 |

### 指标卡片网格 (kpi-grid-v2) & 指标卡片 (kpi-card-v2)

基于 Figma 组件集 `KPI Card` (node-id=129:5)，含 Default / Hover / Active 三个交互状态。

**Grid 容器 (kpi-grid-v2)**：
- CSS Grid 布局，`display: grid`
- 列配置：`.cols-2` (2列) / `.cols-3` (3列) / `.cols-4` (4列)
- 列间距 `{spacing.3}` (12px)
- 响应式：≤768px 强制单列

**Card (kpi-card-v2) — Default 状态**：
- 背景 `#f8fafc` (`{colors.surface-2}`)
- 边框 `1px solid #eef3f7` (`{colors.line-soft}`)
- 圆角 `{rounded.md}` (8px)
- 内边距 `{spacing.4}` (16px) 上下 / `{spacing.5}` (20px) 左右
- 内部纵向 auto-layout，间距 8px (`{spacing.2}`)
- `overflow: hidden`，`position: relative`

**Card (kpi-card-v2) — Hover 状态**：
- 背景 `#ffffff` (`{colors.surface}`)
- 边框 `1px solid #e6ecf2` (`{colors.line}`)
- 文字颜色不变
- Transition: `{easing.fast}`

**Card (kpi-card-v2) — Active/Pressed 状态**：
- 背景 `#ffffff`
- 边框 `1px solid #d5dde7` (`{colors.line-strong}`)
- 增加轻微阴影 `0 2px 4px rgba(15,23,42,0.06)`

**内部结构**：

| 元素 | 类名 | 样式 |
|------|------|------|
| **Label** | `.label` | Inter Medium 11px, `{colors.ink-300}` (#8d9bae) |
| **Value** | `.value` | Inter SemiBold 22px, `{colors.ink-900}` (#1f2d3d), letter-spacing -0.015em, tabular-nums, margin-top 8px |
| **Foot 区域** | `.foot` | Flex row, 12px gap, margin-top 8px |
| **Foot 文字** | (span) | Inter Regular 11px, `{colors.ink-300}` |
| **Foot 数值** | `strong` | Inter Medium 11px, `{colors.ink-700}` (#4d6278), tabular-nums |
| **Delta 指示** | `.delta` | Inter Medium 11px; 涨 .delta-up 绿色 `{colors.success-700}`, 跌 .delta-down 红色 `{colors.danger-700}` |

**Accent 变体 (.accent)**：
- 左侧 3px 品牌色竖线 (`::before` 伪元素)
- 颜色 `{colors.brand-500}` (#EEF8FC)
- 位置：`top: 16px; bottom: 16px; left: 0`
- 圆角右侧 2px

**Compact 变体 (.compact)**：
- 更紧凑的内边距和字号（用于 4 列 Grid 或侧栏场景）

**Foot 对比行变体 (.kpi-foot-compare)**：
- Flex column 纵向排列
- 每行 `.kpi-foot-row` 包含：周期标签 + 对比数值/Delta
- 两行间距由父容器 foot 的 gap 控制

### 客户选择器 / 下拉组件 (Form Select)

基于 Figma 设计稿 (node-id=61:16) 精确还原。

**Trigger (customer-trigger-v2)** — 下拉触发器按钮：
- 内联 flex 布局，`inline-flex align-items: center`
- 高度 `40px`
- 最小宽度 `260px`
- 内部间距 `gap: 40px`（label 区域 与 value+chevron 区域之间）
- 背景 `#ffffff`
- 边框 `1px solid #dee0e5`
- 圆角 `8px`
- 内边距 `10px 12px`
- 文字色 `#1f2d3d`，字号 `14px`
- **Hover**: 边框加深至 `#d5dde7`
- **展开态 (aria-expanded="true")**: 边框 `1.5px solid #2f87ac`
- **Focus-visible**: 边框 `1.5px solid #2f87ac`，无 outline
- **Transition**: `{easing.fast}`

**Label (.meta)** — 触发器左侧标签：
- 字体 `'Inter', 'Noto Sans SC', sans-serif`
- 字重 `400` (Regular)
- 字号 `13px`
- 文字色 `#97a6b8`
- 行高 `normal`
- `flex-shrink: 0`

**Value (.name)** — 触发器选中值：
- 字体 `'Inter', 'Noto Sans SC', 'Noto Sans JP', sans-serif`
- 字重 `400` (Regular)
- 字号 `14px`
- 文字色 `#1f2d3d`
- 行高 `19px`
- `flex: 1; min-width: 0`，溢出省略号截断

**Chevron (.chev)** — 下拉箭头：
- 字符 `▾`（非 FontAwesome 图标）
- 字体 `'Inter', 'Noto Sans', sans-serif`
- 字重 `700` (Bold)
- 字号 `12px`
- 文字色 `#97a6b8`
- 行高 `16px`
- `flex-shrink: 0`

**Menu (customer-menu)** — 弹出菜单容器：
- 绝对定位，`left: 0; top: calc(100% + 4px)`
- z-index 20
- 宽度 `260px`（与 Trigger 同宽）
- 背景 `#ffffff`
- 边框 `1.5px solid #2f87ac`
- 圆角 `8px`（与 Trigger 一致）
- 内边距 `10px`
- Flex 纵向排列，选项间距 `gap: 5px`
- 阴影 `{shadows.float}`
- 默认隐藏 (`[hidden]` → `display: none !important`)

**Option (customer-option / *-customer-option)** — 菜单选项：
- 全宽 (`width: 100%`)
- 高度 `32px`
- 内边距 `7px 0 7px 12px`
- 圆角 `0`（无圆角）
- 边框 `none`
- 背景 `#ffffff`（默认）
- 文字：`'Inter', 'Noto Sans JP', 'Noto Sans SC', sans-serif` / `400` / `13px` / `#1f2d3d` / 行高 `18px`
- 文字左对齐
- **Hover**: 背景 `#f4fbfe`
- **Active (选中态)**: 背景 `#f4fbfe`，边框 `transparent`
- **Transition**: `{easing.fast}`
- 白色背景卡片，圆角 `{rounded.lg}`
- 包含指标标签（小字灰色）、数值（大字 `{typography.num-lg}`）、对比变化（带正负色）
- 多卡片网格排列，间距 20px

### 输入框 (Form Input)

基于 Figma 组件 `input / default` (node-id=111:369)，含 Default / Focus / Error / Disabled 四个状态变体。

**核心设计原则**：Label 标题文字和输入内容区域**共同包裹在一个带边框的外层容器内**，而非 Label 在外、输入框独立的分离结构。

**外层容器 (input-container)**：
- Flex 行布局，`display: flex; align-items: center`
- 内边距：上下 `{spacing.1}` (4px)，左右 `15px`
- 圆角 `{rounded.md}` (8px)
- 子元素间距：无 gap（Label 与输入区紧密相邻）
- 宽度撑满父容器

**标题 Label (.input-label)**：
- 字体 `'Inter', 'Noto Sans SC', sans-serif`
- 字重 `400` (Regular)，字号 `13px`
- 文字色 `{colors.table-header-text}` (#97A6B8)
- 行高 `normal`
- `flex-shrink: 0`，不换行

**输入内容区域 (.input-area)**：
- Flex 行布局，`display: flex; align-items: center`
- 背景 `{colors.surface}` (#ffffff)
- 圆角 `{rounded.sm}` (6px)
- 内边距：`{spacing.3}` (12px) 左右，`{spacing.2}` (8px) 上下
- `flex: 1; min-width: 0`
- **注意**：输入区域内部无独立边框，边框由外层容器统一控制

**Placeholder / Value 文字**：
- 字体 `'Inter', 'Noto Sans SC', sans-serif`
- 字重 `400` (Regular)，字号 `13px`
- 行高 `normal`
- Placeholder 色：`#bfc9d6`（浅灰蓝）
- Value 色：`{colors.ink-900}` (#1f2d3d)

#### 状态变体

**Default (`input / default`)**：
- 外层容器：背景 `{colors.surface}` (#ffffff)，边框 `0.6px solid #e1eef5`
- Label：`{colors.table-header-text}` (#97A6B8)
- Placeholder：`#bfc9d6`
- Hover：边框加深为 `{colors.line-strong}` (#d5dde7)

**Focus (`input / focus`)**：
- 外层容器：背景 `{colors.surface}`，边框 `1.5px solid {colors.brand-500}` (#2F87AC)
- Label：`{colors.table-header-text}` (#97A6B8)
- Value 文字：`{colors.ink-900}` (#1f2d3d)
- Focus-visible：无额外 outline，边框颜色变化即为焦点指示
- Transition：`{easing.fast}`

**Error (`input / error`)**：
- 外层容器：背景 `{colors.surface}`，边框 `1.5px solid #c66261`
- Label：`{colors.table-header-text}` (#97A6B8)
- Placeholder：`#bfc9d6`
- 可配合下方红色错误提示文字使用

**Disabled (`input / disabled`)**：
- 外层容器：背景 `#f5f7fb`，边框 `1px solid #f0f4f7`
- Label：`{colors.table-header-text}` (#97A6B8)
- Placeholder：`#bfc9d6`
- 整体不可交互，无 hover 效果

#### 交互状态速查

| 状态 | 外层背景 | 外层边框 | Label 色 | 文字色 |
|------|---------|---------|---------|--------|
| Default | `#ffffff` | `0.6px #e1eef5` | `#97A6B8` | `#bfc9d6` (placeholder) |
| Focus | `#ffffff` | `1.5px #2F87AC` | `#97A6B8` | `#1f2d3d` (value) |
| Error | `#ffffff` | `1.5px #c66261` | `#97A6B8` | `#bfc9d6` (placeholder) |
| Disabled | `#f5f7fb` | `1px #f0f4f7` | `#97A6B8` | `#bfc9d6` (placeholder) |

#### 与旧版组件的区别

| 特性 | 旧版（已废弃） | 新版（当前规范） |
|------|--------------|----------------|
| Label 位置 | Label 在输入框外部独立放置 | Label 在带边框的外层容器内部 |
| 边框归属 | 仅输入区域有独立边框 (`#d5dde7 1px rounded 6`) | 边框在外层容器上 (`#e1eef5 0.6px rounded 8`)，输入区域无独立边框 |
| Label 颜色 | `{colors.ink-500}` (#617285) | `{colors.table-header-text}` (#97A6B8) |
| 输入区域圆角 | 6px | 6px（在外层 8px 圆角内） |

### 开关 (Switch)

基于 Figma 组件库 `订单通组件 / SWITCH ITEM` (file=0MXuYqIfMLENxlqG7XdSck, node-id=11:2) 精确还原。Switch 是布尔状态切换控件，含 **On（开）** 和 **Off（关）** 两个状态变体，用于设置项的即时启用/停用。

**轨道 (track)**：
- 尺寸：宽 `44px` × 高 `24px`（固定）
- 圆角：`{rounded.full}` 999px（pill 全圆角）
- `overflow: hidden`，`position: relative`
- **On 态背景**：`{colors.brand-500}` (#2F87AC)
- **Off 态背景**：`{colors.data-neutral}` (#cbd5e1)

**圆钮 (thumb)**：
- 尺寸：`18px × 18px`（固定正方形）
- 颜色：`{colors.surface}` (#ffffff)
- 圆角：`{rounded.full}` 999px（正圆）
- 垂直定位：`top: 3px`（轨道高 24 - thumb 18 = 6，上下各 3px 居中）
- **On 态水平定位**：`left: 23px`（贴右，右侧留 3px）
- **Off 态水平定位**：`left: 3px`（贴左，左侧留 3px）
- 切换位移：`20px`（23 − 3），开关动画沿水平方向滑动

**状态速查**：

| 状态 | 轨道背景 | 圆钮位置 | 语义 |
|------|---------|---------|------|
| **On（开）** | `{colors.brand-500}` (#EEF8FC) | `left: 23px`（右） | 功能已启用 |
| **Off（关）** | `{colors.data-neutral}` (#cbd5e1) | `left: 3px`（左） | 功能已停用 |

**交互**：
- 点击轨道任意位置切换 On/Off
- 切换时圆钮水平滑动 + 轨道背景色过渡，过渡 `{easing.base}` (0.18s)
- Disabled 态：整体 `opacity: 0.4`，`cursor: not-allowed`，无 hover/点击响应
- Focus：可见聚焦环 `0 0 0 3px rgba(46,160,206,0.18)`

```css
.switch {
  width: 44px; height: 24px;
  border-radius: 999px;
  position: relative;
  transition: background 0.18s cubic-bezier(0.2, 0.8, 0.2, 1);
}
.switch--on  { background: #2F87AC; }   /* brand-500 */
.switch--off { background: #cbd5e1; }   /* data-neutral */
.switch__thumb {
  position: absolute;
  width: 18px; height: 18px; top: 3px;
  background: #ffffff;
  border-radius: 999px;
  transition: left 0.18s cubic-bezier(0.2, 0.8, 0.2, 1);
}
.switch--on  .switch__thumb { left: 23px; }
.switch--off .switch__thumb { left: 3px; }
```

### 设置项 (Switch Item / setting-item)

基于 Figma 页面 `订单通知设置 / 消息接收配置` (file=DEyZ3lrUHsg1vsi60McIVj, node-id=21:537) 精确还原。Switch Item 是 Switch 开关在页面中的标准应用形态——**左侧文字说明 + 右侧开关**的设置行，用于「消息接收配置」「自动接单」等开关型设置区。

**外层容器（设置卡）**：
- 背景 `{colors.surface}` (#ffffff)
- 边框 `1px solid {colors.line-soft}` (#eef3f7)
- 圆角 `{rounded.lg}` (12px)
- 承载一组设置行，行间以分隔线划分

**设置行 (setting-item)**：
- 高度 `64px`（固定），宽度撑满容器
- 左右两端对齐布局：左侧文字块，右侧 Switch
- Switch 距容器右边缘 `13px`，垂直居中（`top: 20px`，(64−24)/2 = 20）

**标题 (setting-title)**：
- 字体 Inter SemiBold，字号 `13px`，行高 `19px`
- 文字色 `{colors.ink-900}` (#1f2d3d)
- 左内边距 `18px`，距行顶 `13px`

**描述 (setting-desc)**：
- 字体 Inter Regular，字号 `12px`，行高 `17px`
- 文字色 `{colors.table-header-text}` (#97A6B8)
- 左内边距 `18px`，距行顶 `35px`（位于标题下方）

**分隔线 (item-line)**：
- 高度 `1px`，颜色 `{colors.line-soft}` (#eef3f7)
- 位于相邻两行之间，最后一行下方无分隔线

**结构速查**：

| 元素 | 字号/尺寸 | 字重 | 颜色 | 定位 |
|------|----------|------|------|------|
| 容器 | 边框 1px / 圆角 12px | — | 背景 #fff，边框 #eef3f7 | — |
| setting-item 行 | 高 64px | — | — | 全宽 |
| setting-title | 13px / 行高 19px | SemiBold | `{colors.ink-900}` #1f2d3d | left 18px, top 13px |
| setting-desc | 12px / 行高 17px | Regular | `{colors.table-header-text}` #97A6B8 | left 18px, top 35px |
| switch | 44×24 | — | 见「开关 (Switch)」 | 距右 13px, top 20px |
| item-line | 高 1px | — | `{colors.line-soft}` #eef3f7 | 行底 |

```
<div class="setting-card">            <!-- 白底 / 1px #eef3f7 / 圆角 12px -->
  <div class="setting-item">          <!-- 高 64px -->
    <div class="setting-text">
      <p class="setting-title">浏览器弹窗提醒</p>
      <p class="setting-desc">新订单或订单状态变化时，在浏览器右上角弹窗提醒。</p>
    </div>
    <div class="switch switch--on"><div class="switch__thumb"></div></div>
  </div>
  <div class="item-line"></div>       <!-- 1px #eef3f7 分隔线 -->
  <div class="setting-item">…</div>
</div>
```

### 图表面板 (chart-board)
- 固定高度 252px 的图表容器
- 白色背景，1px `#e8eef5` 边框
- 内部包含：
  - 网格线 (chart-grid)
  - 柱状图区 (chart-bars)
  - 折线图区 (chart-line)
  - 坐标轴 (chart-axis-left/right/bottom)
- 柱状图使用 `{colors.chart-bar}` (#A2C2E4)，对比柱使用 `{colors.chart-bar-compare}` (#BDE7ED)
- 折线图描边色 `{colors.chart-line}` (#caa24e)

### 进度条 (progress bars)
- 用于展示占比和完成度
- 背景色 `{colors.data-neutral}` (#cbd5e1)
- 填充色可配置（品牌色、数据色板各色）
- 高度 8px，圆角 999px

### 数据表格 (tbl-v2)
- 标准表格组件，使用 `.tbl-v2` CSS 类
- **表头行**:
  - 背景色 `{colors.table-header-bg}` (#FBFCFE)
  - 高度 48px（由 `th` 元素承载）
  - 字体 `{typography.table-header}`：Poppins 600 12px，行高 18px
  - 文字色 `{colors.table-header-text}` (#97A6B8)
  - 底部 1px `{colors.line}` 分隔线
  - 左右内边距 `{spacing.3}` (12px)
- **数据行**:
  - 白色背景，hover 态切换为 `{colors.surface-2}` (#f8fafc)
  - 字体 `{typography.meta}` (12px) 或 `{typography.body}` (13px)
  - 行底 1px `{colors.line-soft}` 分隔线
  - 末行无底部分隔线
- 数字列等宽对齐 (`font-variant-numeric: tabular-nums`)
- `border-collapse: collapse`，全宽 `width: 100%`

### 翻页器 (pagination-row)

基于 Figma 组件 `pagination-row` (node-id=60:51)，位于数据表格底部，用于展示总记录数并提供分页导航。

**容器 (.pagination-row)**：
- Flex 行布局，`display: flex; align-items: center; justify-content: space-between`
- 背景 `{colors.table-header-bg}` (#FBFCFE)
- 边框 `0.6px solid #f0f4f7`
- 圆角 `{rounded.md}` (8px)
- 最小高度 `52px`
- 内边距：`{spacing.3}` (11px) 上下，`18px` 左右
- 宽度撑满父容器

**总记录数文字 (左侧)**：
- 字体 `'Inter', 'Noto Sans SC', sans-serif`
- 字重 `400` (Regular)，字号 `12px`
- 文字色 `#647487`
- 行高 `16px`
- 文案格式：`共 {N} 条记录`

**页码按钮组 (右侧)**：
- Flex 行布局，`display: flex; align-items: center; gap: 6px`
- 包含三种按钮类型：

#### 导航按钮 (.pagination-button)

用于 `上一页` / `下一页` 操作。

- 固定尺寸：`42px × 30px`
- 背景 `{colors.surface}` (#ffffff)
- 边框 `0.6px solid {colors.line}` (#e6ecf2)
- 圆角 `{rounded.md}` (8px)
- 内容居中 (`justify-content: center; align-items: center`)
- 文字：`<` 或 `>` 符号，`12px` Regular，`#647487`，行高 `16px`
- Hover：边框加深为 `{colors.line-strong}` (#d5dde7)
- Transition：`{easing.fast}`

#### 数字按钮 (.pagination-number)

用于可点击的页码数字。

- 固定尺寸：`30px × 30px` (正方形)
- 背景 `{colors.surface}` (#ffffff)
- 边框 `0.6px solid {colors.line}` (#e6ecf2)
- 圆角 `{rounded.md}` (8px)
- 内容居中
- 文字：页码数字，`12px` Regular，`#647487`，行高 `16px`
- Hover：边框加深

#### 激活态按钮 (.pagination-button-active)

用于当前选中页码。

- 固定尺寸：`30px × 30px` (正方形)
- 背景 `#f4fbfe`（浅蓝底色）
- 边框 `0.6px solid #d9edf6`
- 圆角 `{rounded.md}` (8px)
- 内容居中
- 文字：页码数字，`12px` **Bold**，`#2ea0ce`，行高 `16px`

#### 省略号 (.pagination-number)

- 样式同数字按钮，文字为 `...`

#### 交互状态速查

| 按钮类型 | 尺寸 | 背景 | 边框 | 文字色 | 字重 |
|---------|------|------|------|--------|------|
| navigation | 42×30 | `#ffffff` | `0.6px #e6ecf2` | `#647487` | Regular |
| number | 30×30 | `#ffffff` | `0.6px #e6ecf2` | `#647487` | Regular |
| active | 30×30 | `#f4fbfe` | `0.6px #d9edf6` | `#2ea0ce` | **Bold** |
| ellipsis | 30×30 | `#ffffff` | `0.6px #e6ecf2` | `#647487` | Regular |

### 分段控制器 (seg)
- 用于时间粒度切换（按天 / 按周 / 按月）
- 按钮组样式，选中态品牌色底 + 白色文字
- 紧凑排列，间距 2px

### 语义标签 (chip/status)
- 小圆角胶囊标签
- 四种语义变体：成功（绿）、警告（橙）、危险（红）、信息（蓝）
- 字体 `{typography.micro}`，padding 2px 8px

### 提示工具 (info-tip)
- 标题旁的小问号图标
- hover 显示 tooltip 气泡
- 深色底 (#1f2937) + 白色文字
- tooltip 最大宽度 260px

## 交互状态

### 交互反馈原则

- **即时反馈**：用户操作后 **100ms 内**给出视觉响应（hover/active 态切换）
- **短暂等待**：操作耗时 **300ms–1s** 时显示内联 loading 指示器（按钮 spinner、行内骨架）
- **长时等待**：操作耗时 **>1s** 时显示骨架屏或进度指示器，避免空白等待
- **无歧义反馈**：每个操作有唯一对应的反馈形式，不产生模棱两可的状态
- **操作可撤销**：非 destructive 操作支持回退或撤销（如 Toast 通知带 "撤销" 按钮）

### 全状态覆盖矩阵

每个可交互组件必须覆盖以下全部状态：

| 状态 | 说明 | 设计表现 |
|------|------|---------|
| **Default** | 正常可交互态 | 标准样式，无额外标记 |
| **Hover** | 鼠标悬停（桌面端） | 颜色微调、边框加深、光标变为 pointer |
| **Focus** | 键盘聚焦 | 可见的聚焦环 (`0 0 0 3px rgba(46,160,206,0.18)`)，不依赖颜色单一传达 |
| **Active/Pressed** | 点击按下瞬间 | 轻微缩放 (`scale(0.98)`)、背景加深 |
| **Loading** | 操作进行中 | 按钮禁用 + spinner 图标旋转、骨架屏占位 |
| **Disabled** | 不可交互 | 降低不透明度至 0.4-0.5、cursor: not-allowed、无 hover 效果 |
| **Empty** | 无数据 | 插画 + 提示文字 + 引导操作按钮 |
| **Error** | 加载/操作失败 | 错误图标 + 原因说明 + 重试按钮 |
| **Success** | 操作成功 | 绿色对勾动画 + 简短成功文案（3s 自动消失） |

### 按钮交互

- **默认**: 品牌色底 (`{colors.brand-500}`) + 品牌主色文字(‘#2F87AC’ ｜ ‘bold’)
- **Hover**: 品牌色加深 (`{colors.brand-600}`)，过渡 `{easing.fast}` (0.12s)
- **Active**: 最深品牌色 (`{colors.brand-700}`) + `transform: scale(0.98)`
- **Loading**: 按钮文字替换为 spinner 图标，按钮保持禁用，防止重复提交
- **Disabled**: `opacity: 0.4; cursor: not-allowed`
- 次要按钮使用描边样式：透明底 + 品牌色描边 + 品牌色文字

### Tab
- **默认**: `{colors.ink-300}` 文字，无下划线
- **Hover**: 文字颜色加深至 `{colors.ink-500}`，过渡 0.12s
- **激活**: `{colors.ink-900}` 文字 + `{colors.brand-500}` 底部 2px 指示线

### 下拉菜单
- 参见上方「客户选择器 / 下拉组件」完整规范
- 所有下拉触发器、菜单、选项统一使用 customer-trigger-v2 / customer-menu / customer-option 体系
- 展开/收起过渡 `{easing.base}` (0.18s)，使用 `opacity + transformY(-4px → 0)` 微动效
- 点击菜单外部自动关闭，支持 ESC 键关闭

### 图表交互

- **Hover 提示**：鼠标悬停柱状图/折线图数据点时，显示 tooltip 浮层（具体数值 + 同比变化）
- **Tooltip 样式**：白色背景 `{colors.surface}`，阴影 `{shadows.float}`，圆角 `{rounded.md}`，内边距 `{spacing.3}`
- **键盘可达**：数据点支持 Tab 键聚焦，聚焦时同样显示 tooltip

### 加载状态

#### 骨架屏 (Skeleton)
- 用于页面首次加载、图表数据加载、表格数据加载
- 骨架块使用 `{colors.surface-3}` (#f1f5f9) 背景 + shimmer 动画（浅色从左到右扫过）
- 骨架形状与真实内容形状一致（矩形 → 矩形，圆形 → 圆形），宽度随机 60-90% 模拟真实数据
- 动画使用 `background-position-x` 变化，持续时间 1.5s，`ease-in-out` 循环

#### 局部 Loading
- 按钮 loading：替换文字为 16px spinner，按钮宽度保持不变防止抖动
- 图表 loading：图表区显示半透明骨架 + 居中 spinner
- 表格 loading：显示 5-8 行骨架行，模拟真实行高

### 空状态

- 页面/区块无数据时展示，包含三个元素：
  1. **插图**：简洁的灰色调插画（SVG），与品牌风格协调
  2. **提示文字**：使用 `{typography.body}`，颜色 `{colors.ink-500}`，说明当前无数据的原因
  3. **引导操作**：使用 `button-outline-primary` 按钮，引导用户创建/添加首条数据
- 空状态区域垂直居中，不挤压为狭窄的空白条

### 错误状态

- 数据加载失败时展示，包含：
  1. **错误图标**：简洁的感叹号/断线图标
  2. **错误原因**：使用 `{typography.meta}`，颜色 `{colors.danger-700}`，简明确说明失败原因
  3. **重试按钮**：使用 `button-secondary`，文字 "重新加载"
- 错误区域不占据过大面积，保持页面结构完整

### 过渡动效

- 快速过渡: `{easing.fast}` (0.12s) — 微交互（hover、focus、button press）
- 标准过渡: `{easing.base}` (0.18s) — 菜单展开、面板切换、tab 切换
- 进入动画方向：expand（从触发源展开）、fadeIn（淡入 0→1）、slideUp（从下方 8px 滑入）
- 退出动画方向：与进入相反，持续时间缩短为进入的 60-70%
- 动效遵循 `prefers-reduced-motion`，开启时禁用所有非必要动画
- 页面首次加载**不播放**入场动画（使用 `initial={false}` 跳过初始渲染动效）
- Transition 限定指定属性：`transition-property: opacity, transform`，禁止 `transition: all`

## 动效

- `--ease-out: cubic-bezier(0.2, 0.8, 0.2, 1)` — 标准缓出曲线
- `--t-fast: 0.12s var(--ease-out)` — 微交互（hover、focus）
- `--t-base: 0.18s var(--ease-out)` — 标准过渡（菜单、面板切换）
- 焦点环: `--ring-brand: 0 0 0 3px rgba(46, 160, 206, 0.18)`

## 响应式

### 断点定义

采用移动优先的三层断点体系：

| 断点 | 视口范围 | 设计策略 |
|------|---------|---------|
| **Desktop** | ≥1440px | 完整 1920px 基准布局，12 列网格，4 列 KPI 卡片 |
| **Narrow Desktop** | 1024px–1439px | 自动收缩，12 列保持，KPI 卡片缩至 3 列，图表双栏缩窄 |
| **Tablet** | 768px–1023px | 12 列缩为 8 列，KPI 卡片 2 列，图表单列堆叠，字号微降 |
| **Mobile** | <768px | 卡片/图表全单列堆叠，间距缩小，最小触控区域保持 44px |

### 自动布局响应式策略

#### CSS Grid auto-fill（优先策略）
- KPI 卡片网格使用 `grid-template-columns: repeat(auto-fill, minmax(280px, 1fr))`
  - ≥1440px：自动呈现 4 列
  - 1024px–1439px：自动收缩为 3 列（minmax 280px × 3 + gap ≥ 容器宽度 → 自动换行）
  - 768px–1023px：自动收缩为 2 列
  - <768px：自动退化为 1 列
- 无需为不同断点手动写列数，Grid 自动完成

#### Flexbox wrap（辅助策略）
- 工具栏按钮组：`flex-wrap: wrap; gap: {spacing.3}`，空间不足时自动换行
- 筛选区域：`flex-wrap: wrap`，筛选器在窄屏时垂直堆叠

#### 容器级约束
- 主容器：`width: 100%; max-width: 1920px; min-width: 1024px; margin: 0 auto`
- 1024px 以上无水平滚动条
- 768px–1023px：`min-width` 放宽为 `768px`，允许适度缩放

### 流体内边距

页面级水平内边距使用 `clamp()` 实现无级缩放：

- 1920px 基准：`padding-inline: 40px`
- 1440px：`padding-inline: 32px`
- 1024px：`padding-inline: 24px`
- 768px：`padding-inline: 16px`
- 公式：`clamp(16px, 2.08vw, 40px)`（16px—40px 之间平滑过渡）

### 组件响应式变化

| 组件 | Desktop (≥1440px) | Narrow (1024–1439px) | Tablet (768–1023px) | Mobile (<768px) |
|------|-------------------|---------------------|--------------------|-----------------|
| **KPI 卡片网格** | 4 列 (auto-fill) | 3 列 (auto-fill) | 2 列 (auto-fill) | 1 列 (auto-fill) |
| **图表 + 表格双栏** | 1fr 1fr 等分 | 1fr 1fr 等分 | 单列堆叠 | 单列堆叠 |
| **工具栏** | 单行水平排列 | flex-wrap 换行 | 垂直堆叠 | 垂直堆叠 |
| **表格** | 完整表格 | 完整表格 | 横向滚动 | 卡片化展示 |
| **页面标题** | 22px | 22px | 20px | 18px |
| **KPI 数值** | 28px | 28px | 24px | 22px |
| **图表高度** | 252px | 252px | 220px | 200px |

### 触控适配

- 所有可交互元素最小触控区域：**44×44px**（移动端/平板触控场景）
- 触控目标间距 ≥`{spacing.2}` (8px)，防止误触
- 下拉菜单选项高度 ≥44px（移动端）

### 已知缺口

- 流体排版 `clamp()` 仅应用于水平内边距，字号仍使用断点切换（可后续升级为流体字号）
- 表格在移动端转为卡片布局的具体实现待补充
- 未实现容器查询 (Container Queries)，当前仍使用视口媒体查询

## 已知缺口

- **数据交互**: 当前为静态 HTML，无后端数据绑定；筛选器联动（客户选择器 + 时间粒度切换）仅为 UI 展示，未实现数据过滤逻辑
- **图表下钻**: 图表 hover tooltip 已定义规范，但点击下钻、数据联动等高级交互未实现
- **暗色模式**: 当前仅支持浅色主题，需补充完整暗色模式色板和组件适配
- **打印样式**: 未定义 `@media print` 打印媒体查询
- **国际化**: 仅中文，未预留 i18n 文案管理和 RTL 布局机制
- **移动端表格**: 表格在移动端转为卡片布局的具体实现待补充
- **流体排版**: 字号目前仍使用断点切换，未使用 `clamp()` 实现真正流体字号
