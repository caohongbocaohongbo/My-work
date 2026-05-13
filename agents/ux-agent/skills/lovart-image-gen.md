---
name: lovart-image-gen
description: 调用Lovart API进行AI图片生成，支持UI素材、图标、插画、参考图等多种设计素材产出
---

# Lovart 图片生成（Lovart Image Generation）

## 适用场景

UI 设计过程中的图片素材生成，包括但不限于：
- UI 界面中的装饰素材、背景图、占位图
- 图标和 Icon 设计参考
- 插画和视觉元素
- 设计参考图和情绪板素材
- Logo 和品牌元素探索

## 触发关键词

图片生成、AI 生图、生成素材、生成图标、生成插画、设计素材生成、lovart、生成参考图

## API 配置

### 网关地址

```
https://lgw.lovart.ai/v1/
```

### 认证方式

使用 `token` 请求头进行认证：

```bash
curl -H "token: <YOUR_TOKEN>" "https://lgw.lovart.ai/v1/<endpoint>"
```

**获取 Token**：
1. 登录 [Lovart](https://www.lovart.ai/)
2. 进入 **设置 → Developer Settings** 创建 API Key
3. 获取 Access Key（`ak_...`）和 Secret Key（`sk_...`）
4. 在浏览器 DevTools Network 面板中，过滤 `lgw`，查看任意请求的 `token` 请求头

### 支持的模型

| 模型 | 用途 |
|------|------|
| GPT Image 2 | 通用图片生成，设计素材 |
| Seedance 2.0 | 高质量图片生成 |
| Nano Banana Pro | 快速批量生成 |

## 核心实操规范

### 1. 生成前准备

- 确认 token 有效（在浏览器 Network 面板验证）
- 根据素材类型选择合适的模型
- 准备详细的提示词（prompt），包含风格、色调、用途描述

### 2. 提示词规范

设计素材生成时，提示词应包含以下要素：
- **类型**：icon / illustration / background / reference
- **风格**：minimal / flat / gradient / 3D / line-art / hand-drawn
- **色调**：具体色板或色调描述（如 "blue tech palette"、"warm earthy tones"）
- **用途**：在什么场景下使用（如 "mobile app onboarding"、"admin dashboard empty state"）

### 3. 生成策略

- **UI 素材**：优先用 GPT Image 2，注重设计感和排版
- **图标**：用 Nano Banana Pro 快速出多版本供选择
- **插画**：用 Seedance 2.0 追求高质感
- **参考图**：用 GPT Image 2 生成情绪板和风格参考

### 4. 结果处理

- 生成的图片保存到项目素材目录
- 在 Figma 中以 Image Fill 方式使用
- 记录 prompt 以便后续微调迭代

## 使用示例

### 生成 UI 装饰素材

```bash
curl -X POST "https://lgw.lovart.ai/v1/image/generate" \
  -H "token: <YOUR_TOKEN>" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Abstract geometric background pattern, blue gradient, clean modern style, suitable for SaaS dashboard hero section",
    "model": "gpt-image-2",
    "size": "1440x400"
  }'
```

### 生成图标

```bash
curl -X POST "https://lgw.lovart.ai/v1/image/generate" \
  -H "token: <YOUR_TOKEN>" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "A set of 4 minimal line-art icons: user profile, settings gear, notification bell, logout door, consistent 24px grid style",
    "model": "nano-banana-pro",
    "size": "512x512"
  }'
```

### 生成参考图

```bash
curl -X POST "https://lgw.lovart.ai/v1/image/generate" \
  -H "token: <YOUR_TOKEN>" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Hotel booking mobile app home screen design reference, luxury travel aesthetic, warm gold and navy color scheme",
    "model": "seedance-2.0",
    "size": "1024x1024"
  }'
```

## 与其他技能的配合

| 场景 | 配合技能 |
|------|----------|
| 生成素材后导入 Figma | `req-to-figma.md` |
| 生成图标后调整风格 | `style-theme-tune.md` |
| 为线框图生成配图 | `wireframe-pencil.md` |
| 交互设计中需要状态图 | `interaction-design.md` |

## 注意事项

- API 当前为早期版本，endpoint 可能变动
- token 有有效期，过期后需在 Lovart 后台重新获取
- 生成结果需设计师审核后再用于最终设计
- 注意 credit 消耗，避免无节制批量生成
