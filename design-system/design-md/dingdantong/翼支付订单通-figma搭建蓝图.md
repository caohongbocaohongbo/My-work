# 翼支付-订单通 · Figma 搭建蓝图

> 用于下次会话直接执行 `use_figma` 调用，无需重新分析 HTML 与 DESIGN.md。
> 风格优先级：DESIGN.md「主平台工作台布局」一节 > DESIGN.md token > 组件库 `0MXuYqIfMLENxlqG7XdSck`（参数补充）。

## 目标

- 目标文件：`KOXHXblq7EGcG7d9xc4GkV`
- 目标页：`cjjWnqJ-1`（在此页下新建子 Frame《翼支付-订单通》）
- 内容源：`/Users/fangcang/Downloads/订单通翼支付进件开通界面.html`
- 风格源：`/Users/fangcang/Documents/My-work-repo/design-system/design-md/dingdantong/DESIGN.md`

## HTML 到 DESIGN.md 的 token 映射表

| HTML CSS 变量 | HTML 取值 | → DESIGN.md token | 取值 |
|---|---|---|---|
| `--bg` | `#f6f8fb` | `colors.page` | `#f4f7fb` |
| `--surface` | `#ffffff` | `colors.surface` | `#ffffff` |
| `--surface-soft` | `#fbfcfd` | `colors.surface-2` | `#f8fafc` |
| `--line` | `#e7edf3` | `colors.line` | `#e6ecf2` |
| `--line-strong` | `#d7e0ea` | `colors.line-strong` | `#d5dde7` |
| `--text` | `#253142` | `colors.ink-900` | `#1f2d3d` |
| `--text-secondary` | `#647386` | `colors.ink-700` | `#4d6278` |
| `--text-tertiary` | `#94a1b1` | `colors.ink-300` | `#8d9bae` |
| `--accent` | `#2f8ed8` | `colors.brand-500` | `#2F87AC`（DESIGN.md 主品牌） |
| `--accent-soft` | `rgba(47,142,216,0.10)` | `colors.brand-50` | `#eef8fc` |
| `--accent-border` | `rgba(47,142,216,0.22)` | `colors.brand-100` | `#d9eef7` |
| `--nav-bg` | `#1b2432` | DESIGN.md 侧边栏 | `#14263b` |
| `--success` | `#3d9a62` | `colors.success-700` | `#047857` |
| `--warning` | `#b98227` | `colors.warning-700` | `#b45309` |
| `--danger` | `#c65c5c` | `colors.danger-700` | `#be123c` |
| `--radius-sm` | 8px | `rounded.md` | 8px |
| `--radius-md` | 12px | `rounded.lg` | 12px |
| `--shadow` | `0 1px 2px rgba(31,43,58,.04)` | `shadows.panel` | `0 1px 2px rgba(15,23,42,.04)` |

## 整体布局（DESIGN.md「主平台工作台布局」对齐）

```
画布 1920×N
└─ Frame: 翼支付-订单通  (Auto Layout Horizontal, 0 gap)
   ├─ 侧边栏 sidebar           240px × 1080  bg #14263b
   ├─ 主内容区 main            1fr           padding 30 40 30 40
   │   ├─ Topbar              56px           bg #fff, border #e6ecf2, radius 8
   │   ├─ Content (1180 居中 auto-layout vertical, gap 14)
   │   │   ├─ page-head        title 22/600 + subtitle 13 + status pill
   │   │   ├─ status-strip     当前步骤条
   │   │   ├─ step-shell  Grid 238 / 1fr  gap 16
   │   │   │   ├─ step-nav    238 sticky panel
   │   │   │   └─ panel       14 个 article 面板（用 component variants）
   │   │   └─ bottom-bar      sticky 底部操作栏
```

## 14 个步骤面板清单（按 HTML data-step-panel 顺序）

| # | 名称 | 关键组件 | 估计调用次数 |
|---|---|---|---|
| 0 | 开通说明 | 流程节点 8 卡 + 所需资料 check-grid 4 卡 + info notice | 1 |
| 1 | 基本信息 | 表单 form-grid 2 列：手机号输入 + 4 组 segmented 单选 | 1 |
| 2 | 主体信息 | 营业执照 OCR 上传区 + 商户/证照信息表单（3 个 sub-card） | 2 |
| 3 | 联系人信息 | 4 个联系人 sub-card（法定代表人含身份证 OCR 双面） | 2 |
| 4 | 银行账户 | 账户类型 segmented + 7 字段表单 + 银行开户许可证上传 | 1 |
| 5 | 资料上传 | upload-grid 3 列 × 7 卡 | 1 |
| 6 | 确认提交 | 5 个 summary-card 信息汇总 + 同意条款 | 1 |
| 7 | 开通进度 | timeline 7 节点 | 1 |
| 8 | 开户意愿 | 短信验证码表单 | 1 |
| 9 | 电子签章 | 验证码 + 申请人 upload-grid + 同意条款 | 1 |
| 10 | 产品签约 | summary-card + 验证码 | 1 |
| 11 | 分账关系 | notice + 3 字段表单 + 审核文件上传 | 1 |
| 12 | 开通完成 | summary-table 7 行 + check-grid 5 卡 | 1 |
| 13 | 状态异常 | warning notice + 操作按钮组 | 1 |

合计约 16 次 `use_figma` 调用 + 骨架 3 次 + 验证 5 次 ≈ **24 次**。

## 复用元件清单（先在 page 内部建组件）

1. **Pill** — 5 色 variants：blue / gray / green / orange / red（24px 胶囊）
2. **Btn** — 4 variants：primary / secondary / text / danger（36px）
3. **MiniBtn** — 26px 胶囊
4. **Field** — label + input + hint + error 的复合表单项
5. **RadioCard** — segmented 单选
6. **SubCard** — 圆角 12 / 浅底 / 16 padding 容器
7. **NoticeBox** — info / warning / danger 三色提示
8. **CheckCard** — 18px 圆点 + 文字
9. **UploadCard** — done / dashed / invalid 三状态
10. **StepItem** — pending / active / done 三状态
11. **FlowNode** — 流程节点
12. **TimelineItem** — done / active / fail / pending
13. **KV** — key 108px + value 列表项
14. **SummaryCard** — 标题 + 修改按钮 + 表

## 执行步骤（恢复会话后按序粘贴）

### Step 0 — 切到目标页并定位 cjjWnqJ-1
```js
const file = figma.root;
for (const page of file.children) {
  if (page.id.includes('cjjWnqJ-1') || page.name.includes('cjjWnqJ-1')) {
    await figma.setCurrentPageAsync(page);
    return { pageId: page.id, name: page.name };
  }
}
return file.children.map(p => ({ id: p.id, name: p.name }));
```

### Step 1 — 探查组件库
```js
// 探测当前页已用组件、变量、文字样式（按 figma-generate-design 2a-ii）
const frame = figma.currentPage.children[0];
const result = { components: [], variables: [], textStyles: [] };
// ... 遍历收集
return result;
```

### Step 2 — 创建外层 wrapper
```js
let maxX = 0;
for (const c of figma.currentPage.children) maxX = Math.max(maxX, c.x + c.width);
const wrap = figma.createAutoLayout('HORIZONTAL', {
  name: '翼支付-订单通',
  itemSpacing: 0,
  primaryAxisAlignItems: 'MIN',
  counterAxisAlignItems: 'MIN',
});
wrap.resize(1920, 1080);
wrap.x = maxX + 200;
wrap.fills = [{ type: 'SOLID', color: { r: 0.957, g: 0.969, b: 0.984 } }]; // #f4f7fb
return { wrapperId: wrap.id };
```

### Step 3 — 侧边栏（240×1080 #14263b）
按 DESIGN.md 侧边栏规范：品牌区 + 主菜单（5 项，「收款账号」激活态）+ footer。

### Step 4 — 主内容区容器 + topbar

### Step 5..18 — 14 个面板（每次 1 个，结束后 `await wrap.screenshot()` 验收）

### Step 19 — 底部 sticky bottom-bar

### Step 20 — 整体截图 + 验收比对

## 验收清单（任务完成时核对）

- [ ] 所有面板的颜色均来自 DESIGN.md token，无原 HTML `#2f8ed8` / `#1b2432` 残留
- [ ] 按钮全部用 `button-outline-primary` / `button-secondary`；`button-primary-filled` 仅出现在"提交审核""确认开户意愿"等 CTA
- [ ] Pill 5 色与 DESIGN.md 语义色匹配（绿 #047857 红 #be123c 橙 #b45309 蓝 #1f6f92）
- [ ] 字号严格 22/16/14/13/12/11，字重 600/400
- [ ] 圆角仅出现 6/8/12/999 四档
- [ ] 阴影仅 panel/float/pop 三档
- [ ] 间距使用 4/8/12/16/20/24/32/40 八档
- [ ] 表单输入框走 DESIGN.md 新规范（Label 内置 + 外层 0.6px #e1eef5 圆角 8）

## 启动指令模板（恢复会话后用）

```
继续执行《翼支付-订单通》Figma 搭建任务。
按 ~/Documents/My-work-repo/design-system/design-md/dingdantong/翼支付订单通-figma搭建蓝图.md 蓝图分步执行。
目标文件 KOXHXblq7EGcG7d9xc4GkV，目标页 cjjWnqJ-1。
执行模式：自己执行，不必中途确认。
```
