---
version: alpha
name: 订单通 (DingdanTong)
description: A restrained, professional B2B SaaS order and invoice management platform built on a clean white-and-gray canvas, anchored by a single cool blue accent (#2F87AC) that carries every primary CTA, active-tab indicator, and actionable link. Type runs Inter for Latin and PingFang SC for Chinese at controlled weights — display headings sit at 24px SemiBold, body at 13–14px Regular/Medium, intentionally restrained to keep visual noise low. The sidebar uses a deep navy (#293A4E) as the only dark surface in the system, while the content area alternates between a soft page-floor (#F5F7FB) and white content cards with a unified 24px corner radius. Status tags come in three semantic variants (paid/pending/cancelled) rendered as pill badges with distinct color pairs. There is no hard corner anywhere except the body grid — every container, card, table, and interactive element is rounded.

colors:
  primary: "#2f87ac"
  primary-light: "#2ea0ce"
  primary-pale: "#f4fbfe"
  primary-border: "#d9edf6"
  primary-active: "#1f6d8a"
  primary-disabled: "#b8d8e7"
  sidebar: "#293a4e"
  sidebar-text: "#f5f7fb"
  sidebar-active-indicator: "#2f87ac"
  ink: "#131b2c"
  body: "#1f2d3d"
  muted: "#5f6d7c"
  muted-soft: "#97a6b8"
  muted-light: "#a2afbd"
  muted-placeholder: "#bfc9d6"
  muted-price: "#697684"
  muted-action: "#647487"
  hairline: "#f0f4f7"
  hairline-strong: "#e1eef5"
  border-input: "#dee0e5"
  border-pagination: "#e6ecf2"
  canvas: "#ffffff"
  surface-soft: "#f5f7fb"
  surface-card: "#ffffff"
  surface-table-header: "#fbfcfe"
  surface-pagination-active: "#f4fbfe"
  status-paid-text: "#6a9f62"
  status-paid-bg: "#f4faf6"
  status-paid-border: "#daebdf"
  status-pending-text: "#c66261"
  status-pending-bg: "#ffece6"
  status-pending-border: "#ecbbba"
  status-cancelled-text: "#647487"
  status-cancelled-bg: "#f5f7fa"
  status-cancelled-border: "#e1e7ee"
  upgrade-bg: "#fff3e6"
  upgrade-border: "#ffdeba"
  upgrade-text: "#2f3034"
  pro-gradient-start: "#4a4d58"
  pro-gradient-end: "#28292b"
  pro-text: "#ecaa00"
  breadcrumb-accent: "#008489"
  breadcrumb-text: "#333333"
  on-primary: "#ffffff"
  on-dark: "#ffffff"
  on-sidebar: "#f5f7fb"
  link: "#2f87ac"
  scrim: "#000000"

typography:
  page-heading:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', -apple-system, system-ui, sans-serif"
    fontSize: 24px
    fontWeight: 700
    lineHeight: 1.92
    letterSpacing: -0.51px
    color: "{colors.muted}"
  section-title:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 13px
    fontWeight: 700
    lineHeight: 1.54
    letterSpacing: -0.08px
    color: "{colors.ink}"
  tab-active:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 13px
    fontWeight: 700
    lineHeight: 1.38
    letterSpacing: -0.08px
    color: "{colors.ink}"
  tab-inactive:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 13px
    fontWeight: 700
    lineHeight: 1.38
    letterSpacing: -0.08px
    color: "{colors.muted-soft}"
  table-header:
    fontFamily: "'Poppins', 'Inter', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 12px
    fontWeight: 600
    lineHeight: 1.5
    letterSpacing: 0
    color: "{colors.muted-soft}"
  body-md:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 14px
    fontWeight: 400
    lineHeight: 1.36
    letterSpacing: -0.21px
    color: "{colors.body}"
  body-md-medium:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 14px
    fontWeight: 500
    lineHeight: 1.36
    letterSpacing: -0.21px
    color: "{colors.body}"
  body-sm:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 12px
    fontWeight: 400
    lineHeight: 1.25
    letterSpacing: 0.12px
    color: "{colors.muted-light}"
  caption:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 13px
    fontWeight: 400
    lineHeight: 1.38
    letterSpacing: 0
    color: "{colors.muted}"
  price-display:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 14px
    fontWeight: 800
    lineHeight: 1.36
    letterSpacing: 0
    color: "{colors.muted-price}"
  discount-display:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 14px
    fontWeight: 700
    lineHeight: 1.36
    letterSpacing: 0
    color: "{colors.status-paid-text}"
  action-link:
    fontFamily: "'Poppins', 'Inter', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 14px
    fontWeight: 700
    lineHeight: 1.64
    letterSpacing: 0
    color: "{colors.primary}"
  action-link-danger:
    fontFamily: "'Poppins', 'Inter', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 14px
    fontWeight: 700
    lineHeight: 1.64
    letterSpacing: 0
    color: "{colors.status-pending-text}"
  action-link-muted:
    fontFamily: "'Poppins', 'Inter', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 14px
    fontWeight: 700
    lineHeight: 1.64
    letterSpacing: 0
    color: "{colors.muted-action}"
  action-link-disabled:
    fontFamily: "'Poppins', 'Inter', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 14px
    fontWeight: 400
    lineHeight: 1.64
    letterSpacing: 0
    color: "{colors.muted}"
  badge:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 12px
    fontWeight: 700
    lineHeight: 1.5
    letterSpacing: 0
  form-input-label:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 13px
    fontWeight: 400
    lineHeight: 1.38
    letterSpacing: 0
    color: "{colors.muted-soft}"
  form-input-text:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 13px
    fontWeight: 400
    lineHeight: 1.38
    letterSpacing: 0
    color: "{colors.body}"
  form-input-placeholder:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 13px
    fontWeight: 400
    lineHeight: 1.38
    letterSpacing: 0
    color: "{colors.muted-placeholder}"
  form-select-text:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 14px
    fontWeight: 400
    lineHeight: 1.36
    letterSpacing: 0
    color: "{colors.muted-light}"
  form-select-option:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 13px
    fontWeight: 400
    lineHeight: 1.38
    letterSpacing: 0
    color: "{colors.body}"
  form-select-chevron:
    fontFamily: "'Inter', 'Noto Sans', sans-serif"
    fontSize: 12px
    fontWeight: 700
    lineHeight: 1.33
    letterSpacing: 0
    color: "{colors.muted-soft}"
  breadcrumb:
    fontFamily: "'PingFang SC', 'Inter', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 14px
    fontWeight: 600
    lineHeight: 1.86
    letterSpacing: 0
    color: "{colors.breadcrumb-text}"
  breadcrumb-accent:
    fontFamily: "'PingFang SC', 'Inter', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 14px
    fontWeight: 600
    lineHeight: 1.86
    letterSpacing: 0
    color: "{colors.breadcrumb-accent}"
  sidebar-label:
    fontFamily: "'PingFang SC', 'Inter', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 13px
    fontWeight: 500
    lineHeight: 1.54
    letterSpacing: 0
    color: "{colors.on-sidebar}"
  sidebar-label-active:
    fontFamily: "'PingFang SC', 'Inter', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 13px
    fontWeight: 500
    lineHeight: 1.54
    letterSpacing: 0
    color: "{colors.on-primary}"
  upgrade-cta:
    fontFamily: "'PingFang SC', 'Inter', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 14px
    fontWeight: 500
    lineHeight: 1.36
    letterSpacing: -1.4px
    color: "{colors.upgrade-text}"
  pro-label:
    fontFamily: "'PingFang SC', 'Inter', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 14px
    fontWeight: 500
    lineHeight: 1.36
    letterSpacing: 0
    color: "{colors.pro-text}"
  button-sm:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 13px
    fontWeight: 600
    lineHeight: 1.23
    letterSpacing: -0.08px
  pagination:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 12px
    fontWeight: 400
    lineHeight: 1.25
    letterSpacing: 0
    color: "{colors.muted-action}"
  pagination-active:
    fontFamily: "'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', sans-serif"
    fontSize: 12px
    fontWeight: 700
    lineHeight: 1.25
    letterSpacing: 0
    color: "{colors.primary-light}"

rounded:
  none: 0px
  xs: 4px
  sm: 8px
  md: 12px
  lg: 16px
  xl: 24px
  pill: 9999px

spacing:
  xxs: 2px
  xs: 4px
  sm: 8px
  md: 10px
  base: 16px
  lg: 20px
  xl: 24px
  xxl: 30px
  xxxl: 40px
  section: 140px

components:
  sidebar:
    backgroundColor: "{colors.sidebar}"
    textColor: "{colors.on-sidebar}"
    typography: "{typography.sidebar-label}"
    width: 120px
    rounded: "{rounded.none}"
  sidebar-nav-item:
    backgroundColor: transparent
    textColor: "{colors.on-sidebar}"
    typography: "{typography.sidebar-label}"
    rounded: "{rounded.none}"
    padding: 40px 0 0 0
    gap: 10px
    iconSize: 24px
    labelHeight: 20px
  sidebar-nav-item-active:
    backgroundColor: transparent
    textColor: "{colors.on-primary}"
    typography: "{typography.sidebar-label-active}"
    rounded: "{rounded.none}"
    indicatorWidth: 5px
    indicatorColor: "{colors.sidebar-active-indicator}"
  sidebar-pro-button:
    backgroundGradient: "linear-gradient(257deg, #4A4D58 10.8%, #28292B 92.3%)"
    textColor: "{colors.pro-text}"
    typography: "{typography.pro-label}"
    rounded: "{rounded.none}"
    height: 50px
    width: 120px
    position: "absolute bottom"
  header-bar:
    backgroundColor: "{colors.canvas}"
    height: 64px
    padding: 16px
    rounded: "{rounded.none}"
  breadcrumb-pill:
    backgroundColor: "{colors.surface-table-header}"
    textColor: "{colors.breadcrumb-text}"
    typography: "{typography.breadcrumb}"
    rounded: "{rounded.pill}"
    borderColor: "{colors.hairline-strong}"
    borderWidth: 0.6px
    height: 36px
    padding: 0 12.6px
  breadcrumb-separator:
    color: "{colors.breadcrumb-text}"
    typography: "{typography.breadcrumb}"
  breadcrumb-current:
    color: "{colors.breadcrumb-accent}"
    typography: "{typography.breadcrumb-accent}"
  upgrade-pill:
    backgroundColor: "{colors.upgrade-bg}"
    textColor: "{colors.upgrade-text}"
    typography: "{typography.upgrade-cta}"
    rounded: "{rounded.pill}"
    borderColor: "{colors.upgrade-border}"
    borderWidth: 1px
    height: 36px
    padding: 2px 16px
    gap: 3px
  header-icon-button:
    backgroundColor: transparent
    size: 16px
    rounded: "{rounded.none}"
  header-user-button:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.muted}"
    typography: "{typography.caption}"
    rounded: "{rounded.pill}"
    height: 32px
    gap: 8px
  content-area:
    backgroundColor: "{colors.surface-soft}"
    rounded: "{rounded.xl}"
    padding: "{spacing.lg}"
    horizontalPadding: "{spacing.section}"
  content-card:
    backgroundColor: "{colors.surface-card}"
    rounded: "{rounded.xl}"
    padding: "{spacing.xxxl}"
  page-heading-row:
    backgroundColor: transparent
    padding: 0
    height: 47px
  page-heading:
    typography: "{typography.page-heading}"
  button-outline-primary:
    backgroundColor: "{colors.surface-table-header}"
    textColor: "{colors.primary}"
    typography: "{typography.button-sm}"
    rounded: "{rounded.sm}"
    borderColor: "{colors.hairline-strong}"
    borderWidth: 0.6px
    height: 32px
    padding: 0 12.6px
  tab-bar:
    backgroundColor: transparent
    borderBottomColor: "{colors.hairline}"
    borderBottomWidth: 1px
    height: 54px
    gap: "{spacing.xxl}"
  tab-item:
    backgroundColor: transparent
    textColor: "{typography.tab-inactive}"
    padding: 10px 0
    rounded: "{rounded.xs}"
  tab-item-active:
    backgroundColor: transparent
    textColor: "{typography.tab-active}"
    borderBottomColor: "{colors.primary}"
    borderBottomWidth: 2px
    padding: 10px 0
    rounded: "{rounded.none}"
  table-container:
    backgroundColor: transparent
    borderColor: "{colors.border-input}"
    borderStyle: solid
    borderWidth: 1px
    rounded: "{rounded.xl}"
  table-header-row:
    backgroundColor: "{colors.surface-table-header}"
    borderColor: "{colors.hairline}"
    borderWidth: 1px
    rounded: "{rounded.xl}" "{rounded.xl}" "{rounded.none}" "{rounded.none}"
    height: 48px
  table-header-cell:
    typography: "{typography.table-header}"
    padding: 15px 10px
  table-header-cell-first:
    typography: "{typography.table-header}"
    padding: 15px 18px
  table-row:
    backgroundColor: "{colors.canvas}"
    borderColor: "{colors.hairline}"
    borderWidth: 0 1px 0 1px
    minHeight: 75px
    padding: 10px 0
  table-cell:
    typography: "{typography.body-md}"
    padding: 0 10px
  table-cell-first:
    padding: 0 18px
  table-cell-order-title:
    typography: "{typography.body-md-medium}"
    padding: 1px 0
  table-cell-order-meta:
    typography: "{typography.body-sm}"
    gap: 4px
    lineHeight: 1.25
  table-cell-price:
    typography: "{typography.price-display}"
  table-cell-discount:
    typography: "{typography.discount-display}"
  tag-paid:
    backgroundColor: "{colors.status-paid-bg}"
    textColor: "{colors.status-paid-text}"
    typography: "{typography.badge}"
    rounded: "{rounded.pill}"
    borderColor: "{colors.status-paid-border}"
    borderWidth: 1px
    padding: 5px 10px
  tag-pending:
    backgroundColor: "{colors.status-pending-bg}"
    textColor: "{colors.status-pending-text}"
    typography: "{typography.badge}"
    rounded: "{rounded.pill}"
    borderColor: "{colors.status-pending-border}"
    borderWidth: 1px
    padding: 5px 10px
  tag-cancelled:
    backgroundColor: "{colors.status-cancelled-bg}"
    textColor: "{colors.status-cancelled-text}"
    typography: "{typography.badge}"
    rounded: "{rounded.pill}"
    borderColor: "{colors.status-cancelled-border}"
    borderWidth: 1px
    padding: 5px 10px
  action-link-primary:
    backgroundColor: transparent
    textColor: "{colors.primary}"
    typography: "{typography.action-link}"
    rounded: "{rounded.xs}"
    padding: 0
  action-link-danger:
    backgroundColor: transparent
    textColor: "{colors.status-pending-text}"
    typography: "{typography.action-link-danger}"
    rounded: "{rounded.xs}"
    padding: 0
  action-link-muted:
    backgroundColor: transparent
    textColor: "{colors.muted-action}"
    typography: "{typography.action-link-muted}"
    rounded: "{rounded.xs}"
    padding: 0
  action-link-disabled:
    backgroundColor: transparent
    textColor: "{colors.muted}"
    typography: "{typography.action-link-disabled}"
    rounded: "{rounded.xs}"
    padding: 0
  pagination-row:
    backgroundColor: "{colors.surface-table-header}"
    borderColor: "{colors.hairline}"
    borderWidth: 0.6px
    rounded: "{rounded.none}" "{rounded.none}" "{rounded.xl}" "{rounded.xl}"
    padding: 14.6px 18.6px
  pagination-button:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.muted-action}"
    typography: "{typography.pagination}"
    rounded: "{rounded.sm}"
    borderColor: "{colors.border-pagination}"
    borderWidth: 0.6px
    height: 30px
    minWidth: 57px
    padding: 0 10px
  pagination-button-active:
    backgroundColor: "{colors.primary-pale}"
    textColor: "{colors.primary-light}"
    typography: "{typography.pagination-active}"
    rounded: "{rounded.sm}"
    borderColor: "{colors.primary-border}"
    borderWidth: 0.6px
    size: 30px
  pagination-number:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.muted-action}"
    typography: "{typography.pagination}"
    rounded: "{rounded.sm}"
    borderColor: "{colors.border-pagination}"
    borderWidth: 0.6px
    size: 30px
---

## Overview

订单通 (DingdanTong) is a B2B SaaS enterprise platform for order and invoice management within the business travel and hospitality sector. The system serves corporate clients and merchants, providing a centralized interface for tracking orders, managing invoices, and handling payments. The design language is deliberately **restrained and professional** — the base canvas alternates between a soft page-floor (`{colors.surface-soft}` — #F5F7FB) and pure white content cards (`{colors.canvas}` — #FFFFFF), with a single cool blue accent (`{colors.primary}` — #2F87AC) that carries every active tab indicator, primary action link, and interactive state. There is no secondary brand color — the system relies on tonal grays and semantic status colors (green for paid, red for pending) to communicate meaning without adding visual noise.

Type runs **Inter** for Latin characters and numbers, paired with **PingFang SC** for Chinese text. The system is deliberately modest with typographic weight — headings sit at 24px Bold, body text at 13–14px, and table headers at a compact 12px SemiBold. The largest typographic moment is the price display at 14px ExtraBold (`{typography.price-display}`), which is intentionally restrained — this is an enterprise tool, not a consumer marketplace, and hierarchy is communicated through layout and color rather than typographic muscle.

The shape language is **soft and unified**. Every container, card, and table component uses a consistent `{rounded.xl}` 24px corner radius — a deliberate choice that creates visual calm across the interface. Status tags and breadcrumb pills use fully rounded `{rounded.pill}` edges. Pagination buttons use `{rounded.sm}` 8px corners for clarity at small scale. There is essentially no hard corner anywhere except the sidebar and the body grid itself.

**Key Characteristics:**
- Single accent color: `{colors.primary}` (#2F87AC) carries every active tab underline, primary action link, pagination active state, and outline button. Used sparingly — most of the interface is white + gray with one or two blue moments per view.
- Dual-typeface system: Inter for Latin/numerals, PingFang SC for Chinese. No decorative type — every character serves information density.
- Deep navy sidebar (`{colors.sidebar}` — #293A4E): The only dark surface in the system. 120px fixed width, icon + label navigation items, active indicator bar on the left edge. Provides strong spatial orientation without competing with content.
- Unified 24px corner radius (`{rounded.xl}`): Content area, cards, and tables all share the same radius, creating a cohesive, calm visual rhythm. No mixing of different corner sizes on the same surface tier.
- Semantic status tags: Three variants — paid (green `{colors.status-paid-bg}`), pending (warm red `{colors.status-pending-bg}`), cancelled (neutral gray `{colors.status-cancelled-bg}`) — rendered as pill badges with distinct background/text color pairs.
- Tab-based navigation within pages: Active tab marked by a 2px primary-color bottom border, inactive tabs in muted gray. No background changes, no shadows — pure text + underline.
- The design system uses zero elevation — no box-shadows anywhere. Depth comes from the sidebar contrast, the white-on-gray card layering, and the rounded-corner clipping.
- 4px base spacing system with major content padding at `{spacing.section}` (140px horizontal), generous but appropriate for a data-dense enterprise tool.

## Colors

### Brand & Accent
- **Primary** (`{colors.primary}` — #2F87AC): The single brand color. Used for active tab underlines, primary action links in table rows ("下载收据", "分享权限"), outline button text, pagination active state, and sidebar active indicator. A cool, muted blue that reads as professional and trustworthy rather than playful.
- **Primary Light** (`{colors.primary-light}` — #2EA0CE): A slightly brighter variant used for the active pagination number. Provides a subtle luminance bump for the smallest interactive elements.
- **Primary Pale** (`{colors.primary-pale}` — #F4FBFE): The lightest blue tint, used as the background for the active pagination button. Barely perceptible — just enough to signal "selected."
- **Primary Border** (`{colors.primary-border}` — #D9EDF6): Border color for active pagination buttons. Light enough to not compete with the text.
- **Primary Active** (`{colors.primary-active}` — #1F6D8A): The press / pointer-down variant. Used on button and link active states.
- **Primary Disabled** (`{colors.primary-disabled}` — #B8D8E7): A pale tint used on disabled action links and buttons.

### Surface
- **Canvas** (`{colors.canvas}` — #FFFFFF): The default card and header surface. Content cards, table rows, header bar, and pagination buttons all sit on white. The system does not have a dark mode.
- **Surface Soft** (`{colors.surface-soft}` — #F5F7FB): The page floor — every content area sits on this soft blue-gray. Provides a subtle contrast against white cards without the harshness of a darker gray. Also used for cancelled status tag backgrounds.
- **Surface Card** (`{colors.surface-card}` — #FFFFFF): Alias for the content card surface — always white.
- **Surface Table Header** (`{colors.surface-table-header}` — #FBFCFE): A near-white blue-tinted surface for table header rows. Slightly cooler than pure white to distinguish the header from data rows.
- **Surface Pagination Active** (`{colors.surface-pagination-active}` — #F4FBFE): Alias for the active pagination button background.

### Sidebar
- **Sidebar** (`{colors.sidebar}` — #293A4E): Deep navy blue, the only dark surface in the system. 120px fixed width, full viewport height. Houses icon + label navigation items and a gradient pro-upgrade button at the bottom. The darkness creates clear spatial separation between navigation and content without relying on borders or shadows.
- **Sidebar Text** (`{colors.sidebar-text}` — #F5F7FB): Default text color for sidebar navigation labels — off-white with slight blue undertone.
- **Sidebar Active Indicator** (`{colors.sidebar-active-indicator}` — #2F87AC): A 5px-wide vertical bar on the left edge of the active navigation item. The primary accent's only appearance in the sidebar.

### Text
- **Ink** (`{colors.ink}` — #131B2C): The darkest text color, used for section titles and active tab labels. Nearly black but slightly softened.
- **Body** (`{colors.body}` — #1F2D3D): Primary data text — table cell content, order titles, payment method names. A deep blue-gray that reads clearly on white without the harshness of pure black.
- **Muted** (`{colors.muted}` — #5F6D7C): Page heading color and secondary labels. Softer than body text — deliberately understated for section chrome.
- **Muted Soft** (`{colors.muted-soft}` — #97A6B8): Table header text and inactive tab labels. The lightest text tone still meeting 4.5:1 contrast on white.
- **Muted Light** (`{colors.muted-light}` — #A2AFBD): Order metadata text (timestamps, order numbers) and Select component placeholder text. Used exclusively for supplementary information that should recede visually.
- **Muted Placeholder** (`{colors.muted-placeholder}` — #BFC9D6): Input placeholder text and disabled field text. Lighter than `muted-soft` — designed to be clearly recognizable as placeholder content rather than actual data. Used in form-input placeholders and as the disabled-state text color for both label and value.
- **Muted Price** (`{colors.muted-price}` — #697684): Actual payment amount display. Weighted via ExtraBold typography but colored at a mid-tone so it doesn't compete with action links.
- **Muted Action** (`{colors.muted-action}` — #647487): Tertiary action links ("取消订单") and pagination controls. Deliberately subdued — these are secondary actions.
- **Link** (`{colors.link}` — #2F87AC): Alias for primary — inline and action link color.

### Semantic Status
- **Status Paid** — Text `{colors.status-paid-text}` (#6A9F62), Background `{colors.status-paid-bg}` (#F4FAF6), Border `{colors.status-paid-border}` (#DAEBDF). A calm, muted green — not a bright success green, but a restrained tone appropriate for enterprise context.
- **Status Pending** — Text `{colors.status-pending-text}` (#C66261), Background `{colors.status-pending-bg}` (#FFECE6), Border `{colors.status-pending-border}` (#ECBBBA). A warm terracotta red — signals action needed without alarm.
- **Status Cancelled** — Text `{colors.status-cancelled-text}` (#647487), Background `{colors.status-cancelled-bg}` (#F5F7FA), Border `{colors.status-cancelled-border}` (#E1E7EE). Neutral gray — cancelled is a terminal state, and the color reflects finality.

### Promotion / Upsell
- **Upgrade Background** (`{colors.upgrade-bg}` — #FFF3E6): A warm cream for the "升级专业版" pill in the header. Distinct enough to be noticed, subtle enough to not distract from core tasks.
- **Upgrade Border** (`{colors.upgrade-border}` — #FFDEBA): Soft warm gold border for the upgrade pill.
- **Upgrade Text** (`{colors.upgrade-text}` — #2F3034): Near-black text on the cream pill — legible and unassuming.
- **Pro Gradient Start** (`{colors.pro-gradient-start}` — #4A4D58), **Pro Gradient End** (`{colors.pro-gradient-end}` — #28292B): The gradient for the sidebar's bottom "专业版" button. Dark metallic tones.
- **Pro Text** (`{colors.pro-text}` — #ECAA00): A metallic gold label on the pro button gradient. Signals premium features.

### Hairlines & Borders
- **Hairline** (`{colors.hairline}` — #F0F4F7): The default 1px border — table row dividers, header borders, pagination container edges. A cool near-white that reads as structure without visual weight.
- **Hairline Strong** (`{colors.hairline-strong}` — #E1EEF5): A slightly more visible border — breadcrumb pill outline, outline button border, and form-input default state border. Carries a subtle blue undertone that harmonizes with the primary accent.
- **Border Input** (`{colors.border-input}` — #DEE0E5): Form-select default state border and table container border. Warmer than the hairline tones — signals a different semantic (container boundary vs. row divider).
- **Border Pagination** (`{colors.border-pagination}` — #E6ECF2): Pagination button borders. Slightly cooler than Border Input to match the primary accent's color temperature.

### Scrim
- **Scrim** (`{colors.scrim}` — #000000 at 50% opacity): The global modal backdrop. Stored as the base hex; opacity is applied at render time.

### Breadcrumb
- **Breadcrumb Accent** (`{colors.breadcrumb-accent}` — #008489): A teal accent used for the current page segment in the breadcrumb. A deliberate deviation from the primary blue — the teal signals "you are here" as a distinct color moment from the interactive blue of the rest of the system.
- **Breadcrumb Text** (`{colors.breadcrumb-text}` — #333333): Standard breadcrumb text color — a neutral dark gray.

## Typography

### Font Family
The system runs **Inter** for all Latin characters, numerals, and mixed-content strings, with **PingFang SC** as the primary Chinese typeface. The fallback stack walks `'Inter', 'PingFang SC', 'Noto Sans SC', 'Noto Sans JP', -apple-system, system-ui, sans-serif`. Table headers and action buttons use **Poppins** as the primary weight carrier for its clean geometric numerals and consistent SemiBold rendering.

There is no separate display family. Inter carries the Latin scale, PingFang SC carries the CJK scale, and the two are optically balanced for mixed-language content.

### Hierarchy

| Token | Size | Weight | Line Height | Letter Spacing | Use |
|---|---|---|---|---|---|
| `{typography.page-heading}` | 24px | 700 | 1.92 | -0.51px | Page titles ("订单与发票") |
| `{typography.section-title}` | 13px | 700 | 1.54 | -0.08px | Section labels ("个人订单记录") |
| `{typography.tab-active}` | 13px | 700 | 1.38 | -0.08px | Active tab label ("订单管理") |
| `{typography.tab-inactive}` | 13px | 700 | 1.38 | -0.08px | Inactive tab label ("发票管理") |
| `{typography.table-header}` | 12px | 600 | 1.5 | 0 | Table column headers |
| `{typography.body-md-medium}` | 14px | 500 | 1.36 | -0.21px | Order/product name in table cells |
| `{typography.body-md}` | 14px | 400 | 1.36 | -0.21px | Table data cells (dates, payment method) |
| `{typography.body-sm}` | 12px | 400 | 1.25 | 0.12px | Order meta (timestamp, order number) |
| `{typography.caption}` | 13px | 400 | 1.38 | 0 | Header user area text |
| `{typography.price-display}` | 14px | 800 | 1.36 | 0 | Actual payment amount ("¥1,999.00") |
| `{typography.discount-display}` | 14px | 700 | 1.36 | 0 | Discount amount ("-¥0.00") |
| `{typography.action-link}` | 14px | 700 | 1.64 | 0 | Primary action link ("下载收据", "分享权限") |
| `{typography.action-link-danger}` | 14px | 700 | 1.64 | 0 | Urgent action link ("立即支付") |
| `{typography.action-link-muted}` | 14px | 700 | 1.64 | 0 | Secondary action link ("取消订单") |
| `{typography.action-link-disabled}` | 14px | 400 | 1.64 | 0 | Disabled action placeholder ("--") |
| `{typography.badge}` | 12px | 700 | 1.5 | 0 | Status tag text ("已支付", "待支付", "已取消") |
| `{typography.breadcrumb}` | 14px | 600 | 1.86 | 0 | Breadcrumb path segments |
| `{typography.breadcrumb-accent}` | 14px | 600 | 1.86 | 0 | Breadcrumb current page |
| `{typography.sidebar-label}` | 13px | 500 | 1.54 | 0 | Sidebar nav item labels |
| `{typography.sidebar-label-active}` | 13px | 500 | 1.54 | 0 | Active sidebar nav item label |
| `{typography.upgrade-cta}` | 14px | 500 | 1.36 | -1.4px | Header "升级专业版" pill |
| `{typography.pro-label}` | 14px | 500 | 1.36 | 0 | Sidebar "专业版" button |
| `{typography.button-sm}` | 13px | 600 | 1.23 | -0.08px | Outline button label ("发票申请") |
| `{typography.pagination}` | 12px | 400 | 1.25 | 0 | Pagination controls |
| `{typography.pagination-active}` | 12px | 700 | 1.25 | 0 | Active pagination number |

### Principles
Typographic weight is intentionally restrained. The page heading at 24px / 700 is the loudest element on the page, and even that sits in `{colors.muted}` rather than pure ink — the heading serves as orientation, not a visual anchor. The price display at 14px / 800 is the single typographically emphatic moment: it is the only place the system trusts weight alone to carry importance, because payment amounts are the most critical data point in an order management interface.

Table content runs at 14px body with 12px meta — tight but readable, optimized for scanning and comparison across rows. Chinese characters at these sizes remain crisp on both Retina and standard displays.

The system deliberately avoids uppercase, decorative type, or letter-spacing gimmicks. The only negative tracking is on the page heading (-0.51px) and body text (-0.21px), both subtle optical corrections.

### Font Substitutes
If Inter is unavailable, **system-ui** or **-apple-system** on macOS provide the closest metrics match. If PingFang SC is unavailable, **Noto Sans SC** maintains comparable character width. For Poppins, **Inter SemiBold** at the same size is an acceptable fallback — the geometric numerals transfer cleanly.

## Layout

### Spacing System
- **Base unit:** 4px.
- **Tokens:** `{spacing.xxs}` 2px · `{spacing.xs}` 4px · `{spacing.sm}` 8px · `{spacing.md}` 10px · `{spacing.base}` 16px · `{spacing.lg}` 20px · `{spacing.xl}` 24px · `{spacing.xxl}` 30px · `{spacing.xxxl}` 40px · `{spacing.section}` 140px.
- **Content area horizontal padding:** `{spacing.section}` (140px) — generous side margins that create a focused content lane within the 1800px body area (1920px viewport minus 120px sidebar).
- **Content area vertical padding:** `{spacing.lg}` (20px) top and bottom.
- **Card internal padding:** `{spacing.xxxl}` (40px) for the content card on all four sides.
- **Tab gap:** `{spacing.xxl}` (30px) between tab items — generous spacing that prevents accidental tab-switching on dense data pages.
- **Table cell padding:** `{spacing.md}` (10px) horizontal for most columns; 18px for the first column (order info) to give the visual anchor a slight inset.
- **Action link gap:** 15px between adjacent action links in the operations column.

### Grid & Container
- **Viewport:** 1920px fixed width (desktop-first enterprise application).
- **Sidebar:** 120px fixed width, full-height, flush left. Contains 8 navigation items (工作台, 商机, 产品, 订单, 自助收款, 客户, 报表, 设置) plus a bottom pro-upgrade button.
- **Body:** 1800px width (1920px minus 120px sidebar), containing the header bar and content area.
- **Header:** Full 1800px width, 64px height, flexbox with breadcrumb left and utility icons right.
- **Content area:** 1800px width with `{spacing.section}` (140px) horizontal padding, creating a 1520px content lane. The content area itself has `{rounded.xl}` (24px) corner radius and sits on the soft page floor.
- **Content card:** Full content lane width (1440px between card padding), white surface with `{rounded.xl}` (24px) corners and `{spacing.xxxl}` (40px) internal padding.
- **Table container:** Full card width, with a 1px solid border (`{colors.border-input}` — #DEE0E5) and `{rounded.xl}` (24px) corner radius.

### Whitespace Philosophy
The system gives the content area 140px of horizontal breathing room — significantly more than typical enterprise SaaS (often 24–48px). This creates a narrow, focused content lane that reduces eye strain during extended data-review sessions. Within the card, 40px of padding on all sides creates a quiet frame around the data. The page heading floats 30px above the section title, which in turn sits 40px above the table — a clean, predictable vertical rhythm that lets the data speak without chrome shouting.

## Elevation

The system has **no elevation tiers**. There are no box-shadows anywhere in the interface.

- **Flat (default):** Every surface — sidebar, header, content area, cards, tables, buttons, tags, pagination — renders without shadow. The system communicates depth through:
  1. The sidebar's dark navy contrast against the light content area.
  2. The content area's `{surface-soft}` (#F5F7FB) floor receding behind white cards.
  3. The rounded-corner clipping of cards and tables.
  4. Hairline borders on table rows and pagination containers.

- **Modal scrim:** `{colors.scrim}` rendered at 50% opacity — the global modal backdrop. This is the only "elevation" effect in the system, and it's a scrim, not a shadow.

This is a deliberate design choice: enterprise data tools benefit from flatness. Shadows add visual noise that competes with tabular data scanning. The system trusts color contrast and spatial positioning over simulated depth.

## Components

### Sidebar Navigation

**`sidebar`** — A 120px-wide, full-height dark navy panel (`{colors.sidebar}` — #293A4E) fixed on the left edge. The sidebar is the spatial anchor of the entire interface — it is always present, never collapses, and provides consistent orientation regardless of which page the user is on.

**`sidebar-nav-item`** — Each navigation item is a vertical stack: a 24px icon centered above a single line of label text in `{typography.sidebar-label}`. Items are spaced 40px apart vertically. The default state is the sidebar text color (`{colors.on-sidebar}`) with no background.

**`sidebar-nav-item-active`** — The active item is marked by a 5px-wide primary-colored vertical indicator bar (`{colors.sidebar-active-indicator}`) on the left edge, and the icon + label render in white (`{colors.on-primary}`) for maximum contrast against the dark sidebar. The 5px bar is the only use of the primary accent on the sidebar — it is small but unmistakable.

**`sidebar-pro-button`** — A full-width (120px) button at the absolute bottom of the sidebar with a metallic gradient background (`linear-gradient(257deg, #4A4D58, #28292B)`) and gold text (`{colors.pro-text}`). It carries a diamond/gem icon and the label "专业版" in `{typography.pro-label}`. The gradient distinguishes this as a premium upsell, not a navigation item.

The sidebar navigation items, in order: 工作台 (Workspace), 商机 (Opportunities), 产品 (Products), 订单 (Orders), 自助收款 (Self-service Payment), 客户 (Clients), 报表 (Reports), 设置 (Settings).

### Header Bar

**`header-bar`** — A 64px-tall white bar spanning the full 1800px body width. 16px internal padding. Flexbox layout with left-justified breadcrumb/tools and right-justified utility icons. No bottom border — the transition to the soft page floor below is seamless.

**`breadcrumb-pill`** — A fully rounded pill (`{rounded.pill}`) containing the navigation path. The path segments use a slash separator with the current page rendered in teal accent (`{colors.breadcrumb-accent}`) — a deliberate departure from the primary blue that signals "location, not action." The pill has a subtle border (`{colors.hairline-strong}`) and near-white fill (`{colors.surface-table-header}`). 36px height.

**`upgrade-pill`** — Adjacent to the breadcrumb, a warm cream pill (`{colors.upgrade-bg}` with `{colors.upgrade-border}` border) containing the "升级专业版" label and a small diamond icon. Fully rounded (`{rounded.pill}`), 36px height. The warm tone contrasts gently with the cool blue-gray of the rest of the header, serving as a soft upsell nudge.

**`header-icon-button`** — 16px icon buttons in the right utility area: notifications, help, and settings. Transparent background, no border. Simple and unobtrusive.

**`header-user-button`** — A 32px-tall user area on the far right: a small circular avatar icon (16px, `{rounded.pill}`) followed by "会员" (Member) label in `{typography.caption}`. White background.

### Content Area

**`content-area`** — The main content floor, filling the remaining space below the header. `{colors.surface-soft}` (#F5F7FB) background with `{rounded.xl}` (24px) corner radius. 20px vertical padding and 140px horizontal padding. This is where all page-specific content lives.

**`content-card`** — A white card (`{colors.surface-card}`) with `{rounded.xl}` (24px) corner radius and 40px internal padding on all sides. The card contains the page heading, tabs, and data content. In the current implementation, there is one card per page, filling the full content lane width.

### Page Heading & Actions

**`page-heading-row`** — A horizontal flex row containing the page title left-aligned and an optional action button right-aligned. 47px effective height. The heading text uses `{typography.page-heading}` in `{colors.muted}` — deliberately understated.

**`button-outline-primary`** — A compact outline button for page-level actions like "发票申请" (Invoice Application). Near-white fill (`{colors.surface-table-header}`), primary blue text (`{colors.primary}`), 0.6px border in `{colors.hairline-strong}`, `{rounded.sm}` (8px) corners, 32px height. The smaller radius distinguishes it from the cards and tables — an intentional scale cue that this is a button, not a container.

### Tab Navigation

**`tab-bar`** — A horizontal row of tab items separated by 30px gaps, sitting on a 1px bottom hairline (`{colors.hairline}`) that spans the full card width. 54px total height. The hairline provides a structural baseline for the tab labels to float above.

**`tab-item`** — 13px Bold label in `{colors.muted-soft}` (#97A6B8), sitting just above the hairline. Rounded 4px on hover for a subtle background highlight. Padding: 10px top/bottom, with inner 8px padding and 2px bottom clearance for the active indicator.

**`tab-item-active`** — Same typography size but in `{colors.ink}` (#131B2C) for full contrast. Marked by a 2px primary-blue (`{colors.primary}`) underline flush with the hairline. No background change — the underline alone carries the active state. The tab label and underline together are the only blue moment in the top section of the card.

### Data Table

**`table-container`** — The outer wrapper for the data table, with a 1px solid border (`{colors.border-input}` — #DEE0E5) and `{rounded.xl}` (24px) corner radius.

**`table-header-row`** — A 48px-tall row with `{colors.surface-table-header}` (#FBFCFE) fill and 1px solid hairline borders on all sides except the top corners, which carry the table's `{rounded.xl}` radius. The near-white fill with a slight cool tint distinguishes the header from data rows.

**`table-header-cell`** — Column labels in `{typography.table-header}` — 12px SemiBold Poppins in `{colors.muted-soft}` (#97A6B8). Standard padding: 15px top/bottom, 10px left/right. The first column ("订单") gets 18px left padding for a slight visual inset.

**`table-row`** — A 75px-minimum-height data row. White background (`{colors.canvas}`), 1px solid hairline borders on left and right, 10px vertical padding. No bottom border — rows are separated by their internal padding and the alternating white/gray rhythm.

**`table-cell-order-title`** — The order/product name cell in the first column. 14px Medium weight (`{typography.body-md-medium}`) in `{colors.body}` (#1F2D3D). Single line with 1px vertical padding.

**`table-cell-order-meta`** — Below the order title, a two-line stack: timestamp ("2026年4月18日17:23") and order number ("订单号: 3243erdsr324"). Both in `{typography.body-sm}` — 12px Regular in `{colors.muted-light}` (#A2AFBD), with 4px gap between lines. This is the quietest text on the page — supplementary information that recedes behind the data columns.

**`table-cell-price`** — Payment amount in `{typography.price-display}` — 14px ExtraBold in `{colors.muted-price}` (#697684). The ExtraBold weight makes the amount scannable within a row without making it the loudest element.

**`table-cell-discount`** — Discount amount in `{typography.discount-display}` — 14px Bold in green (`{colors.status-paid-text}`). The green signals a positive (money saved), and the bold ensures it's distinguishable from the actual payment amount.

### Status Tags

**`tag-paid`** — A green pill badge: `{colors.status-paid-bg}` (#F4FAF6) fill, `{colors.status-paid-text}` (#6A9F62) text, `{colors.status-paid-border}` (#DAEBDF) 1px border, `{rounded.pill}` (9999px) corners, 5px top/bottom padding with 10px horizontal. Label: "已支付". The green is muted and calm — not an alert, just a state indicator.

**`tag-pending`** — A warm red pill badge: `{colors.status-pending-bg}` (#FFECE6) fill, `{colors.status-pending-text}` (#C66261) text, `{colors.status-pending-border}` (#ECBBBA) 1px border. Label: "待支付". The warm tone signals "action needed" without the urgency of a pure red.

**`tag-cancelled`** — A neutral gray pill badge: `{colors.status-cancelled-bg}` (#F5F7FA) fill, `{colors.status-cancelled-text}` (#647487) text, `{colors.status-cancelled-border}` (#E1E7EE) 1px border. Label: "已取消". The background is the same as the page floor — visually the quietest tag, reflecting the terminal nature of the cancelled state.

All three tags share the same dimensions, padding, border-radius, and typography (`{typography.badge}` — 12px Bold). Only the color triple (bg, text, border) changes. This consistency is key to the restrained aesthetic — the tags communicate status purely through color, not through shape or size variation.

### Action Links

**`action-link-primary`** — Primary text link in `{colors.primary}` (#2F87AC) with `{typography.action-link}` (14px Bold Poppins). Used for non-destructive, positive actions: "下载收据" (Download Receipt), "分享权限" (Share Permissions). No underline in default state; underline on hover.

**`action-link-danger`** — Urgent action link in `{colors.status-pending-text}` (#C66261) with `{typography.action-link-danger}`. Used for the "立即支付" (Pay Now) call-to-action. The warm red creates appropriate urgency for payment-related actions.

**`action-link-muted`** — Secondary action link in `{colors.muted-action}` (#647487) with `{typography.action-link-muted}`. Used for "取消订单" (Cancel Order). The muted tone signals this is a destructive or secondary action that should not draw attention.

**`action-link-disabled`** — Disabled placeholder in `{colors.muted}` (#5F6D7C) with 400 weight. Used for the "--" placeholder when no actions are available (e.g., for cancelled orders). The regular weight and mid-tone color communicate non-interactivity.

Action links in the operations column are separated by 15px gaps. Only one to two links appear per row, keeping the operations column compact and scannable.

### Pagination

**`pagination-row`** — A footer bar at the bottom of the table container, with `{colors.surface-table-header}` (#FCFDFE) fill, 0.6px hairline border, and `{rounded.xl}` (24px) bottom corners to match the table container. Content is space-between: a left-side summary (optional, currently empty) and right-side pagination controls. Padding: 14.6px top/bottom, 18.6px left/right.

**`pagination-button`** — Previous/Next navigation buttons: white fill, `{colors.muted-action}` (#617285) text in `{typography.pagination}`, 0.6px border in `{colors.border-pagination}`, `{rounded.sm}` (8px) corners, 30px height, 57px minimum width.

**`pagination-number`** — Page number buttons: identical to pagination-button but square (30px × 30px) and narrower text. White fill with `{colors.muted-action}` text.

**`pagination-button-active`** — The current page indicator: `{colors.primary-pale}` (#F4FBFE) fill, `{colors.primary-light}` (#2EA0CE) text in Bold weight, `{colors.primary-border}` (#D9EDF6) border. The blue tint is subtle but unmistakable — the only use of the primary palette in the pagination area.

### Form Input

**`form-input`** — A text input field with an integrated left-aligned label. The label sits inside the input frame, not outside, creating a compact inline form field suitable for search filters and data-entry forms.

**`form-input-default`** — The default state. White fill (`{colors.canvas}`), 0.6px solid border (`{colors.hairline-strong}` — #E1EEF5), `{rounded.sm}` (8px) corner radius, 40px total height. Horizontal padding: 15px (left + right). The label portion uses `{typography.form-input-label}` (Inter Regular 13px, `{colors.muted-soft}` — #97A6B8) and sits at the left side. The input value area fills the remaining width, using `{typography.form-input-text}` (Inter Regular 13px, `{colors.body}` — #1F2D3D) when filled, or `{typography.form-input-placeholder}` (Inter Regular 13px, `{colors.muted-placeholder}` — #BFC9D6) when empty.

**`form-input-focus`** — The focused/active state. Same layout as default but with a 1.5px solid border in `{colors.primary}` (#2F87AC). The thicker primary border signals keyboard focus and active input state.

**`form-input-error`** — The error state. Same layout as default but with a 1.5px solid border in `{colors.status-pending-text}` (#C66261). Used when validation fails (e.g., duplicate tag name, invalid format). The red border provides immediate visual feedback that the input value needs correction.

**`form-input-disabled`** — The disabled state. `{colors.surface-soft}` (#F5F7FB) fill, 1px solid border in `{colors.hairline}` (#F0F4F7). All text (both label and value/placeholder) renders in `{colors.muted-placeholder}` (#BFC9D6). Cursor: not-allowed. Used for system-locked fields that cannot be edited.

### Form Select

**`form-select`** — A dropdown/select component for choosing from a predefined list of options. Used for filter dropdowns and tag selection throughout the system.

**`form-select-default`** — The default (closed) state. White fill (`{colors.canvas}`), 1px solid border (`{colors.border-input}` — #DEE0E5), `{rounded.sm}` (8px) corner radius, 40px total height. Fixed width of 260px (scales with content for wider variants). Padding: 10px vertical, 12px horizontal. Placeholder text uses `{typography.form-select-text}` (Inter Regular 14px, `{colors.muted-light}` — #A2AFBD). A chevron indicator ("▾") at the right edge uses `{typography.form-select-chevron}` (Inter Bold 12px, `{colors.muted-soft}` — #97A6B8).

**`form-select-open`** — The expanded state. The trigger input border changes to 1.5px solid `{colors.primary}` (#2F87AC). A dropdown panel appears below, with white fill, `{rounded.sm}` (8px) corners, and 1.5px primary border matching the trigger. The panel contains option rows separated vertically.

**`form-select-option`** — Individual selectable row within the dropdown panel. White fill by default, 32px height, padding 7px vertical / 12px horizontal. Text uses `{typography.form-select-option}` (Inter Regular 13px, `{colors.body}` — #1F2D3D).

**`form-select-option-hover`** — The hovered or keyboard-focused option state. `{colors.primary-pale}` (#F4FBFE) background fill with the same text styling as the default option. The pale blue highlight provides a clear but restrained selection preview. This is also used for the currently-selected value when the dropdown reopens.

### Table Cell — Order Detail (First Column)

The first column of the data table is a compound cell that merits its own description. It contains:

1. **Title line:** The product name ("专业版会员") in `{typography.body-md-medium}` — 14px Medium, `{colors.body}`.
2. **Meta line 1:** Timestamp ("2026年4月18日17:23") in `{typography.body-sm}` — 12px Regular, `{colors.muted-light}`.
3. **Meta line 2:** Order number ("订单号: 3243erdsr324") in `{typography.body-sm}` — 12px Regular, `{colors.muted-light}`.

The three lines are stacked with a 4px gap and vertically centered within the 55px-tall cell area. The 18px left padding gives this compound cell room to breathe.

### Pricing Cards

**`pricing-card-free`** — A white card (`{colors.surface-card}`) with `{rounded.xl}` (24px) corner radius and 1px hairline border (`{colors.hairline}`). Contains: a header area with `{colors.surface-table-header}` (#FBFCFE) background featuring the plan name in `{typography.section-title}` size and price in a larger weight; a feature list using checkmark icons (`{colors.status-paid-text}`) with `{typography.body-md}` labels; and an outline CTA button (`button-outline-primary`) at the bottom. Width: flexible, typically 680px. Internal padding: 40px.

**`pricing-card-pro`** — Identical structure to `pricing-card-free` but with visual emphasis: 2px primary border (`{colors.primary}`), a `{colors.primary-pale}` (#F4FBFE) header background, a `recommend-badge` in the top-right corner, and a filled primary CTA button (`button-primary-filled`) instead of outline. Checkmark icons use primary blue (`{colors.primary}`) instead of green. A payment methods caption appears below the CTA in `{typography.body-sm}`.

**`recommend-badge`** — A small pill badge (`{rounded.pill}`) with primary blue fill (`{colors.primary}`) and white text (`{colors.on-primary}`). Label: "推荐". Font: 12px SemiBold. Padding: 4px 16px. Used exclusively on the Pro pricing card to indicate the recommended plan.

**`button-primary-filled`** — A solid primary button variant. `{colors.primary}` fill, `{colors.on-primary}` text in `{typography.button-sm}` (13px SemiBold), `{rounded.sm}` (8px) corners, 48px height. Used for primary conversion CTAs like "立即升级专业版". Hover shifts to `{colors.primary-active}`.

### Landing Page Components

**`hero-section`** — A page hero block within the content card. Contains: a page-level heading in `{typography.page-heading}`; a supporting paragraph in `{typography.body-md}` spanning 2-3 lines; a row of stat items showing key metrics; and an optional CTA button on the right side. Background: transparent (inherits card white). No dedicated hero background color — the hero is part of the content card.

**`stat-item`** — A vertical stack displaying a large numeric value and a label. Value: `{colors.primary}` (#2F87AC), large bold type (28-36px depending on prominence). Label: `{colors.muted}` (#5F6D7C), 13px Regular. 4px gap between value and label. Used in hero sections to display social proof metrics (e.g., "10,000+ 合作酒店").

**`feature-card`** — A white card for highlighting capabilities in a 2×2 grid. `{rounded.lg}` (16px) corners, 1px `{colors.hairline}` border. Contains: a 48×48 icon box with `{colors.primary-pale}` fill and `{rounded.md}` (12px) corners; a title in 18px SemiBold; a description paragraph in `{typography.body-md}`; and a row of `feature-tag` pills. Width: ~680px. Internal padding: 32px.

**`feature-tag`** — A small pill (`{rounded.pill}`) with `{colors.primary-pale}` fill and `{colors.primary}` text in 12px Medium. Used inside feature cards to list related capabilities. Padding: 6px 8px, 8px gap between adjacent tags.

**`cta-banner`** — A horizontal call-to-action bar spanning the full card width. `{colors.primary-pale}` (#F4FBFE) background with `{rounded.xl}` (24px) corners. Contains a heading (20px Bold), a supporting line (14px Regular in `{colors.muted}`), and two CTA buttons on the right: a primary filled button (`button-primary-filled`) for the main action and an outline button (`button-outline-primary`) for the secondary action. Height: ~200px. Internal padding: 60px horizontal.

**`trust-card`** — A compact info card in a 3-column row. White fill, `{rounded.lg}` (16px) corners, 1px `{colors.hairline}` border. Contains: a primary-colored checkmark icon; a title in 16px SemiBold; and a description in `{typography.body-md}`. Width: ~453px. Internal padding: 32px. Used to communicate trust/reassurance messages (payment flexibility, security compliance, support availability).

### Comparison Table

**`comparison-section`** — A page section containing a section heading and a `table-container`. The comparison variant uses a 3-column layout: feature name (left, 600px), free plan (center, 400px), pro plan (right, 400px). Category divider rows use `{colors.surface-soft}` (#F5F7FB) background with `{typography.section-title}` labels. Data rows are 44px tall with 1px `{colors.hairline}` bottom borders. Check marks in the free column use `{colors.status-paid-text}` (green), in the pro column use `{colors.primary}` (blue). Dashes ("—") indicate unavailable features in `{colors.muted-light}`.

## Interaction States

### Action Links
- **Default:** Colored text (blue/red/gray depending on variant), transparent background, no underline.
- **Hover:** Underline appears. Text color darkens slightly. Cursor: pointer.
- **Active/Press:** Text color shifts to darker variant. Underline remains.
- **Disabled:** Gray text (`{colors.muted}`), regular weight (400), no underline, cursor: default.

### Buttons
- **Default (outline-primary):** Near-white fill (`{colors.surface-table-header}`), primary text, hairline border.
- **Hover:** Background shifts to primary-pale (`{colors.primary-pale}`). Border darkens to primary-border.
- **Active/Press:** Text color shifts to primary-active. Background remains pale.
- **Disabled:** Light gray fill, muted text, lighter border, cursor: not-allowed.

### Tabs
- **Default (inactive):** Muted soft text (`{colors.muted-soft}`), transparent background, no underline.
- **Hover:** Text color shifts toward ink. 4px border-radius background highlight in `{colors.surface-soft}` appears.
- **Active:** Ink text (`{colors.ink}`), 2px primary underline. Background remains transparent.

### Pagination
- **Default:** White fill, muted text, subtle border.
- **Hover:** Border darkens to `{colors.primary-border}`. Background warms slightly.
- **Active:** Primary-pale fill, primary-light Bold text, primary-border border.

### Table Rows
- **Default:** White background, no shadow.
- **Hover:** Background shifts to a very pale tint (lighter than `{colors.surface-table-header}`). No shadow or elevation change.

### Status Tags
- **Default:** Respective colored fill and text. No interaction — tags are display-only.

### Sidebar Navigation
- **Default:** Sidebar-text color (`{colors.sidebar-text}`), transparent background.
- **Hover:** Text brightens toward white. Background slightly lightens with a subtle overlay.
- **Active:** White text, 5px primary indicator bar on left edge.

## Responsive Behavior

| Name | Width | Key Changes |
|---|---|---|
| Desktop | 1920px | Full layout: 120px sidebar + 1800px body. Content area with 140px horizontal padding. Tab bar visible. Full 7-column data table. |
| Compact Desktop | 1440–1919px | Sidebar remains 120px. Content horizontal padding reduces proportionally (min 80px). Table columns may compress. |
| Tablet | 1024–1439px | Sidebar collapses to icon-only mode (60px) or hidden behind hamburger. Content padding reduces to 40px. Table adds horizontal scroll for columns beyond viewport. Action links stack vertically. |
| Mobile | < 1024px | Sidebar hidden behind hamburger menu. Content padding at 16px. Table converts to card-list layout (each row becomes a stacked card). Pagination simplifies to prev/next only. Header breadcrumb truncates to current page only. |

### Touch Targets
- Action links: minimum 14px text height with generous click padding — effectively ~25px tall clickable area.
- Pagination buttons: 30px × 30px minimum (number buttons) and 57px × 30px (prev/next). Above WCAG AAA minimum.
- Tab items: 54px total height with inline padding — effectively ~52px × 34px clickable area per tab.
- Sidebar nav items: 24px icon + 20px label with 10px gap — ~54px tall clickable area per item.
- Outline button (发票申请): 32px height × 87px width — above WCAG AA minimum.

### Collapsing Strategy
- Sidebar collapses from text + icon labels to icon-only at 60px below 1440px.
- Content area horizontal padding reduces from 140px → 80px → 40px → 16px at each breakpoint.
- Data table adds horizontal scroll when column widths exceed viewport; never truncates or hides columns.
- Action links in the operations column remain inline until below 1280px, then stack vertically with reduced gap.
- Pagination maintains all number buttons until below 768px, then simplifies to prev/next only.

## Known Gaps

- **Hover state colors:** Intentionally documented as a general principle rather than exact hex values — precise hover tokens should be extracted from interactive prototypes.
- **Loading states / skeleton screens:** Not visible on the extracted surfaces. The current implementation shows static data; skeleton loading patterns for table rows should be defined.
- **Empty states:** Not captured — the "no orders" or "no invoices" empty state illustrations and messaging need separate documentation.
- **Modal dialogs:** The Figma file focuses on the main list views. Modal patterns (invoice detail, payment confirmation, share permission dialog) are not covered here.
- **Toast notifications:** Success/error feedback after actions (receipt download, payment, order cancellation) is not documented.
- **"发票管理" (Invoice Management) tab content:** Only the "订单管理" (Order Management) tab was fully rendered. The invoice tab's table schema and status variants need separate extraction.
- **Sub-navigation within pages:** Some pages may have secondary navigation beyond the top-level tabs; this was not visible in the captured surfaces.
- **Color palette for data visualization:** The 报表 (Reports) page likely includes chart colors not documented here.
- **Sidebar collapse animation:** The transition between full and icon-only sidebar states is not specified.
- **Pricing / landing page components:** Added 2026-05-09: `pricing-card-free`, `pricing-card-pro`, `recommend-badge`, `button-primary-filled`, `hero-section`, `stat-item`, `feature-card`, `feature-tag`, `cta-banner`, `trust-card`, `comparison-section` — see the Landing Page Components and Pricing Cards sections above.
