# interactive-html

## 目的

将线框图转化为独立的、可交互的 HTML 演示文件，用于用户确认和前端参考。

## 输入

- 线框图或 Pencil 项目（来自 `wireframe-pencil.md`）
- 视觉主题参数（来自 `style-theme-tune.md`）

## 输出

单个 `设计稿.html` 文件，要求：
- 完全自包含（无外部依赖，或仅引用 CDN）
- 所有页面/视图可切换演示
- 核心交互可实际操作（点击、展开、表单输入、弹窗等）
- 使用模拟数据填充

## 执行步骤

1. **确定技术方案**：
   - 纯 HTML + 内联 CSS + 原生 JS（推荐，零依赖）
   - 或使用 Tailwind CSS CDN + Alpine.js（轻量交互）
   - 或使用 Vue/React CDN（复杂状态管理）

2. **搭建页面骨架**：
   - 实现所有页面的 HTML 结构
   - 实现页面间导航/切换逻辑
   - 公共组件（Header、Footer、Sidebar）抽取复用

3. **实现交互**：
   - 表单输入与验证提示
   - 按钮点击与状态变化（loading、disabled）
   - 弹窗/抽屉的打开关闭
   - 列表筛选、排序、分页
   - 导航高亮当前页
   - 移动端菜单展开/收起

4. **填充模拟数据**：
   - 生成逼真的 mock 数据（中文姓名、邮箱、图片占位等）
   - 覆盖正常态、空态、加载态

5. **添加页面导航**：
   - 在页面顶部添加页面切换工具栏（开发/演示用）
   - 标注每个页面对应的路由

## 代码规范

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>项目名称 - 设计稿</title>
  <style>
    /* 全局样式 + 所有页面样式 */
  </style>
</head>
<body>
  <!-- 页面切换工具栏（演示用） -->
  <nav id="demo-nav">...</nav>

  <!-- 各页面 -->
  <main id="page-home">...</main>
  <main id="page-dashboard" style="display:none">...</main>

  <script>
    // 页面切换 + 交互逻辑
  </script>
</body>
</html>
```

## 自检清单

- [ ] 所有页面都可以在浏览器中查看
- [ ] 表单可以输入、提交（模拟）、显示验证错误
- [ ] 弹窗可以打开和关闭
- [ ] 移动端菜单可以展开收起
- [ ] hover/active/focus 状态有视觉反馈
- [ ] 无 console 错误
