# style-theme-tune

## 目的

根据产品类型和行业，制定统一的视觉风格参数（配色、字体、间距、圆角、阴影）。

## 输入

- 需求文档（产品类型、目标用户、行业）
- 品牌信息（如有 Logo、品牌色）

## 输出

- 视觉风格指南（可直接用于 CSS 变量）

## 执行步骤

### 1. 确定产品类型与行业映射

| 行业 | 风格倾向 | 常用主色 | 字体偏好 |
|------|----------|----------|----------|
| 金融/银行 | 稳重、专业、可信 | 蓝色 #1657DC、藏青 #0d47a1 | 无衬线、中等字重 |
| 医疗/健康 | 干净、温暖、关怀 | 蓝绿 #00bcd4、浅蓝 #e3f2fd | 圆体/柔和非衬线 |
| 电商/零售 | 活力、促销感、热闹 | 橙红 #ff5722、暖色系 | 醒目标题字体 |
| SaaS/企业 | 专业、高效、现代 | 蓝色系、中性灰 #F6F9FB  | Googel Sans/Inter/Roboto/SF |
| SaaS/旅游 | 专业、高效、科技 | 绿色系 #008489、中性灰 #F6F9FB | Googel Sans/Inter/Roboto/SF |
| 社交/娱乐 | 年轻、多彩、趣味 | 渐变、鲜艳色 | 个性化字体 |
| 教育/知识 | 清爽、专注、温和 | 绿色 #4caf50、米白 | 易读衬线/非衬线 |

### 2. 建立 CSS 变量体系

```css
:root {
  /* === 主色调 === */
  --color-primary: #2563eb;
  --color-primary-light: #3b82f6;
  --color-primary-dark: #1d4ed8;
  --color-primary-bg: #eff6ff;

  /* === 中性色 === */
  --color-bg: #ffffff;
  --color-bg-secondary: #f9fafb;
  --color-border: #e5e7eb;
  --color-text: #111827;
  --color-text-secondary: #6b7280;
  --color-text-muted: #9ca3af;

  /* === 语义色 === */
  --color-success: #10b981;
  --color-warning: #f59e0b;
  --color-error: #ef4444;
  --color-info: #3b82f6;

  /* === 字体 === */
  --font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
  --font-size-xs: 12px;
  --font-size-sm: 14px;
  --font-size-base: 16px;
  --font-size-lg: 18px;
  --font-size-xl: 20px;
  --font-size-2xl: 24px;
  --font-size-3xl: 30px;

  /* === 间距 === */
  --spacing-xs: 4px;
  --spacing-sm: 8px;
  --spacing-md: 16px;
  --spacing-lg: 24px;
  --spacing-xl: 32px;
  --spacing-2xl: 48px;

  /* === 圆角 === */
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --radius-xl: 16px;
  --radius-full: 9999px;

  /* === 阴影 === */
  --shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
  --shadow-md: 0 4px 6px -1px rgba(0,0,0,0.1);
  --shadow-lg: 0 10px 15px -3px rgba(0,0,0,0.1);
  --shadow-xl: 0 20px 25px -5px rgba(0,0,0,0.1);

  /* === 布局 === */
  --header-height: 64px;
  --sidebar-width: 240px;
  --content-max-width: 1200px;
}
```

### 3. 输出风格指南

```markdown
## 视觉风格指南

### 设计理念
- 关键词：[3-5 个形容词，如"专业、简洁、高效、现代"]
- 情感目标：[用户使用时的感受]

### 配色方案
- 主色：`#XXXXXX`（用途说明）
- 辅色：...
- 预览：[色块展示]

### 字体层级
| 层级 | 字号 | 字重 | 用途 |
|------|------|------|------|
| H1 | 30px | 700 | 页面标题 |
| H2 | 24px | 600 | 区块标题 |
| H3 | 20px | 600 | 卡片标题 |
| Body | 16px | 400 | 正文 |
| Caption | 14px | 400 | 辅助文字 |

### 组件样式参考
- 按钮：主按钮（填充）、次按钮（描边）、文字按钮
- 输入框：默认态、聚焦态、错误态、禁用态
- 卡片：白底、圆角、阴影、hover 上浮效果
```
