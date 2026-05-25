# 设计规范合规性审查（Design Spec Compliance）

审查 Figma 设计稿的视觉风格和交互状态是否符合 DESIGN.md 定义的设计约束。

## 执行流程

### 1. 加载 DESIGN.md 并提取约束

读取项目根目录 DESIGN.md，提取以下结构化约束清单：

- **颜色约束**：主色/辅助色/成功色/警告色/错误色/背景色/文字色/边框色（各色 hex 值 + 角色说明）
- **字体约束**：标题字体/正文字体（fontFamily/size/weight/lineHeight/letterSpacing）
- **间距约束**：间距尺度表（如 xs=4/sm=8/md=16/lg=24/xl=32），页面/卡片/组件级间距
- **形状约束**：按钮/卡片/输入框/弹窗的 border-radius
- **阴影约束**：卡片/弹窗/下拉菜单的阴影层级（x/y/blur/spread/color）

若 DESIGN.md 中某项未定义，标注"DESIGN.md 未定义，跳过审查"，不扣分。

### 2. 获取 Figma 设计数据

通过 Figma MCP 工具获取：
- `get_design_context`（设计 token、代码、截图）
- `get_variable_defs`（Figma 变量/Token）
- `get_metadata`（完整节点树，用于检查间距和布局）

### 3. 颜色审查

- 将 DESIGN.md 颜色清单与 `get_variable_defs` 逐项对比
- **容差 0**：hex 值必须完全匹配（不区分大小写）
- Figma 使用 Color Style（如 primary/500）时，检查底层值
- 每个违规记录：颜色角色 + 规范值 + Figma 实际值 + 涉及的 node-id

### 4. 字体审查

- 从 `get_design_context` 提取文本样式，抽样检查每个文字层级 >= 3 个实例
- fontFamily：必须完全一致
- fontSize：容差 0
- fontWeight：必须一致
- lineHeight：容差 +/- 2px

### 5. 间距审查

- 从 `get_metadata` 获取节点位置和尺寸
- 检查 Auto Layout 的 padding/gap
- 间距值必须匹配 DESIGN.md 定义的间距尺度之一（如用 md=16 替代 sm=8 合法，用 13 不合法）
- 若 DESIGN.md 精确定义了某处间距，必须匹配（容差 +/- 2px）

### 6. 圆角/阴影/边框审查

- cornerRadius：容差 0
- 阴影 blur：容差 +/- 2px，color 必须完全匹配
- 边框粗细：容差 +/- 1px，color 必须完全匹配

### 7. 交互状态审查

检查每个可交互组件的状态覆盖：

| 组件 | 应有状态 |
|------|----------|
| Button | Default, Hover, Active, Disabled, Loading |
| Input | Default, Focus, Error, Disabled, Filled |
| Select | Default, Open, Selected, Disabled, Error |
| Checkbox/Radio | Unchecked, Checked, Disabled |
| Toggle | Off, On, Disabled |
| Tab | Default, Active, Disabled |
| Modal | Closed, Open |

全局状态检查：Loading 态（skeleton/spinner）、Empty 态（空数据）、Error 态（表单/网络错误）

### 8. 点击区域审查

- 桌面端：可交互元素最小 32×32px
- 移动端：最小 44×44px

## 输出格式

向 `design-review-report.md` 提供：
- 各维度检查项数/通过数/违规数
- 每项违规：维度 + 描述 + 严重程度 + node-id + 修复建议

## 关键规则

- **零容差**：颜色和字体值必须完全匹配，不存在"差不多就行"
- **node-id 精确性**：每项违规指明具体 Figma node-id，不得模糊描述
- **禁止主观判断**：所有对比基于客观数值，不得出现"感觉不对"等评价
- **Figma 变量优先**：优先对比 Figma 变量/Token，其次才对比组件直接属性值
