# 订单通 (DingdanTong) Design System

所有页面设计开始前，**必须先完整读取** `./dingdantong/DESIGN.md` 文件中的设计令牌和组件规范，再开始生成 Figma 设计。

## 设计文件

- **Figma 文件**: https://www.figma.com/design/dVww7EP81seGeXADgHaM8m/订单通-工作台
- **组件样式参考 (FORM INPUT COMPONENTS)**: node-id=61-2
- **工作台 Dashboard 参考**: node-id=0-1

## 核心设计原则

1. **单一主色** — `#2F87AC` 是唯一的品牌色，用于主按钮、Tab激活线、操作链接、分页激活态。不要使用其他蓝色定义。
2. **扁平无阴影** — 全界面不使用 box-shadow，深度感来自侧栏的深色对比和卡片/背景的层次。
3. **统一圆角** — 卡片和表格容器统一使用 24px 圆角，按钮/输入框 8px，标签/badge 用 pill。
4. **零硬角** — 除侧栏和 body 网格外，所有容器、卡片、表格、交互元素均带圆角。
5. **不得出现 emoji** — 图标全部使用 SVG 图形。

## 设计令牌速查

| 类别 | 令牌 | 色值 | 用途 |
|------|------|------|------|
| 主色 | primary | #2F87AC | 主按钮、Tab 激活、操作链接 |
| 侧栏 | sidebar | #293A4E | 左侧导航背景 (120px 宽) |
| 表面 | surface-soft | #F5F7FB | 内容区域底色 |
| 表面 | canvas | #FFFFFF | 卡片、表格行、Header |
| 表面 | surface-table-header | #FBFCFE | 表头、分页栏、面包屑 |
| 文字 | ink | #131B2C | 激活 Tab |
| 文字 | body | #1F2D3D | 表格数据 |
| 文字 | muted | #5F6D7C | 页面标题 |
| 文字 | muted-soft | #97A6B8 | 表头、非激活 Tab、输入框标签 |
| 文字 | muted-placeholder | #BFC9D6 | 输入框占位文本 |
| 边框 | hairline | #F0F4F7 | 表格行分隔、Tab 底线 |
| 边框 | hairline-strong | #E1EEF5 | Input 默认边框、面包圈边框 |
| 边框 | border-input | #DEE0E5 | Select 边框、表格外容器 |
| 控件 | switch-on | #2F87AC | Switch 开启态轨道（同 primary） |
| 控件 | switch-off | #CBD5E1 | Switch 关闭态轨道（neutral） |
| 控件 | switch-thumb | #FFFFFF | Switch 圆钮（18×18） |

## 关键组件规范索引

DESIGN.md 中已定义的组件（按文档顺序）:

- **Sidebar** — 120px 深蓝侧栏，5px 蓝色激活指示条
- **Header** — 64px 白色顶栏，含面包屑 pill + 升级 pill
- **Tab Bar** — 54px，30px 间距，激活态 2px 蓝色底线
- **Table** — 48px 表头，min 75px 数据行，24px 圆角容器
- **Form Input** — 40px 高，标签内嵌左侧，4 态 (default/focus/error/disabled)
- **Form Select** — 40px 高，260px 宽，下拉面板带选项
- **Pagination** — 独立边框按钮，激活态 primary-pale 背景
- **Switch** — 44×24 开关轨道（pill），On=primary #2F87AC / Off=neutral #cbd5e1，18px 白色圆钮
- **Switch Item** — 设置项行（64px），左侧标题(13px)+描述(12px) / 右侧开关，行间 1px 分隔线
- **Status Tags** — 3 种语义变体 (paid/pending/cancelled)
- **Action Links** — Poppins Bold 14px，4 种变体 (primary/danger/muted/disabled)
- **Button (outline-primary)** — 32px 高，primary 文字 + hairline-strong 边框

## Claude Code Agent 使用提示

1. **必须完整读取 DESIGN.md** — 只读 README 速查表不足以获取完整规范
2. **不要猜测色值** — 所有颜色来自 DESIGN.md tokens，不用近似色
3. **遵循组件 spec** — Input/Select 的 border 粗细(0.6px vs 1px vs 1.5px)和颜色都有具体规定
4. **字体加载** — Inter + Poppins；PingFang SC 在 Figma 中不可用时用 Inter 替代
5. **不要创建组件** — Figma 文件中暂无 Component 定义，直接创建 Frame 即可
6. **设计在 Figma 中进行** — 不得直接生成 HTML 原型
