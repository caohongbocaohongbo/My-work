---
version: v3
name: 协议通 (RFP)
description: 协议通 (RFP) 是阿里巴巴酒店招采系统的核心业务模块，用于酒店签约报价的全流程管理。页面采用左侧深色导航 + 右侧内容区的经典后台布局，内容区域以浅灰底色承载白色主操作区。品牌色为 #1657DC 蓝，辅以语义状态色和克制的数据色板。字体使用 PingFang SC + Poppins/Inter 双字体体系。设计语言延续企业级 B2B 后台的严谨专业调性，聚焦于数据表格、筛选操作、指标卡片和酒店信息展示。

colors:
  # --- 品牌色 ---
  brand-500: "#1657DC"
  brand-400: "#2E7AE5"
  brand-300: "#5592F4"
  brand-100: "#D9E8FD"
  brand-50: "#EAF1FF"
  # --- 页面底色 ---
  page: "#F2F2F2"
  # --- 表面 ---
  surface: "#FFFFFF"
  surface-soft: "#F8F9FA"
  surface-table-header: "#EAF1FF"
  surface-tag-warning: "#FBEBDF"
  surface-badge-success: "#D1FAE5"
  # --- 侧栏 ---
  sidebar-bg: "#102348"
  sidebar-border: "#334B7B"
  sidebar-text: "rgba(255,255,255,0.65)"
  sidebar-text-active: "#FFFFFF"
  sidebar-item-active: "#1657DC"
  # --- 描边 ---
  line: "#DFE0E5"
  line-input: "#E2EAF6"
  line-soft: "#CBD5E1"
  line-dash: "#949999"
  # --- 文字 ---
  ink: "#333333"
  ink-secondary: "#666666"
  ink-muted: "#9A9794"
  ink-link: "#1657DC"
  ink-warning: "#F5841F"
  ink-success: "#047857"
  ink-danger: "#CC2A4D"
  ink-cyan: "#006A6E"
  # --- 语义色 ---
  success-100: "#D1FAE5"
  success-700: "#047857"
  warning-100: "#FBEBDF"
  warning-600: "#CA8A04"
  warning-700: "#F5841F"
  danger-100: "#FBEBDF"
  danger-700: "#CC2A4D"

typography:
  page-title:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 18px
    fontWeight: 600
    lineHeight: 26px
    color: "{colors.ink}"
  section-title:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 16px
    fontWeight: 600
    lineHeight: 24px
    color: "{colors.ink}"
  body:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 14px
    fontWeight: 400
    lineHeight: 22px
    color: "{colors.ink}"
  body-secondary:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 14px
    fontWeight: 400
    lineHeight: 22px
    color: "{colors.ink-secondary}"
  meta:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 12px
    fontWeight: 400
    lineHeight: 20px
    color: "{colors.ink-secondary}"
  label:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 14px
    fontWeight: 400
    lineHeight: 22px
    color: "{colors.ink-muted}"
  table-header:
    fontFamily: "'Poppins', 'Noto Sans SC', sans-serif"
    fontSize: 14px
    fontWeight: 700
    lineHeight: 18px
    color: "{colors.ink}"
  nav-level1:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 16px
    fontWeight: 500
    lineHeight: 24px
    color: "{colors.sidebar-text}"
  nav-level1-active:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 16px
    fontWeight: 500
    lineHeight: 24px
    color: "{colors.sidebar-text-active}"
  nav-level2:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 16px
    fontWeight: 400
    lineHeight: 24px
    color: "{colors.sidebar-text-active}"
  nav-level2-active:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 16px
    fontWeight: 500
    lineHeight: 24px
    color: "{colors.sidebar-text-active}"
  kpi-value:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 34px
    fontWeight: 600
    lineHeight: 22px
    color: "{colors.ink}"
  kpi-label:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 14px
    fontWeight: 400
    lineHeight: 22px
    color: "{colors.ink-muted}"
  breadcrumb:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 14px
    fontWeight: 600
    lineHeight: 26px
  btn-primary:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 14px
    fontWeight: 500
    lineHeight: 22px
    color: "#FFFFFF"

rounded:
  none: 0px
  sm: 4px
  md: 8px
  lg: 20px
  full: 50px

controlHeight:
  sm: 28px
  md: 32px
  lg: 36px
  xl: 40px
  header: 64px

spacing:
  "1": 4px
  "2": 8px
  "3": 12px
  "4": 16px
  "5": 20px
  "6": 24px
  "8": 30px
  "10": 40px

sidebar:
  width: 240px
  item-height: 40px
  icon-size: 24px
  logo-height: 28px
  collapse-btn-height: 50px

easing:
  out: "cubic-bezier(0.2, 0.8, 0.2, 1)"
  fast: "0.12s cubic-bezier(0.2, 0.8, 0.2, 1)"
  base: "0.18s cubic-bezier(0.2, 0.8, 0.2, 1)"
---

## 概述

协议通 (RFP) 是阿里巴巴酒店招采系统的核心业务模块，用于酒店签约、报价的全流程管理。页面采用经典的**左侧深色导航 + 右侧内容区**后台布局，内容区域浅灰底色 (`{colors.page}` #F2F2F2) 承载白色主操作区卡片。

**核心特征：**
- 品牌色 `{colors.brand-500}` (#1657DC) 承担主导航选中态、主按钮、链接、表头底线
- 深色侧栏 (`{colors.sidebar-bg}` #102348) 提供结构层次
- PingFang SC + Poppins 双字体体系，中文优先
- 4px 基准圆角，按钮/标签/输入框统一 `{rounded.sm}` (4px)
- KPI 卡片柔和大圆角 (`{rounded.lg}` 20px)，灰底 (`{colors.surface-soft}` #F8F9FA)
- 表格表头蓝色底 (`{colors.surface-table-header}` #EAF1FF) + 3px 品牌色底线
- 主按钮实心填充品牌色，非描边样式

## 颜色

### 品牌色
- **Brand 500** (`{colors.brand-500}` — #1657DC): **主品牌色**，导航选中背景、主按钮、链接、表头底线
- **Brand 400** (`{colors.brand-400}` — #2E7AE5): hover 加深
- **Brand 300** (`{colors.brand-300}` — #5592F4): 浅品牌色
- **Brand 100** (`{colors.brand-100}` — #D9E8FD): 品牌浅底
- **Brand 50** (`{colors.brand-50}` — #EAF1FF): 品牌最浅底，表头背景

### 页面底色
- **Page** (`{colors.page}` — #F2F2F2): 全局内容区底色，浅灰

### 表面
- **Surface** (`{colors.surface}` — #FFFFFF): 主操作卡片、Header、表行背景
- **Surface Soft** (`{colors.surface-soft}` — #F8F9FA): KPI 指标卡片背景
- **Surface Table Header** (`{colors.surface-table-header}` — #EAF1FF): 表格表头背景
- **Surface Tag Warning** (`{colors.surface-tag-warning}` — #FBEBDF): 警告类标签背景
- **Surface Badge Success** (`{colors.surface-badge-success}` — #D1FAE5): 成功类徽章背景

### 侧栏
- **Sidebar BG** (`{colors.sidebar-bg}` — #102348): 侧栏深色背景
- **Sidebar Border** (`{colors.sidebar-border}` — #334B7B): 侧栏分割线
- **Sidebar Text** (`{colors.sidebar-text}` — rgba(255,255,255,0.65)): 导航未激活文字
- **Sidebar Text Active** (`{colors.sidebar-text-active}` — #FFFFFF): 导航激活文字
- **Sidebar Item Active** (`{colors.sidebar-item-active}` — #1657DC): 二级导航选中背景

### 描边
- **Line** (`{colors.line}` — #DFE0E5): Header 底部分割线、内容卡片边框
- **Line Input** (`{colors.line-input}` — #E2EAF6): 筛选器/下拉框边框
- **Line Soft** (`{colors.line-soft}` — #CBD5E1): 日期 placeholder 文字色
- **Line Dash** (`{colors.line-dash}` — #949999): 表格虚线分隔

### 文字
- **Ink** (`{colors.ink}` — #333333): 主文字，标题、正文、表格数据
- **Ink Secondary** (`{colors.ink-secondary}` — #666666): 次要文字，描述、辅助信息
- **Ink Muted** (`{colors.ink-muted}` — #9A9794): 标签文字，输入框标签、KPI 标签
- **Ink Link** (`{colors.ink-link}` — #1657DC): 链接文字，操作链接
- **Ink Warning** (`{colors.ink-warning}` — #F5841F): 警告类文字
- **Ink Success** (`{colors.ink-success}` — #047857): 成功类文字
- **Ink Danger** (`{colors.ink-danger}` — #CC2A4D): 危险类文字
- **Ink Cyan** (`{colors.ink-cyan}` — #006A6E): 增长率/变化率文字

### 语义色
- **Success** (背景 `{colors.success-100}` #D1FAE5, 文字 `{colors.success-700}` #047857): 正向指标 / OTA 评分徽章
- **Warning** (背景 `{colors.warning-100}` #FBEBDF, 文字 `{colors.danger-700}` #CC2A4D): 警示标签 / 未报价状态
- **Info** (背景 `{colors.brand-50}` #EAF1FF, 文字 `{colors.brand-500}` #1657DC): 信息提示

## 字体

### 字体家族
- **中文**: `'PingFang SC', 'Microsoft YaHei', sans-serif`
- **拉丁/数字**: `'Poppins', 'Inter', 'Noto Sans SC', sans-serif`

### 字号层级

| Token | 字号 | 字重 | 用途 |
|--------|------|------|------|
| `{typography.page-title}` | 18px | 600 (Semibold) | 页面主标题 |
| `{typography.section-title}` | 16px | 600 (Semibold) | 区块标题 |
| `{typography.body}` | 14px | 400 (Regular) | 正文、表格数据 |
| `{typography.body-secondary}` | 14px | 400 (Regular) | 次要正文 |
| `{typography.meta}` | 12px | 400 (Regular) | 辅助文字、地址 |
| `{typography.label}` | 14px | 400 (Regular) | 输入框标签、筛选器标签 |
| `{typography.table-header}` | 14px | 700 (Bold) | 表格表头 (Poppins) |
| `{typography.nav-level1}` | 16px | 500 (Medium) | 一级导航 |
| `{typography.nav-level2}` | 16px | 400 (Regular) | 二级导航 |
| `{typography.kpi-value}` | 34px | 600 (Semibold) | KPI 大数值 |
| `{typography.kpi-label}` | 14px | 400 (Regular) | KPI 标签 |
| `{typography.breadcrumb}` | 14px | 600 (Semibold) | 面包屑导航 |
| `{typography.btn-primary}` | 14px | 500 (Medium) | 主按钮文字 |

### 字体原则
- 中文优先使用 PingFang SC，Windows 回退 Microsoft YaHei
- 表格表头使用 Poppins Bold，数字和拉丁字符优先
- KPI 大数字使用 PingFang SC Semibold
- 行高统一 22px (14px 字号) / 26px (18px 字号) / 24px (16px 字号)

## 布局

### 页面结构
```
<div class="app-layout">
  <!-- 左侧导航 -->
  <aside class="sidebar" style="width: 240px">
    <div class="sidebar-logo"><!-- Logo 28px --></div>
    <nav class="sidebar-nav">
      <!-- 一级菜单项 40px -->
      <!-- 二级菜单项 40px -->
    </nav>
    <div class="sidebar-collapse"><!-- 收起按钮 50px --></div>
  </aside>

  <!-- 右侧内容区 -->
  <div class="content-area" style="background: #F2F2F2">
    <!-- Header 64px -->
    <header class="header">
      <!-- 面包屑 pill -->
      <!-- 右侧图标组 -->
    </header>

    <!-- 主内容区 -->
    <main class="main-content" style="padding: 20px">
      <div class="content-card" style="background: #fff; border: 1px solid #DFE0E5">
        <!-- 页面标题区 -->
        <!-- KPI 指标卡片区 -->
        <!-- 操作按钮栏 -->
        <!-- 筛选器区域 -->
        <!-- 数据表格 -->
        <!-- 分页器 -->
      </div>
    </main>
  </div>
</div>
```

- 侧栏固定 240px 宽度
- Header 固定 64px 高度
- 内容区 padding 20px
- 主操作卡片白色背景 + 1px #DFE0E5 边框

### 间距系统

| Token | 值 | 典型用途 |
|--------|-----|----------|
| `{spacing.1}` | 4px | 标签内边距、图标间距 |
| `{spacing.2}` | 8px | 元素紧凑间距、按钮内边距 |
| `{spacing.3}` | 12px | 标准内边距 |
| `{spacing.4}` | 16px | 卡片间隙、KPI 卡片间距 |
| `{spacing.5}` | 20px | 内容区内边距 |
| `{spacing.6}` | 24px | 图标组间距 |
| `{spacing.8}` | 30px | KPI 卡片内边距 |
| `{spacing.10}` | 40px | 主内容区左右内边距 |

### 圆角
| Token | 值 | 用途 |
|--------|-----|------|
| `{rounded.none}` | 0px | 侧栏项 |
| `{rounded.sm}` | 4px | 按钮、输入框、标签、筛选器、表头 |
| `{rounded.md}` | 8px | 标准卡片 |
| `{rounded.lg}` | 20px | KPI 指标卡片 |
| `{rounded.full}` | 50px | 面包屑 pill |

### 控件高度
| Token | 值 | 用途 |
|--------|-----|------|
| `{controlHeight.sm}` | 28px | 小标签/徽章 |
| `{controlHeight.md}` | 32px | 标准筛选器 |
| `{controlHeight.lg}` | 36px | 主按钮 |
| `{controlHeight.xl}` | 40px | 导航菜单项 |
| `{controlHeight.header}` | 64px | 顶部 Header |

## 组件

### 侧栏导航 (Sidebar)

左侧深色垂直导航，240px 固定宽度。

**容器 (.sidebar)**：
- 背景 `{colors.sidebar-bg}` (#102348)
- 宽度 240px
- Flex column 布局，justify-content: space-between
- 顶部 padding 18px

**Logo 区 (.sidebar-logo)**：
- 高度 28px，宽度自适应
- 底部 border-bottom: 1px solid `{colors.sidebar-border}`
- padding-bottom: 18px

**导航菜单 (.sidebar-nav)**：
- Flex column 布局，gap 16px
- 一级菜单项高度 40px，宽度 208px
- 左侧图标 24×24px，距左 12px
- 文字距左 44px，PingFang SC Medium 16px
- 未激活：文字色 rgba(255,255,255,0.65)
- 激活（展开）：文字色 #FFFFFF
- 二级菜单项缩进对齐，Regular 字重
- 二级选中态：背景 `{colors.sidebar-item-active}` (#1657DC)，4px 圆角，白色 Medium 文字
- 菜单项间距：一级间 16px，二级间 8px

**收起按钮 (.sidebar-collapse)**：
- 高度 50px，全宽
- 顶部 border-top: 1px solid `{colors.sidebar-border}`
- padding: 12px 0 16px 32px
- 图标 16×16px + 文字 "收起" 14px

### Header 导航

顶部白色横栏，64px 高度。

**容器 (.header)**：
- 背景 `{colors.surface}` (#FFFFFF)
- 高度 64px
- 底部 border-bottom: 1px solid `{colors.line}` (#DFE0E5)
- Flex row，justify-content: space-between，align-items: center
- 左右 padding 16px

**面包屑 Pill (.breadcrumb-pill)**：
- 圆角 `{rounded.full}` (50px)
- 边框 2px solid `{colors.brand-500}` (#1657DC)
- 内边距：2px 15px 2px 4px
- 内容：返回箭头 (20×20px) + 文字
- 文字：PingFang SC Semibold 14px
- 当前页品牌色文字 + " / " 分隔 + 上级页默认色文字

**右侧图标组 (.header-icons)**：
- Flex row，gap 24px
- 图标 32×32px
- "我的" 图标激活态：品牌色背景 `{colors.brand-500}` + 白色图标

### 页面标题区

**标题行**：
- Flex row，gap 8px，align-items: center
- 标题文字：`{typography.page-title}` — PingFang SC Semibold 18px
- 状态标签紧随其后

**状态标签 (.status-tag)**：
- 高度 20px，内边距 4px
- 圆角 `{rounded.sm}` (4px)
- 边框 1px solid
- 签约中：边框 `{colors.ink-warning}` (#F5841F)，文字 `{colors.ink-warning}`
- 酒店签约：边框 `{colors.ink-secondary}` (#666666)，文字 `{colors.ink-secondary}`
- 文字：PingFang SC Regular 14px，行高 26px

**信息描述行**：
- 高度 20px，内边距 4px
- 文字色 `{colors.ink-secondary}` (#666666) + 品牌色链接

**刷新按钮**：
- 边框 1px solid `{colors.line-input}` (#E2EAF6)
- 圆角 `{rounded.sm}` (4px)
- 内边距 10px，gap 5px
- 图标 16×16px + 文字 "刷新"
- 文字：PingFang SC Regular 14px

### KPI 指标卡片

**Grid 容器**：
- Flex row 布局，gap 16px
- 每个卡片 flex: 1 平分空间

**Card (.kpi-card)**：
- 背景 `{colors.surface-soft}` (#F8F9FA)
- 圆角 `{rounded.lg}` (20px)
- 内边距 `{spacing.8}` (30px)
- Flex column 布局，gap 8px

**内部结构**：

| 元素 | 样式 |
|------|------|
| **标题行** | Flex row, gap 10px, align-items: center |
| **Label** | `{typography.kpi-label}` — PingFang SC Regular 14px, #9A9794 |
| **提示图标** | 16×16px，可选 |
| **数值行** | Flex row, gap 10px, align-items: end, padding-top 3px |
| **主数值** | `{typography.kpi-value}` — PingFang SC Semibold 34px, #333333 |
| **变化率** | PingFang SC Regular 14px, `{colors.ink-cyan}` (#006A6E) |
| **变化图标** | 16×16px |

### 主按钮 (Primary Button)

实心填充品牌色按钮，用于主要操作。

| 状态 | 背景 | 文字色 |
|------|------|--------|
| **Default** | `{colors.brand-500}` (#1657DC) | #FFFFFF |
| **Hover** | `{colors.brand-400}` (#2E7AE5) | #FFFFFF |
| **Active** | `{colors.brand-500}` (#1657DC) 加深 | #FFFFFF |
| **Disabled** | `{colors.brand-100}` (#D9E8FD) | rgba 变淡 |

- 内边距：8px (左右) + 7px (上下)
- 圆角 `{rounded.sm}` (4px)
- 文字：`{typography.btn-primary}` — PingFang SC Medium 14px, 行高 22px, 居中
- 可选带下拉箭头图标 (16×16px) 的变体
- Transition: `{easing.fast}`

### 筛选器 / 下拉选择 (Form Select)

**Trigger 容器**：
- Flex row 布局，justify-content: space-between
- 边框 1px solid `{colors.line-input}` (#E2EAF6)
- 圆角 `{rounded.sm}` (4px)
- 内边距 5px 10px
- flex: 1，最小宽度 0
- 高度 `{controlHeight.md}` (32px)

**Label (左侧)**：
- `{typography.label}` — PingFang SC Regular 14px, `{colors.ink-muted}` (#9A9794)
- flex-shrink: 0

**Value (中间)**：
- `{typography.body}` — PingFang SC Regular 14px, `{colors.ink}` (#333333)
- flex: 1，左对齐
- Placeholder 态：`{colors.ink-secondary}` (#666666)

**Chevron (右侧)**：
- 12×12px 下拉箭头图标
- 向下展开

**Hover 态**: 边框色不变 (无 hover 效果)
**展开态**: 边框色可加深

### 日期范围选择器

**容器**：
- 边框 1px solid `{colors.line-input}` (#E2EAF6)
- 圆角 `{rounded.sm}` (4px)
- 内边距 5px 10px
- Flex row，gap 8px

**内部结构**：
- 日历图标 16×16px
- "开始日期" placeholder (色 `{colors.line-soft}` #CBD5E1)
- " - " 分隔符
- "结束日期" placeholder
- 下拉箭头 12×12px

### 表格 (Table)

**表头行 (thead)**：
- 背景 `{colors.surface-table-header}` (#EAF1FF)
- 底部 3px solid `{colors.brand-500}` (#1657DC)
- 高度由内容撑开（约 42px）
- 内边距 12px 10px
- 字体 `{typography.table-header}` — Poppins Bold 14px (wght 700)
- 文字色 `{colors.ink}` (#333333)
- 行高 18px
- 复选框列：padding 13px 5px，16×16px 复选框

**数据行 (tbody)**：
- 白色背景
- 行间 border: 1px dashed `{colors.line-dash}` (#949999)
- 内边距 9px 10px（上下）/ 12px 5px（复选框列）
- 高度由内容自适应

**复选框列**：宽度 26px，居中对齐

**酒店信息列**：宽度约 467px，含酒店卡片组件

**状态列 / 集团列 / 评分列 / 城市列 / POI列 / 原因列 / 操作列**：flex: 1 平分

**操作列**：
- 文字色 `{colors.ink-link}` (#1657DC)
- Poppins Regular 14px
- 两行排列："报价详情" + "快速邀约"

### 酒店卡片

表格内嵌的酒店信息展示组件。

**卡片结构**：
- Flex row，gap 16px
- 酒店图片：100×63px，圆角 4px，底部渐变遮罩标签
- 信息区：Flex column

**信息区内容**：
| 元素 | 样式 |
|------|------|
| **酒店名称** | PingFang SC Medium 14px, #333333 |
| **品牌标签组** | 图片标签 45×19px / 45×18px，gap 8px |
| **星级** | 五星图标组，12×12px 每颗 |
| **地址** | PingFang SC Regular 12px, #666666，行高 20px |
| **价格** | PingFang SC Semibold 14px, #333333，"¥ 600.00" 格式 |

### 状态标签 (Status Tag)

胶囊形状态标签，用于表格中展示报价/签约状态。

**未报价 (Warning 变体)**：
- 背景 `{colors.surface-tag-warning}` (#FBEBDF)
- 文字 `{colors.ink-danger}` (#CC2A4D)
- 内边距 0 8px，圆角 4px
- Inter Regular 14px，行高 24px

### 评分徽章 (Rating Badge)

**OTA 评分**：
- 背景 `{colors.surface-badge-success}` (#D1FAE5)
- 文字 `{colors.ink-success}` (#047857)
- 内边距 2.167px，圆角 2.167px
- Inter Bold 14px
- 紧凑型展示，如 "4.7"

### 分页器 (Pagination)

位于表格底部，54px 高度。当前采用图片形式展示，后续可抽象为标准分页组件。

**参考规范（待组件化）**：
- 居右对齐
- 包含页码按钮、导航箭头、省略号
- 激活态：品牌色背景

### 面包屑导航 (Breadcrumb)

- 位于 Header 左侧
- Pill 样式：50px 圆角，2px 品牌色边框
- 返回箭头 (20×20px) + 页面路径文字
- 文字 Semibold 14px，当前页品牌色

### 地图/列表模式切换

- 两个并排按钮，各 108×32px
- 圆角 4px
- 图标 (16×16px) + 文字 (14px)
- gap 8px

## 交互状态

### 按钮
- **默认**: `{colors.brand-500}` 实心背景 + 白色文字
- **Hover**: 背景加深至 `{colors.brand-400}`
- **Active**: 背景继续加深

### 导航
- **一级菜单默认**: 白色半透明文字 rgba(255,255,255,0.65)
- **一级菜单展开**: 白色文字 + 箭头旋转 180°
- **二级菜单默认**: 白色 Regular 文字
- **二级菜单选中**: `{colors.sidebar-item-active}` 背景 + 白色 Medium 文字

### 筛选器
- **默认**: `{colors.line-input}` 边框 + `{colors.ink-muted}` Label
- **展开**: 边框不变（简洁策略）
- **选项 Hover**: 浅蓝底

### 表格
- **表头**: `{colors.surface-table-header}` 蓝底 + 3px 品牌色底线
- **数据行**: 白色背景 + 虚线分隔
- **操作链接**: 品牌色文字

### 过渡动效
- 快速过渡: `{easing.fast}` (0.12s)
- 标准过渡: `{easing.base}` (0.18s)

## 已知缺口

- **图表组件**: 当前页面以表格为主，暂无图表组件定义
- **分页组件**: 当前为图片形式，需抽象为标准组件
- **图标库**: Icon/面形 和 Icon/线形 图标集需统一整理
- **加载状态**: 无骨架屏或加载指示器
- **空状态**: 无数据时的空状态提示未覆盖
- **暗色模式**: 仅支持浅色主题
- **响应式**: 当前为桌面端固定布局 (1920px 基准)
- **酒店图片**: 图片资源为占位图，需统一规范
- **品牌标签**: 酒店品牌徽章为图片形式，需 SVG 化
