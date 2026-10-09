# 订单通 (DingdanTong) Design System

所有页面/原型设计开始前，**必须先完整读取** `./dingdantong/DESIGN.md` 文件中的设计令牌、组件规范与生成约束。本 README 仅为速查索引。

> **基准铁律**：Figma 文件「FCG Design System - UI Kit (订单通)- v1」是组件与样式的唯一权威来源。README.md 与 DESIGN.md 若与 Figma 冲突，必须以 Figma 为准并同步修正文档，而不是反向改写组件规则。

## 设计文件

- **Figma UI Kit（组件权威来源）**: https://www.figma.com/design/EvOEzvO2sCtM8JavVCJSZP/FCG-Design-System---UI-Kit--%E8%AE%A2%E5%8D%95%E9%80%9A---v1?node-id=3045-18839&t=g00YP193ye1FYe3X-1
- **Foundations（设计令牌）**: node-id=0-3
- 组件页：❖ Button / ❖ Button Group / ❖ Link / ❖ Checkbox / ❖ Datetime Picker / ❖ Switch / ❖ Form / ❖ Input / ❖ Input Number / ❖ Radio / ❖ Select / ❖ Table / ❖ Tag / ❖ Statistic / ❖ Tabs / ❖ Alert / ❖ Dialog / ❖ Tooltip

## 核心设计原则

1. **Figma 优先** — 组件属性、变体轴、状态、尺寸和颜色以 Figma UI Kit 为准；文档只记录和解释 Figma，不自创规则。
2. **1920px 设计基准** — 生成页面/原型默认画板宽度为 1920px，内容使用 Auto Layout 和响应式约束，不能用固定坐标堆出不可伸缩页面。
3. **布局层默认透明** — 页面 section、布局 Frame、分组 Frame、普通内容容器默认 `fills: []` / transparent；不得自动生成白色背景块。只有 Figma 组件本身或明确的 L1 容器/浮层需要背景。
4. **单一主色** — `#2f87ac` 是唯一品牌蓝，用于主按钮、Tab 激活线、操作链接、选中态。不要使用其他蓝色定义。
5. **语义四色** — 成功 `#6a9f62` / 警告 `#be964b` / 错误 `#c66261` / 信息 `#97a6b8`，每色含 9 档明度梯度。
6. **8px 基础圆角** — 组件基础圆角 8px，小控件 2px，胶囊 20px，圆形 999px。
7. **三档组件尺寸** — 通用控件高度 24px / 32px / 40px。
8. **克制阴影** — 4 级阴影，仅浮层/弹窗/下拉使用，页面卡片默认扁平。
9. **不得出现 emoji** — 图标全部使用 SVG 图形。

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

## 页面/原型生成速查

- **画板**：默认宽度 1920px；桌面内容按 1920px 基准设计，窄桌面、平板、移动端按 DESIGN.md 的响应式断点自动收缩/堆叠。
- **布局**：所有一级页面结构、主内容、列表、表单、卡片网格优先使用 Auto Layout；文本和控件允许随内容 Hug，主要内容列允许 Fill。
- **背景**：页面底色使用 `bg-page #f7f8fa`；布局 Frame / section / group 默认透明。不要因为创建 Frame 而保留 Figma 默认白色 fill。
- **主按钮默认实例**：使用 Button 组件 `style=basic, round=off, size=default, icon=none, type=primary, plain=off, background=on, state=default, disabled=off, loading=off`。
- **主按钮状态**：hover 只切换 `state=hover`；active 只切换 `state=active`；禁用只切换 `disabled=on` 且 `state=default`；其余属性保持不变。

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
- **KPI 指标卡片** — 数据洞察模块指标卡；只有作为真实指标卡组件时使用背景，布局分组不得自动加白底
- **Chart 图表面板** — 252px 图表容器；图表画布可有容器背景，外层 section 默认透明
- **Progress 进度条** — 8px 高，999px 圆角

## 设计/原型生成提示

1. **必须完整读取 DESIGN.md** — 只读 README 速查表不足以获取完整规范
2. **以 Figma 为准** — DESIGN.md 与 Figma 冲突时，先按 Figma 修正文档，再生成页面/原型
3. **不要猜测色值** — 所有颜色来自 DESIGN.md tokens，不用近似色
4. **遵循组件 spec** — 每个组件的变体轴、尺寸、状态以 Figma UI Kit 为准
5. **字体加载** — Inter + PingFang SC；数字默认等宽 tabular-nums
6. **优先复用组件** — 按 Figma UI Kit 的 17 个组件页复用，不另造组件/样式
7. **保持双向一致** — 无论生成 Figma 设计、HTML 原型还是代码页面，都必须复用同一令牌、组件状态和响应式布局规则
