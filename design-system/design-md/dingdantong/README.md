# 订单通 (DingdanTong) Design System

所有页面设计开始前，**必须先完整读取** `./dingdantong/DESIGN.md` 文件中的设计令牌和组件规范，再开始生成 Figma 设计。本 README 仅为速查索引。

## 设计文件

- **Figma UI Kit（组件权威来源）**: https://www.figma.com/design/EvOEzvO2sCtM8JavVCJSZP/FCG-Design-System---UI-Kit--%E8%AE%A2%E5%8D%95%E9%80%9A---v1?node-id=0-3
- **Foundations（设计令牌）**: node-id=0-3
- 组件页：❖ Button / ❖ Button Group / ❖ Link / ❖ Checkbox / ❖ Datetime Picker / ❖ Switch / ❖ Form / ❖ Input / ❖ Input Number / ❖ Radio / ❖ Select / ❖ Table / ❖ Tag / ❖ Statistic / ❖ Tabs / ❖ Dialog / ❖ Tooltip

## 核心设计原则

1. **单一主色** — `#2f87ac` 是唯一品牌蓝，用于主按钮、Tab 激活线、操作链接、选中态。不要使用其他蓝色定义。
2. **语义四色** — 成功 `#6a9f62` / 警告 `#be964b` / 错误 `#c66261` / 信息 `#97a6b8`，每色含 9 档明度梯度。
3. **8px 基础圆角** — 组件基础圆角 8px，小控件 2px，胶囊 20px，圆形 999px。
4. **三档组件尺寸** — 通用控件高度 24px / 32px / 40px。
5. **克制阴影** — 4 级阴影，仅浮层/弹窗/下拉使用，页面卡片默认扁平。
6. **不得出现 emoji** — 图标全部使用 SVG 图形。

## 设计令牌速查

### 品牌色

| 令牌 | 色值 | 用途 |
|------|------|------|
| primary | #2f87ac | 主按钮、激活态、链接 |
| primary-dark-2 | #215e78 | hover / 按下加深 |
| primary-light-8 | #e1eef5 | 输入框默认边框 |
| primary-light-9 | #f4f9fb | 激活浅底 |

### 语义色 base

| 语义 | 色值 |
|------|------|
| success | #6a9f62 |
| warning | #be964b |
| error | #c66261 |
| info | #97a6b8 |

### 文字 / 背景 / 边框

| 令牌 | 色值 | 用途 |
|------|------|------|
| text-primary | #313333 | 主文字 |
| text-secondary | #949999 | 次要文字 |
| text-placeholder | #a1aaaa | 占位文本 |
| text-disabled | #c0cccc | 禁用文字 |
| bg | #fbfcfe | 组件/弹层背景 |
| bg-page | #f7f8fa | 页面底色 |
| border | #f0f4f7 | 默认边框 |
| border-darker | #c5ceda | 强调边框 |
| fill | #e7f5fb | 选中浅底 |
| fill-dark | #f4f9fb | 浅底 |

### 字体 / 圆角 / 阴影 / 尺寸

- **字体栈**: Inter, PingFang SC, Microsoft YaHei, sans-serif
- **字号梯度**: xs 12/20 · sm 13/22 · base 14/22 · md 16/24 · lg 18/26 · xl 20/28
- **字重**: Regular 400 / Medium 500 / Bold 700
- **圆角**: none 0 · sm 2 · base 8 · round 20 · circle 999
- **阴影**: lighter / light / base / dark（见 DESIGN.md）
- **通用尺寸**: sm 24px / base 32px / lg 40px

## 关键组件规范索引

DESIGN.md 中已定义的 Figma UI Kit 组件（按页面顺序）:

- **Button 按钮** — 10 轴变体（size/type/style/round/icon/plain/background/state/disabled/loading），高 24/32/40px
- **Button Group 按钮组** — default/primary/confirm/delete/split-*，高 32px
- **Link 链接** — primary/default/danger + underline/icon/state/disabled，高 22px
- **Checkbox 复选框 / Checkbox Group** — size + checked/indeterminate/border/state/disabled；Group 含 border/button/icon 与 num 2–10
- **Radio 单选框 / Radio Group** — size + checked/border/state/disabled；Group 同复选组结构
- **Switch 开关** — size + type(default/text/icon 等)/switch/custom，高 24/32/40px
- **Input 输入框 / Input-extend / Input Number** — size + filled/icon/textarea/maxlength/required/state/disabled；extend 含前后缀插槽；Number 含步进按钮
- **Select 选择器** — size + selected/multiple/collapse/filterable/required/state/disabled
- **Datetime Picker 日期时间选择器** — date/datetime/time + focus/selected/range/shortcut，高 32px
- **Form 表单 / Form Item** — align left/right/top；Form Item 12 种 type + 3 档 size
- **Table 表格** — Table Header / Cell-basic / Cell-tree，行高 32/40/48px，单元格 13 种 type；表头底 #FBFCFE + 1px #F0F4F7 边框 + 顶部 12px 圆角
- **Tag 标签** — 5 语义 × light/dark/plain × closable/round，高 20/24/32px；另有 Check Tag
- **Statistic 统计数值** — basic/card/countdown（240×76/92/128）
- **Tabs 标签页** — default/card/border-card + closable/position/custom-icon/add
- **Dialog 对话框** — align default/center，600×300 / 800×600
- **Tooltip 文字提示 / Popconfirm** — 12 方向 × dark/light/border × multiple
- **Icon 图标** — SVG 图标库（on-going），禁止 emoji

### 平台扩展组件（订单通业务组件，不在 UI Kit 内）

- **Sidebar 侧边栏** — 240px 深蓝底 #14263b，激活指示线 #2ea0ce
- **Header 顶栏** — 64px 白色顶栏，含面包屑 + 升级 pill
- **Pagination 翻页器** — 导航 42×30 / 数字 30×30，激活页主色文字
- **KPI 指标卡片** — 数据洞察模块指标卡
- **Chart 图表面板** — 252px 图表容器
- **Progress 进度条** — 8px 高，999px 圆角

## Claude Code Agent 使用提示

1. **必须完整读取 DESIGN.md** — 只读 README 速查表不足以获取完整规范
2. **不要猜测色值** — 所有颜色来自 DESIGN.md tokens，不用近似色
3. **遵循组件 spec** — 每个组件的变体轴、尺寸、状态以 DESIGN.md 为准
4. **字体加载** — Inter + PingFang SC；数字默认等宽 tabular-nums
5. **优先复用组件** — 按 Figma UI Kit 的 17 个组件页复用，不另造组件/样式
6. **设计在 Figma 中进行** — 不得直接生成 HTML 原型
