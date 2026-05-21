# 协议通 (RFP) Design System

所有页面设计开始前，**必须先完整读取** `./rfp/DESIGN.md` 文件中的设计令牌和组件规范，再开始生成 Figma 设计。

## 设计文件

- **Figma 文件**: https://www.figma.com/design/aJ78mCVdrUk60foe3Xjfm4/rfp组件
- **签约管理页面参考**: node-id=1-122
- **左侧导航参考**: node-id=1-677
- **右侧内容区参考**: node-id=1-247

## 核心设计原则

1. **单一主色** — `#1657DC` 是唯一的品牌色，用于主按钮、导航选中背景、表头底线、操作链接、分页激活态。不要使用其他蓝色定义。
2. **深色侧栏** — `#102348` 深蓝侧栏 240px 宽，提供页面结构层次。二级选中态用品牌色背景。
3. **统一圆角** — 按钮/输入框/标签 4px，KPI 卡片 20px，面包屑 pill 50px。
4. **实心主按钮** — 主操作按钮使用品牌色实心填充，非描边样式。
5. **不得出现 emoji** — 图标全部使用 SVG 图形。

## 设计令牌速查

| 类别 | 令牌 | 色值 | 用途 |
|------|------|------|------|
| 主色 | brand-500 | #1657DC | 主按钮、导航选中、表头底线、链接 |
| 主色 | brand-50 | #EAF1FF | 表头背景 |
| 侧栏 | sidebar-bg | #102348 | 左侧导航背景 (240px 宽) |
| 侧栏 | sidebar-border | #334B7B | 侧栏分割线 |
| 侧栏 | sidebar-text | rgba(255,255,255,0.65) | 导航未激活文字 |
| 表面 | page | #F2F2F2 | 内容区域底色 |
| 表面 | surface | #FFFFFF | Header、主操作卡片、表行 |
| 表面 | surface-soft | #F8F9FA | KPI 指标卡片背景 |
| 表面 | surface-table-header | #EAF1FF | 表头背景 |
| 文字 | ink | #333333 | 标题、正文、表格数据 |
| 文字 | ink-secondary | #666666 | 次要文字、描述 |
| 文字 | ink-muted | #9A9794 | 输入框标签、KPI 标签 |
| 文字 | ink-link | #1657DC | 操作链接 |
| 文字 | ink-warning | #F5841F | 警告文字 |
| 文字 | ink-success | #047857 | 成功文字 |
| 文字 | ink-danger | #CC2A4D | 危险/未报价文字 |
| 文字 | ink-cyan | #006A6E | 增长率文字 |
| 边框 | line | #DFE0E5 | Header 底线、卡片边框 |
| 边框 | line-input | #E2EAF6 | 筛选器/下拉框边框 |
| 语义 | success-100 | #D1FAE5 | 评分徽章背景 |
| 语义 | success-700 | #047857 | 评分徽章文字 |
| 语义 | warning-100 | #FBEBDF | 未报价标签背景 |
| 语义 | danger-700 | #CC2A4D | 未报价标签文字 |

## 关键组件规范索引

DESIGN.md 中已定义的组件（按文档顺序）:

- **Sidebar** — 240px 深蓝侧栏 (#102348)，多级导航，品牌色选中背景
- **Header** — 64px 白色顶栏，含面包屑 pill (50px 圆角) + 图标按钮
- **页面标题区** — 18px Semibold 标题 + 状态标签 + 信息描述 + 刷新按钮
- **KPI 指标卡片** — 20px 圆角，灰底 (#F8F9FA)，30px 内边距，34px 大数值
- **主按钮 (Primary Button)** — 品牌色实心填充，4px 圆角，14px Medium 白色文字
- **筛选器 / 下拉选择** — 内嵌标签 + 值 + 箭头，1px #E2EAF6 边框，4px 圆角
- **日期范围选择器** — 日历图标 + 开始/结束日期 + 分隔符
- **表格 (Table)** — 蓝底表头 (#EAF1FF) + 3px 品牌色底线，虚线行分隔
- **酒店卡片** — 100×63px 图片 + 星级 + 品牌标签 + 地址 + 价格
- **状态标签 (Status Tag)** — 4px 圆角，语义色背景 (警告橙/成功绿)
- **评分徽章 (Rating Badge)** — 绿色背景 + Bold 数字
- **分页器 (Pagination)** — 54px 底栏，待组件化
- **面包屑导航 (Breadcrumb)** — Pill 样式，2px 品牌色边框，50px 圆角
- **地图/列表模式切换** — 并排按钮组

## Claude Code Agent 使用提示

1. **必须完整读取 DESIGN.md** — 只读 README 速查表不足以获取完整规范
2. **不要猜测色值** — 所有颜色来自 DESIGN.md tokens，不用近似色
3. **遵循组件 spec** — 边框粗细 (1px vs 2px vs 3px) 和颜色都有具体规定
4. **字体加载** — PingFang SC + Poppins；中文优先 PingFang SC
5. **不要创建 Component** — Figma 文件中若无 Component 定义，直接创建 Frame 即可
6. **设计在 Figma 中进行** — 不得直接生成 HTML 原型
7. **品牌色唯一** — 只用 #1657DC，不引入其他蓝色
8. **侧栏色值固定** — 背景 #102348，分割线 #334B7B，不随意调整
