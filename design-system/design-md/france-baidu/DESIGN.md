---
version: alpha
name: Baidu Finance
description: A clean, data-driven financial portal anchored on a white canvas and Baidu Blue (#2932e1), the single brand voltage that carries every primary CTA, stock ticker highlight, and navigation active state. Type runs system fonts (PingFang SC, Microsoft YaHei, -apple-system) at modest weights — display sits at 24–32px in weight 500/600 rather than the heavy 700+ that fintech dashboards use; the brand trusts charts and tabular data over typographic muscle. Four primary sections (要闻, 股票, 基金, 理财) sit in the top nav with minimal icons and "热点" badges, signaling a news-driven marketplace rather than a feature dump. Rectangular search bars (`{rounded.sm}`), sharply edged news cards (`{rounded.none}`), and 4px button radii read as professional and efficient — there is no soft corner anywhere except the body grid.

colors:
  primary: "#2932e1"
  primary-active: "#1e27b5"
  primary-disabled: "#d3d6f8"
  primary-error-text: "#d93025"
  primary-error-text-hover: "#b3261e"
  up: "#e60012"
  down: "#009966"
  ink: "#1a1a1a"
  body: "#333333"
  muted: "#666666"
  muted-soft: "#999999"
  hairline: "#e5e5e5"
  hairline-soft: "#f0f0f0"
  border-strong: "#c1c1c1"
  canvas: "#ffffff"
  surface-soft: "#f7f8fa"
  surface-card: "#ffffff"
  surface-strong: "#f2f3f5"
  on-primary: "#ffffff"
  on-dark: "#ffffff"
  legal-link: "#2932e1"
  star-rating: "#ffaa00"
  scrim: "#000000"

typography:
  display-xl:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', -apple-system, system-ui, Roboto, 'Helvetica Neue', sans-serif"
    fontSize: 32px
    fontWeight: 700
    lineHeight: 1.25
    letterSpacing: -0.5px
  display-lg:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 28px
    fontWeight: 600
    lineHeight: 1.28
    letterSpacing: -0.4px
  display-md:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 24px
    fontWeight: 700
    lineHeight: 1.33
    letterSpacing: -0.3px
  display-sm:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 20px
    fontWeight: 600
    lineHeight: 1.35
    letterSpacing: -0.2px
  title-md:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 18px
    fontWeight: 600
    lineHeight: 1.4
    letterSpacing: 0
  title-sm:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 16px
    fontWeight: 500
    lineHeight: 1.4
    letterSpacing: 0
  rating-display:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 48px
    fontWeight: 700
    lineHeight: 1.1
    letterSpacing: -1px
  body-md:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 16px
    fontWeight: 400
    lineHeight: 1.6
    letterSpacing: 0
  body-sm:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 14px
    fontWeight: 400
    lineHeight: 1.5
    letterSpacing: 0
  caption:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 14px
    fontWeight: 500
    lineHeight: 1.4
    letterSpacing: 0
  caption-sm:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 12px
    fontWeight: 400
    lineHeight: 1.4
    letterSpacing: 0
  badge:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 12px
    fontWeight: 600
    lineHeight: 1.2
    letterSpacing: 0
  micro-label:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 12px
    fontWeight: 700
    lineHeight: 1.3
    letterSpacing: 0
  uppercase-tag:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 10px
    fontWeight: 700
    lineHeight: 1.2
    letterSpacing: 0.5px
    textTransform: uppercase
  button-md:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 16px
    fontWeight: 500
    lineHeight: 1.25
    letterSpacing: 0
  button-sm:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 14px
    fontWeight: 500
    lineHeight: 1.3
    letterSpacing: 0
  link:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 14px
    fontWeight: 400
    lineHeight: 1.5
    letterSpacing: 0
  nav-link:
    fontFamily: "'PingFang SC', 'Microsoft YaHei', sans-serif"
    fontSize: 16px
    fontWeight: 600
    lineHeight: 1.25
    letterSpacing: 0

rounded:
  none: 0px
  xs: 2px
  sm: 4px
  md: 8px
  lg: 12px
  xl: 16px
  card: 24px
  full: 9999px

spacing:
  xxs: 2px
  xs: 4px
  sm: 8px
  md: 12px
  base: 16px
  lg: 24px
  xl: 32px
  xxl: 48px
  section: 56px

components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.button-md}"
    rounded: "{rounded.sm}"
    padding: 12px 20px
    height: 40px
  button-primary-active:
    backgroundColor: "{colors.primary-active}"
    textColor: "{colors.on-primary}"
    rounded: "{rounded.sm}"
  button-primary-disabled:
    backgroundColor: "{colors.primary-disabled}"
    textColor: "{colors.on-primary}"
    rounded: "{rounded.sm}"
  button-secondary:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    typography: "{typography.button-md}"
    rounded: "{rounded.sm}"
    padding: 11px 19px
    height: 40px
  button-tertiary-text:
    backgroundColor: transparent
    textColor: "{colors.ink}"
    typography: "{typography.button-md}"
  button-pill-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.button-sm}"
    rounded: "{rounded.full}"
    padding: 8px 16px
  search-input:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    typography: "{typography.body-sm}"
    rounded: "{rounded.sm}"
    padding: 8px 12px
    height: 36px
  icon-button-square:
    backgroundColor: "{colors.surface-strong}"
    textColor: "{colors.ink}"
    rounded: "{rounded.sm}"
    height: 32px
  icon-button-outline:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    rounded: "{rounded.sm}"
    height: 36px
  top-nav:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    typography: "{typography.nav-link}"
    height: 64px
  product-tab-active:
    backgroundColor: transparent
    textColor: "{colors.primary}"
    typography: "{typography.nav-link}"
    rounded: "{rounded.none}"
  product-tab-inactive:
    backgroundColor: transparent
    textColor: "{colors.muted}"
    typography: "{typography.nav-link}"
  search-bar-rect:
    backgroundColor: "{colors.surface-soft}"
    textColor: "{colors.muted}"
    typography: "{typography.body-sm}"
    rounded: "{rounded.sm}"
    padding: 8px 12px
    height: 40px
  search-field-segment:
    backgroundColor: transparent
    textColor: "{colors.ink}"
    typography: "{typography.caption}"
    padding: 6px 12px
  category-strip:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.muted}"
    typography: "{typography.button-sm}"
  category-tab-active:
    backgroundColor: transparent
    textColor: "{colors.primary}"
    typography: "{typography.button-sm}"
    rounded: "{rounded.none}"
  news-card:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    typography: "{typography.body-sm}"
    rounded: "{rounded.none}"
  news-card-photo:
    rounded: "{rounded.sm}"
  stock-card:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    typography: "{typography.title-md}"
    rounded: "{rounded.sm}"
  finance-card:
    backgroundColor: "{colors.canvas}"
    textColor: "{colors.ink}"
    typography: "{typography.title-sm}"
  rating-display-card:
    backgroundColor: transparent
    textColor: "{colors.ink}"
    typography: "{typography.rating-display}"
  hot-tag:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.badge}"
    rounded: "{rounded.sm}"
    padding: 2px 6px
  new-tag:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.uppercase-tag}"
    rounded: "{rounded.sm}"
    padding: 2px 6px
  up-indicator:
    backgroundColor: transparent
    textColor: "{colors.up}"
    typography: "{typography.body-sm}"
  down-indicator:
    backgroundColor: transparent
    textColor: "{colors.down}"
    typography: "{typography.body-sm}"
  data-table-row:
    backgroundColor: transparent
    textColor: "{colors.ink}"
    typography: "{typography.body-md}"
    padding: 8px 0
  reviews-card:
    backgroundColor: transparent
    textColor: "{colors.ink}"
    typography: "{typography.body-sm}"
  footer-light:
    backgroundColor: "{colors.surface-soft}"
    textColor: "{colors.muted}"
    typography: "{typography.body-sm}"
    padding: 32px 48px
  footer-link:
    backgroundColor: transparent
    textColor: "{colors.ink}"
    typography: "{typography.body-sm}"
  legal-band:
    backgroundColor: "{colors.surface-soft}"
    textColor: "{colors.muted}"
    typography: "{typography.caption-sm}"
---

## Overview

Baidu Finance is the canonical example of a clean, data-driven financial news portal. The base canvas is **pure white** (`{colors.canvas}` — #ffffff) with deep near-black ink (`{colors.ink}` — #1a1a1a) for headlines and body, and a single voltage of **Baidu Blue** (`{colors.primary}` — #2932e1) carrying every primary CTA, navigation active state, and hot tags. There is no secondary brand color in mainline finance — the **red** (`{colors.up}` — #e60012) and **green** (`{colors.down}` — #009966) tokens are strictly used for stock price movements (up/down indicators) and never for primary CTAs.

Type runs system fonts (`PingFang SC`, `Microsoft YaHei`, `-apple-system`, `system-ui`, `Roboto`, `'Helvetica Neue'`, sans-serif), with `PingFang SC` as the primary Chinese‑language fallback. Type sits at modest weights — display headlines render at 24–32px in weight 500–700, not the heavy 700+ weights that enterprise financial dashboards lean on. The hero h1 ("财经资讯一手掌握") on the homepage is just 32px / 700, which feels appropriately sized for a news portal; the layout leans on news cards, stock tickers, and charts for visual weight rather than typographic muscle.

The shape language is **sharp**. Buttons are 4px radius (`{rounded.sm}`), news cards are unrounded (`{rounded.none}`), the search bar is rectangular with 4px radius, and indicators are simple squares or text with no rounding. There is essentially no soft corner anywhere except the body grid itself — every interactive element is efficiently squared.

**Key Characteristics**

- Single accent color: `{colors.primary}` (#2932e1 — "Baidu Blue") carries every primary CTA, the search button, the hot tag background, and the brand wordmark. Used scarcely — most pages are 90% white + ink with one or two blue moments.
- System type stack: `PingFang SC`, `Microsoft YaHei`, and a system fallback. Display weights sit at 500–700, body at 400. Modest weight is intentional — the system trusts charts and tabular data for visual heft.
- Four-section top nav: 要闻, 股票, 基金, 理财 — each with a minimal icon (news, stock, fund, wealth) and "热点" badges (`{component.hot-tag}`) on the top news tab. Active tab uses a blue underline rule (`{component.product-tab-active}`).
- Rectangular global search bar: light gray surface (`{colors.surface-soft}`), slightly rounded (`{rounded.sm}`), divided by 1px hairlines into search field and a blue search button.
- News cards are text-first: unrounded rectangles with a headline, short summary, and a small thumbnail (`{component.news-card-photo}`) on the left — no floating badges, no wishlist hearts.
- Stock cards (table rows) are data-first: stock name, current price, and a color‑coded up/down indicator (`{component.up-indicator}` / `{component.down-indicator}`) with percentage change.
- Editorial dropdowns (footer, language picker) are clean text columns over the white canvas — no card surface, no shadow.
- The design system caps elevation at one shadow tier (`box-shadow: rgba(0,0,0,0.05) 0 2px 8px 0`) — used on hover‑floated cards and search/account dropdowns.
- 8px base spacing system, with major sections at `{spacing.section}` (56px) — tighter than consumer marketplaces because the portal wants higher information density per scroll.

# Colors

## Brand & Accent

- **Baidu Blue** (`{colors.primary}` — #2932e1): The single brand color. Used for primary CTA backgrounds (搜索, 查看详情), the search button, hot tags, and inline brand links. The most recognizable color in Baidu's financial ecosystem.
- **Baidu Blue Active** (`{colors.primary-active}` — #1e27b5): The press / pointer-down variant — slightly darker. Used on `{component.button-primary-active}`.
- **Baidu Blue Disabled** (`{colors.primary-disabled}` — #d3d6f8): A pale tint used on disabled CTAs.
- **Up Red** (`{colors.up}` — #e60012): Strict stock‑price upward movement indicator. Used only for positive price changes.
- **Down Green** (`{colors.down}` — #009966): Strict stock‑price downward movement indicator. Used only for negative price changes.

## Surface

- **Canvas** (`{colors.canvas}` — #ffffff): The default page floor for every public page. Baidu Finance does not have a dark mode on the public web.
- **Surface Soft** (`{colors.surface-soft}` — #f7f8fa): The lightest fill — used on search bar backgrounds, sub‑nav hover backgrounds, and the inline filter band.
- **Surface Strong** (`{colors.surface-strong}` — #f2f3f5): Slightly heavier fill — circular icon‑button surface (e.g., the breadcrumb back‑arrow and listing toolbar buttons).

## Hairlines & Borders

- **Hairline** (`{colors.hairline}` — #e5e5e5): The default 1px border tone — search bar dividers, table separators, footer column splitters, card 1px borders.
- **Hairline Soft** (`{colors.hairline-soft}` — #f0f0f0): A lighter divider used on long‑scrolling news body separators.
- **Border Strong** (`{colors.border-strong}` — #c1c1c1): A heavier stroke used on disabled outline buttons and form input outlines after focus.

## Text

- **Ink** (`{colors.ink}` — #1a1a1a): The dominant text color on light surfaces. Display headlines, body paragraphs, primary nav links, and most inline link text. Never pure black.
- **Body** (`{colors.body}` — #333333): A secondary running‑text color used inside long‑form article copy and stock descriptions where ink would feel too heavy.
- **Muted** (`{colors.muted}` — #666666): Sub‑titles inside news cards ("财经新闻", "股市快讯"), inactive product‑tab labels, footer category sub‑labels, "更多" links.
- **Muted Soft** (`{colors.muted-soft}` — #999999): Disabled link text. Used very sparingly.
- **Star Rating** (`{colors.star-rating}` — #ffaa00): Yellow‑gold icon for financial product ratings (funds, wealth management). Used only inside rating displays.
- **On Primary** (`{colors.on-primary}` — #ffffff): White text on Baidu Blue CTAs.

## Semantic

- **Error** (`{colors.primary-error-text}` — #d93025): Inline error text for form validation. Distinct from Baidu Blue — a standard error red.
- **Error Hover** (`{colors.primary-error-text-hover}` — #b3261e): Darkens on link hover.
- **Legal Link Blue** (`{colors.legal-link}` — #2932e1): Inline links inside legal copy (Privacy, Terms). Uses the primary brand color.

## Scrim

- **Scrim** (`{colors.scrim}` — #000000 at 50% opacity): The global modal backdrop tone — date picker, login dialog, language picker. Stored as the base hex; opacity is applied at render time.

# Typography

## Font Family

The system runs `PingFang SC` (for Chinese) and `Microsoft YaHei` (Windows fallback) for everything — display, body, navigation, captions, microcopy. Fallbacks walk `-apple-system, system-ui, Roboto, "Helvetica Neue", sans-serif`. `PingFang SC` is the primary Chinese typeface; `Microsoft YaHei` is the historic in‑house fallback for Windows.

There is no separate display family. The system stack carries the entire scale.

## Hierarchy

| Token | Size | Weight | Line Height | Letter Spacing | Use |
|-------|------|--------|-------------|----------------|-----|
| `{typography.rating-display}` | 48px | 700 | 1.1 | -1px | Fund/wealth product rating display ("4.8") |
| `{typography.display-xl}` | 32px | 700 | 1.25 | -0.5px | Homepage h1 ("财经资讯一手掌握") |
| `{typography.display-lg}` | 28px | 600 | 1.28 | -0.4px | News article h1 ("A股三大指数全线翻红") |
| `{typography.display-md}` | 24px | 700 | 1.33 | -0.3px | Section heads inside news detail ("今日热点") |
| `{typography.display-sm}` | 20px | 600 | 1.35 | -0.2px | Sub‑section titles ("机构观点") |
| `{typography.title-md}` | 18px | 600 | 1.4 | 0 | Stock card names ("贵州茅台", "腾讯控股") |
| `{typography.title-sm}` | 16px | 500 | 1.4 | 0 | Footer column heads ("关于百度", "帮助中心") |
| `{typography.body-md}` | 16px | 400 | 1.6 | 0 | Default running‑text inside news copy |
| `{typography.body-sm}` | 14px | 400 | 1.5 | 0 | Card meta lines, dates, prices, distance text |
| `{typography.caption}` | 14px | 500 | 1.4 | 0 | Search field segment labels ("搜索", "股票代码") |
| `{typography.caption-sm}` | 12px | 400 | 1.4 | 0 | Footer legal line ("© 2026 Baidu Finance") |
| `{typography.badge}` | 12px | 600 | 1.2 | 0 | "热点" floating badge text |
| `{typography.micro-label}` | 12px | 700 | 1.3 | 0 | Stock minute‑change micro‑labels ("+2.3%") |
| `{typography.uppercase-tag}` | 10px | 700 | 1.2 | 0.5px (uppercase) | "NEW" badge on finance product tabs |
| `{typography.button-md}` | 16px | 500 | 1.25 | 0 | Primary CTA button labels |
| `{typography.button-sm}` | 14px | 500 | 1.3 | 0 | Pill button labels (category strip) |
| `{typography.link}` | 14px | 400 | 1.5 | 0 | Inline body links |
| `{typography.nav-link}` | 16px | 600 | 1.25 | 0 | Top product‑nav labels (要闻, 股票, 基金, 理财) |

## Principles

Display weights stay modest. The homepage h1 at 32px / 700 is quiet — it tucks under the search bar so news cards and stock tickers carry visual hierarchy. The news‑article h1 at 28px / 600 is even quieter; the article image banner does the work above it.

The single typographically loud moment in the entire system is the **rating display** (`{typography.rating-display}` — 48px / 700) on fund and wealth management product pages. That is the only place the system trusts type alone to carry hierarchy — rating numbers are a peak trust signal, so they get the loudest treatment.

## Note on Font Substitutes

If `PingFang SC` and `Microsoft YaHei` are unavailable, **Noto Sans SC** is the closest open‑source substitute. Adjust display headlines down by ~2% in line‑height to match PingFang's slightly tighter cap height; otherwise the proportions transfer cleanly.

# Layout

## Spacing System

- **Base unit:** 4px (with 2px micro‑step).
- **Tokens:** `{spacing.xxs}` 2px · `{spacing.xs}` 4px · `{spacing.sm}` 8px · `{spacing.md}` 12px · `{spacing.base}` 16px · `{spacing.lg}` 24px · `{spacing.xl}` 32px · `{spacing.xxl}` 48px · `{spacing.section}` 56px.
- **Section padding (vertical):** `{spacing.section}` (56px) for major page bands; tighter than typical consumer marketplaces (64–80px) because news portals need higher information density per scroll.
- **Card internal padding:** `{spacing.base}` (16px) for news card meta block; `{spacing.sm}` (8px) for stock table row gutters.
- **Gutters:** `{spacing.base}` (16px) between news cards in the homepage grid; `{spacing.lg}` (24px) inside footer column gutters; `{spacing.xs}` (4px) on dense category‑strip dividers.

## Grid & Container

- **Max content width:** ~1200px centered on the homepage and news landing pages. Stock detail pages cap closer to 1000px to keep the stock chart and sidebar readable.
- **News grid (homepage):** 4‑column grid at desktop with each cell housing a headline, summary, and thumbnail.
- **Stock detail:** 2‑column with stock chart / news body on the left (~70% width) and a sticky quote card (`{component.stock-card}`) on the right (~30%).
- **Footer:** 3‑column link list (关于百度 / 帮助中心 / 财经产品) at desktop, collapsing to 1‑column on mobile.

## Whitespace Philosophy

The system gives editorial bands 56px of vertical breathing room but compresses news grids — news cards sit just 16px apart. The contrast is intentional: the page reads as "clean hero, dense news below," reinforcing the information‑first nature without overwhelming the visitor at the fold.

# Elevation

The system has essentially **one shadow tier** plus the flat baseline.

- **Flat (no shadow):** Body, hero, footer, all editorial bands — 95% of surfaces.
- **Card hover float:** `box-shadow: rgba(0, 0, 0, 0.05) 0 2px 8px 0` — applied to news cards on pointer hover, the search bar at rest, and the dropdown menus (account menu, language picker, date picker). This is the single shadow definition in the entire system.
- **Modal scrim:** `{colors.scrim}` rendered at 50% opacity — the global modal backdrop. Used on login dialogs, language picker.

There are no progressive elevation tiers — the system either has the one shadow or none. Depth comes from clean separators, 1px hairlines, and efficient tabular layouts rather than from layered shadows.

# Components

## Buttons

**`button-primary`** — Baidu Blue fill, white text, 4px radius, 12×20px padding, 40px height, weight 500. The most common CTA across the system: "搜索", "查看详情", "订阅", account‑flow primaries.

**`button-primary-active`** — The press state. Background flips to `{colors.primary-active}`. No transform, no shadow change.

**`button-primary-disabled`** — Pale Baidu Blue tint at #d3d6f8 with white text. Cursor not‑allowed.

**`button-secondary`** — White fill with ink text and a 1px ink outline. 4px radius. Used for "取消", "返回", and inverse CTAs over Baidu Blue surfaces.

**`button-tertiary-text`** — Plain ink text, no surface, no border. Underlined on hover. Used for "更多" type links and modal close labels.

**`button-pill-primary`** — A pill‑shaped Baidu Blue CTA used on featured cells (e.g., "立即开户" sub‑CTA) — 9999px radius, 8×16px padding, 14px label.

## Search Surface

**`search-bar-rect`** — The standard global search bar. Light gray fill (`{colors.surface-soft}`), 4px radius, 40px height, 1px hairline border. Internally divided by vertical hairline rules into `{component.search-field-segment}` cells (search input area + a blue search button). Each segment holds a placeholder line in `{typography.body-sm}`.

**`search-input`** — The input field within the search bar. White background, 4px radius, 36px height, 8×12px padding. Typography `{typography.body-sm}`.

## Top Navigation

**`top-nav`** — White surface, 64px height, 1px bottom hairline. The Baidu Finance wordmark sits flush left, the four product tabs (要闻 / 股票 / 基金 / 理财) sit in the dead center, and account utilities (login, subscribe, menu) sit flush right.

**`product-tab-active`** — Baidu Blue label in `{typography.nav-link}`, 24px minimal icon, 2px blue underline rule beneath the icon‑label pair.

**`product-tab-inactive`** — Muted label, icon, no underline. Becomes active on click.

**`hot-tag`** — A tiny rounded‑rect badge (`{rounded.sm}`) anchored top‑right of a tab icon, carrying the label "热点" in `{typography.badge}` (12px / 600). Used on 要闻 tab to signal breaking news.

## News Cards

**`news-card`** — A text‑first card. Unrounded rectangle (`{rounded.none}`) with a headline (`{typography.title-md}`), 2‑line summary (`{typography.body-sm}`), and a small thumbnail (`{component.news-card-photo}`) on the left. No floating badges, no wishlist hearts. Everything is efficient and informational.

**`news-card-photo`** — The photo plate itself, separated as a token with `{rounded.sm}` rounding to soften the image edge — the only soft spot in the card.

## Stock & Finance Cards

**`stock-card`** — A data‑first card. Light gray surface (`{colors.surface-soft}`), `{rounded.sm}` rounding, 16px padding. Contains: stock name (`{typography.title-md}`), current price (`{typography.display-sm}`), and a color‑coded up/down indicator (`{component.up-indicator}` or `{component.down-indicator}`) with percentage change.

**`finance-card`** — A simpler card for wealth management products. White surface, `{rounded.sm}` rounding, 12px padding. Contains: product name, expected annualized yield, and a "立即购买" primary CTA.

**`up-indicator`** — Red text (`{colors.up}`) in `{typography.body-sm}`. Prefixes a '+' sign for positive price changes. Used inside stock cards and data tables.

**`down-indicator`** — Green text (`{colors.down}`) in `{typography.body-sm}`. Prefixes a '−' sign for negative price changes. Used inside stock cards and data tables.

## Data Tables

**`data-table-row`** — A 1‑column row with a stock name (`{typography.body-md}`), price, and up/down indicator. 8px row padding, separated by 1px hairline dividers. Used in stock list pages and watchlist sections.

## Footer

**`footer-light`** — Light gray surface (`{colors.surface-soft}`), 32×48px padding. Three columns of link blocks (关于百度 / 帮助中心 / 财经产品), separated by 24px gutters. Each column heads with a `{typography.title-sm}` ink label and stacks `{component.footer-link}` rows in `{typography.body-sm}` ink.

**`legal-band`** — A bottom strip beneath the footer columns carrying the copyright line, language picker (globe icon + "简体中文" link), and social icons (WeChat, Weibo). All text in muted `{colors.muted}` at `{typography.caption-sm}`.

# Responsive Behavior

| Name | Width | Key Changes |
|------|-------|--------------|
| Mobile | < 744px | Top nav collapses to logo + hamburger; product tabs hide behind a sheet; search bar collapses to a single tappable rectangle; news cards stack 1‑up; stock list collapses to a minimal table with only name and price; footer collapses to 1‑column. |
| Tablet | 744–1128px | Top nav keeps product tabs but search bar narrows; news cards 2‑up; stock cards 2‑up; footer 2‑column. |
| Desktop | 1128–1440px | Full top nav with four product tabs centered; search bar at full rectangular width; news cards 4‑up; stock cards 3‑up; footer 3‑column. |
| Wide | > 1440px | Content width caps at 1440px on stock/search pages and ~1200px on editorial; gutters absorb the rest. |

## Touch Targets

- Primary CTAs at minimum 40×40px (above WCAG AA).
- Search input is 36×36px — borderline but compensated by a generous 12px padding inside the search bar.
- Up/down indicators are text‑based with 16px minimum height — no separate tap target.
- Stock card rows are 48px tall (row height includes padding) — comfortable for tapping.

## Collapsing Strategy

- Top product tabs collapse into a hamburger sheet below 744px.
- Search bar collapses into a single‑tap entry that opens a full‑screen search overlay on mobile.
- News and stock grids drop column counts cleanly at each breakpoint — never reflow rows; always reduce columns.

# Known Gaps

- **Hover state colors:** intentionally not documented per the global no‑hover policy — Baidu Finance's actual `:hover` styling for news cards is a subtle elevation lift, but precise extraction is unreliable.
- **Loading states / skeleton screens:** not visible on the extracted surfaces.
- **Chart view styling:** the stock detail chart uses custom SVG rendering with Baidu Blue and red/green indicators; not captured here.
- **Form input error states:** error text color (`{colors.primary-error-text}`) is documented, but the full input outline + helper‑text combination on validation failure was not visible in the captured surfaces.
- **Sub‑brand palettes:** There are no sub‑brands — Baidu Finance uses a single brand palette.

# New France Customizations

Adaptations made for the New France 尾盘涨停选股系统 project:

## Card Border Radius

All card components use `{rounded.card}` (24px) instead of the default Baidu Finance `{rounded.sm}` (4px):
- `.panel`, `.metric-card`, `.rec-card` — 24px border-radius
- Buttons, inputs, tags keep `{rounded.sm}` (4px)

## Data Table Row Height

All table rows are unified at 44px height (`height: 44px; vertical-align: middle`) for visual consistency across pages. Exception: recommendation cards on the 推荐结果 page use a card layout, not tables.

| Element | Height |
|---------|--------|
| `.data-table td` | 44px |
| `.data-table th` | 36px |

## Button Spacing

Action buttons inside panels (e.g., 保存配置) require explicit margin:
- `margin-left: 20px; margin-bottom: 20px` to separate from form content above

## API Integration

Backend API endpoints used by the frontend:
- `GET /api/v1/system/health` — health check
- `GET /api/v1/system/status` — system trading status
- `POST /api/v1/system/test-email` — send test email
- `POST /api/v1/screening/run` — trigger manual screening run
- `GET /api/v1/watchlist` — fetch watchlist data
- `GET /api/v1/screening/latest` — fetch latest recommendations
