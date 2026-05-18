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
- **Brand 500** (`{colors.brand-500}` — #2F87AC): **主品牌色**，按钮、激活态、图表主色
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

### 页面结构
```
<body class="bg-[#f4f7fb]">
  <div class="min-h-screen">
    <main>
      <!-- 页面面板 (page-panel) -->
      <section class="page-panel active" id="...">
        <div class="page-canvas-v2">
          <!-- Tab 导航 (tabs-v2) -->
          <!-- 工具栏 (toolbar-v2) -->
          <!-- 指标卡片区 -->
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
- `<main>` 区域带内边距 `px-4 py-5 md:px-6 md:py-6`
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
| `{rounded.sm}` | 6px | Chip / 小控件 / 标签 |
| `{rounded.md}` | 8px | 按钮 / 输入框 / 卡片 |
| `{rounded.lg}` | 12px | 容器卡 / 大面板 |

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
| `{controlHeight.sm}` | 28px | 小按钮 / 紧凑控件 |
| `{controlHeight.md}` | 32px | 标准按钮 / 输入框 |
| `{controlHeight.lg}` | 36px | 大按钮 / 搜索框 |

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
- 颜色 `{colors.brand-500}` (#2F87AC)
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

### 按钮
- **默认**: 品牌色底 (`{colors.brand-500}`) + 白色文字
- **Hover**: 品牌色加深 (`{colors.brand-600}`)
- **Active**: 最深品牌色 (`{colors.brand-700}`)
- 次要按钮使用描边样式：透明底 + 品牌色描边 + 品牌色文字

### Tab
- **默认**: `{colors.ink-300}` 文字，无下划线
- **Hover**: 文字颜色加深
- **激活**: `{colors.ink-900}` 文字 + `{colors.brand-500}` 底部指示线

### 下拉菜单
- 参见上方「客户选择器 / 下拉组件」完整规范
- 所有下拉触发器、菜单、选项统一使用 customer-trigger-v2 / customer-menu / customer-option 体系

### 图表
- 静态 SVG/CSS 渲染，无交互
- 柱状图和折线图叠加在同一画布

### 过渡动效
- 快速过渡: `{easing.fast}` (0.12s)
- 标准过渡: `{easing.base}` (0.18s)
- 缓出曲线: `{easing.out}`

## 动效

- `--ease-out: cubic-bezier(0.2, 0.8, 0.2, 1)` — 标准缓出曲线
- `--t-fast: 0.12s var(--ease-out)` — 微交互（hover、focus）
- `--t-base: 0.18s var(--ease-out)` — 标准过渡（菜单、面板切换）
- 焦点环: `--ring-brand: 0 0 0 3px rgba(46, 160, 206, 0.18)`

## 响应式

| 断点 | 变化 |
|------|------|
| Desktop (≥1280px) | 完整布局，图表 16 列柱状图 |
| Tablet (768–1279px) | 图表区域收缩，坐标轴间隙减小，字号微调 |
| Mobile (<768px) | 图表高度降低，柱状图间距减小 |

- 主容器 `main` 使用 `px-4 py-5 md:px-6 md:py-6` 响应式内边距
- 图表柱状图在 ≤1280px 时右轴收窄
- 图表在 ≤1024px 时高度微调至 248px
- 卡片网格在移动端变为单列

## 已知缺口

- **数据交互**: 当前为静态 HTML，无后端数据绑定
- **图表可交互性**: 图表为静态渲染，缺少 hover tooltip、点击下钻等交互
- **加载状态**: 无骨架屏或加载指示器
- **空状态**: 无数据时的空状态提示未覆盖
- **暗色模式**: 当前仅支持浅色主题
- **打印样式**: 未定义打印媒体查询
- **国际化**: 仅中文，未预留 i18n 机制
- **筛选器联动**: 客户选择器和时间粒度切换仅做 UI 展示，未实现数据过滤联动
