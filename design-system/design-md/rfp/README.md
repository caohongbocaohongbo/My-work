# 协议通 (RFP) Design System

所有页面设计开始前，**必须先完整读取** `./rfp/DESIGN.md` 文件中的设计令牌和组件规范，再开始生成 Figma 设计。

## 设计文件

- **Figma 文件**: https://www.figma.com/design/aJ78mCVdrUk60foe3Xjfm4/rfp组件
- **签约管理页面参考**: node-id=1-122
- **组件库页面**: node-id=6-93
- **左侧导航参考**: node-id=1-677
- **右侧内容区参考**: node-id=1-247

## 核心设计原则

1. **单一主色** — `#1657DC` 是唯一的品牌色，用于主按钮、导航选中背景、表头底线、操作链接、分页激活态。不要使用其他蓝色定义。
2. **深色侧栏** — `#102348` 深蓝侧栏 240px 宽，提供页面结构层次。二级选中态用品牌色背景。
3. **统一圆角** — 按钮/输入框/标签 4px，KPI 卡片 20px，面包屑 pill 50px。
4. **实心主按钮** — 主操作按钮使用品牌色实心填充，非描边样式。
5. **不得出现 emoji** — 图标全部使用 SVG 图形。
6. **3 色评分徽章** — 绿色(≥4.5高评分) / 橙色(中等) / 蓝色(通用)，场景化使用。

## 设计令牌速查

| 类别 | 令牌 | 色值 | 用途 |
|------|------|------|------|
| 主色 | brand-500 | #1657DC | 主按钮、导航选中、表头底线、链接 |
| 主色 | brand-50 | #EAF1FF | 表头背景、蓝色徽章背景 |
| 侧栏 | sidebar-bg | #102348 | 左侧导航背景 (240px) |
| 侧栏 | sidebar-border | #334B7B | 侧栏分割线 |
| 侧栏 | sidebar-text-active | #FFFFFF | 导航文字 |
| 表面 | page | #F2F2F2 | 内容区域底色 |
| 表面 | surface | #FFFFFF | Header、卡片、表行 |
| 表面 | surface-soft | #F8F9FA | KPI 卡片背景、下拉选项 hover |
| 表面 | surface-table-header | #EAF1FF | 表头背景 |
| 表面 | surface-disabled | #F5F5F5 | 禁用态背景 |
| 文字 | ink | #313333 | 标题、正文、表格数据 |
| 文字 | ink-secondary | #666666 | 次要文字、地址 |
| 文字 | ink-muted | #9A9794 | 输入框标签、筛选器标签 |
| 文字 | ink-link | #1657DC | 操作链接、下拉选项选中 |
| 文字 | ink-warning | #F5841F | 警告文字/边框 |
| 文字 | ink-cyan | #006A6E | KPI 变化率 |
| 文字 | ink-placeholder | #CCD1D6 | 输入框占位文字 |
| 边框 | line | #DFE0E5 | Header 底线、卡片边框 |
| 边框 | line-input | #E2EAF6 | 默认输入框/筛选器边框 |
| 边框 | line-active | #AFC5F1 | 激活态边框 |
| 边框 | line-error | #F28989 | 错误态边框 |
| 边框 | line-dash | #CCD1D6 | 表格数据行虚线 |
| 评分 | rating-green-bg/text | #D1FAE5 / #6F9B8E | 绿色徽章 (高评分) |
| 评分 | rating-orange-bg/text | #FBEBDF / #AB896A | 橙色徽章 (中等评分) |
| 评分 | rating-blue-bg/text | #EAF1FF / #4C628A | 蓝色徽章 (通用) |
| 酒店 | star-gold | #F5B640 | 星级图标色 |
| 酒店 | price-text | #CC2A4D | 价格文字色 |
| KPI | kpi-label | #949999 | KPI 标签文字 |
| KPI | kpi-border | #E8EBEF | KPI 卡片边框 |
| 标签 | tag-paying-bg/text | #EAF1FF / #4080FF | 支付中标签 |
| 标签 | tag-failed-bg/text | #FFECE6 / #C66261 | 已失败标签 |
| 标签 | tag-paid-bg/text | #F4FAF6 / #6A9F62 | 已支付标签 |
| 标签 | tag-cancelled-bg/text | #F5F7FA / #647487 | 已取消标签 |
| 标签 | tag-warning-bg/text | #FFF3E6 / #E67E22 | 待支付/待确认标签 |
| 标签 | tag-info-bg/text | #F4FBFE / #2F87AC | 待填写标签 |
| 图表 | chart-bar | #4080FF | 柱状图柱体色 |
| 图表 | chart-card-bg | rgba(255,255,255,0.96) | 图表卡片背景 |
| 图表 | chart-card-border | #E2E8F0 | 图表卡片边框 |
| 图表 | chart-heading | #0F172A | 图表页面/卡片标题 |
| 图表 | chart-donut-1~8 | #2E67E8→#E7EEF9 | 环形图 8 段色板 (深→浅) |
| 图表 | chart-legend-text | #64748B | 图例标签文字 |
| 图表 | chart-toggle-bg | #F2F3F5 | 维度切换器背景 |
| 图表 | chart-toggle-active-text | #165DFF | 切换器激活文字 |
| 图表 | chart-card-shadow | 0px 18px 40px rgba(29,116,234,0.08) | 图表卡片标准阴影 |
| 图表 | chart-section-shadow | 0px 18px 20px rgba(29,116,234,0.08) | 报价涨跌趋势玫瑰图卡片阴影 |
| 图表 | chart-axis-label | #334155 | 图表坐标轴/引导线标签 |

## 关键组件规范索引

DESIGN.md 中已定义的组件（按组件库顺序）:

- **Sidebar** — 240px 深蓝侧栏 (#102348)，多级导航（一级 Medium/二级 Regular），品牌色选中背景
- **Header** — 64px 白色顶栏，含面包屑 pill (2px 品牌色边框, 50px 圆角) + 图标按钮
- **页面标题区** — 18px Semibold 标题 + 状态标签 + 信息描述 + 刷新按钮
- **KPI 指标卡片** — 标准变体 (20px 圆角, 30px 内边距) + 图标变体 (左侧 48×48px 圆形图标, 20px 左右内边距)，灰底 + #E8EBEF 边框, 34px Bold 数值
- **主按钮 (Outline Primary)** — 品牌描边按钮, 0.6px #E1EEF5 边框, #FBFCFE 背景, 15px/8px 内边距, 4px 圆角
- **次按钮 (Secondary)** — 中性描边按钮, 1px #D5DDE7 边框, 白色背景, 14px/8px 内边距, 8px 圆角
- **文字按钮 (Text)** — 透明无边框, 14px/6px 内边距, 8px 圆角
- **CTA 按钮 (Primary Filled)** — 品牌色实心填充, 仅 CTA 场景, 15px/11px 内边距, 8px 圆角
- **状态标签 (Status Tags)** — 6 种语义紧凑标签 (支付中/已失败/已支付/已取消/待支付/待填写), 4px 圆角无边框, Inter Bold 12px, 内边距 2px/4px, 支持单元格内叠加
- **Badge** — 推荐标签 (橙色/无边框) + 实时更新标签 (橙色, 特性标记)
- **Tab 导航** — 54px Tab 栏, 3 态 (default/hover/active), 2px #1657DC 激活指示线
- **操作链接 (Action Links)** — 3 态文字链接 (primary/danger/muted), Inter Bold 14px, hover 下划线
- **文本框 (Form Text)** — 32px 高, 内嵌标签 + placeholder, 4 态 (normal/active/error/disabled)
- **筛选器 / 下拉选择 (Form Select)** — 32px 高, 内嵌标签 + 值 + chevron, 带下拉面板 (选项 hover 选中态)
- **日期选择器 (Date Picker)** — 32px 高, 日历图标 + 开始/结束日期, 带展开日历面板
- **表格 (Table)** — 42px 蓝底表头 + 3px 品牌色底线 + 复选框列, 虚线行分隔, Poppins SemiBold 表头/Regular 数据
- **酒店卡片 (Hotel Card)** — 100×63px 图片, "⭑" 字符星级 (#F5B640), 品牌标签, 价格 (#CC2A4D)
- **评分徽章 (Rating Badge)** — 4px 圆角, 3 色变体 (绿/橙/蓝), Inter Bold 14px
- **面包屑 (Breadcrumb)** — Pill 样式, 2px 品牌色边框, 返回 SVG 箭头, Bold 14px
- **导航项 (Nav Items)** — 一级 Medium 16px / 二级 Regular 16px, 选中态 #1657DC 背景
- **图表集合 (EChart)** — 环形图/饼图/玫瑰图/折线图/蝶形对比柱状图, 24px 圆角卡片, 8 色 Donut 色板, 维度切换 Toggle
- **报价涨跌趋势玫瑰图 (Quote Change Rose)** — 三扇区玫瑰图变体（涨价/降价/持平），3 色扇区 (#2E67E8/#6697F1/#A8C3F2)，含引导线+百分比标签+底部图例，支持酒店/间夜量/金额维度切换
- **图表卡片 (Chart Card)** — 标准卡片 24px 圆角 + 阴影, 紧凑卡片 8px 圆角 + #D8E3F6 边框
- **图表维度切换 (Chart Toggle)** — 3 段 pill 切换器, 30px 高, #F2F3F5 底, 15px 圆角, 激活段白色背景 14px 圆角, 支持酒店/间夜量/金额等维度切换
- **分页器 (Pagination)** — 54px 底栏, 待组件化
- **地图/列表模式切换** — 并排按钮组

## Claude Code Agent 使用提示

1. **必须完整读取 DESIGN.md** — 只读 README 速查表不足以获取完整规范
2. **不要猜测色值** — 所有颜色来自 DESIGN.md tokens，不用近似色
3. **遵循组件 spec** — 边框粗细 (1px vs 2px vs 3px vs dashed)、颜色和圆角都有具体规定
4. **字体加载** — PingFang SC + Poppins；中文优先 PingFang SC；表格使用 Poppins
5. **不要创建 Component** — Figma 文件中若无 Component 定义，直接创建 Frame 即可
6. **设计在 Figma 中进行** — 不得直接生成 HTML 原型
7. **品牌色唯一** — 只用 #1657DC，不引入其他蓝色
8. **评分徽章按场景选色** — 高评分用绿色，中等用橙色，通用/信息用蓝色
9. **文本框 4 态全覆盖** — Normal/Active/Error/Disabled，边框色分别为 #E2EAF6/#AFC5F1/#F28989/#E2EAF6
10. **表格数据行** — 用 Poppins Regular (wght 400)，不是 SemiBold
11. **图表色板** — 环形图用 8 段蓝色系 (#2E67E8 → #E7EEF9 递减)，柱状图用 #4080FF
12. **图表卡片** — 标准用 24px 圆角 + rgba 阴影；紧凑用 8px 圆角 + #D8E3F6 边框
13. **图表标题字体** — Inter Extra Bold 32px (页面) / 22px (卡片) / Semi Bold 18px (紧凑)
14. **按钮统一字体** — 全部使用 Inter SemiBold 13px / 行高 18px，不再使用 PingFang SC + Medium 14px
15. **状态标签 6 种** — 支付中(蓝)/已失败(红)/已支付(绿)/已取消(灰)/待支付(橙)/待填写(青)，4px 圆角无边框紧凑型，内边距 2px/4px，可叠加使用
16. **Tab 激活色** — 指示线和激活文字统一使用品牌色 #1657DC
17. **操作链接** — primary 用 #2F87AC，danger 用 #C66261，muted 用 #647487
18. **报价涨跌趋势用玫瑰图** — 涨价/降价/持平三扇区，色板用 #2E67E8(持平)/#6697F1(涨价)/#A8C3F2(降价)，配合引导线+百分比标签+底部图例，卡片阴影用 chart-section-shadow
