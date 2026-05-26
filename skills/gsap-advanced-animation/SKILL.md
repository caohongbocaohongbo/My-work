---
name: gsap-advanced-animation
description: 全球顶级GSAP动效还原，Awwwards级别卷轴动效、时间轴动画、滚动触发动效，适用于微交互和组件动效设计转代码
---

# GSAP 高级动效 设计转代码

## 适用场景

- 品牌官网动效
- 作品集展示
- 高端H5页面
- 滚动视差动效
- 微交互动效
- 组件状态动效
- Awwwards级别网页动效

## 触发关键词

GSAP动效、滚动动画、时间轴动效、Awwwards动效、微交互、组件过渡、Loading动画、Hover效果、页面转场

## 核心实操规范

### 1. 滚动触发 (ScrollTrigger)
- 精准绑定滚动动效到视口位置
- 支持 scrub 平滑滚动绑定
- 支持 pin 固定定位动画
- 支持 section 区间动画

```javascript
gsap.registerPlugin(ScrollTrigger);

gsap.to(".element", {
  scrollTrigger: {
    trigger: ".element",
    start: "top bottom",
    end: "bottom top",
    scrub: true,
    markers: false
  },
  y: -100,
  opacity: 0
});
```

### 2. 时间轴控制 (Timeline)
- 多动画序列同步执行
- 精确控制动画顺序和时长
- 支持相对和绝对定位
- 支持动画嵌套

```javascript
const tl = gsap.timeline();

tl.to(".box1", { x: 100, duration: 1 })
  .to(".box2", { y: 50, duration: 0.5 }, "-=0.5")
  .to(".box3", { rotation: 360, duration: 1 }, "-=0.3");
```

### 3. 微交互动效

#### 按钮Hover效果
```javascript
gsap.to(".btn", {
  scale: 1.05,
  duration: 0.3,
  ease: "power2.out"
});
```

#### 卡片悬停效果
```javascript
document.querySelectorAll(".card").forEach(card => {
  card.addEventListener("mouseenter", () => {
    gsap.to(card, {
      y: -10,
      boxShadow: "0 20px 40px rgba(0,0,0,0.15)",
      duration: 0.4
    });
  });
  card.addEventListener("mouseleave", () => {
    gsap.to(card, {
      y: 0,
      boxShadow: "0 4px 6px rgba(0,0,0,0.1)",
      duration: 0.4
    });
  });
});
```

#### 图标动画
```javascript
const iconTl = gsap.timeline({ paused: true });
iconTl.to(".icon", { rotation: 90, scale: 1.2, duration: 0.3 })
      .to(".icon", { rotation: 0, scale: 1, duration: 0.2 });

document.querySelector(".trigger").addEventListener("mouseenter", () => iconTl.play());
document.querySelector(".trigger").addEventListener("mouseleave", () => iconTl.reverse());
```

### 4. 页面转场动效

```javascript
const pageTransition = gsap.timeline();
pageTransition.from(".page-content", { opacity: 0, y: 50, duration: 0.6 })
               .from(".page-content h1", { opacity: 0, x: -30, duration: 0.5 }, "-=0.3")
               .from(".page-content p", { opacity: 0, stagger: 0.1, duration: 0.4 }, "-=0.2");
```

### 5. Loading动画

```javascript
const loadingTl = gsap.timeline({ repeat: -1 });
loadingTl.to(".loader", { width: "100%", duration: 1.5, ease: "power2.inOut" })
         .to(".loader", { opacity: 0, duration: 0.3 })
         .set(".loader", { width: 0, opacity: 1 });
```

### 6. 数字滚动动画

```javascript
gsap.to(".counter", {
  scrollTrigger: {
    trigger: ".counter",
    start: "top 80%"
  },
  innerText: 10000,
  duration: 2,
  snap: { innerText: 1 },
  format: { formatter: (value) => Math.round(value).toLocaleString() }
});
```

### 7. 视差滚动效果

```javascript
gsap.to(".parallax-bg", {
  scrollTrigger: {
    trigger: ".parallax-section",
    start: "top bottom",
    end: "bottom top",
    scrub: true
  },
  y: -100,
  ease: "none"
});

gsap.to(".parallax-text", {
  scrollTrigger: {
    trigger: ".parallax-section",
    start: "top bottom",
    end: "bottom top",
    scrub: 1.5
  },
  y: -50,
  ease: "none"
});
```

## 性能优化标准

1. **60fps保证**：所有动画必须保持60帧每秒
2. **硬件加速**：使用 transform 和 opacity 触发GPU加速
3. **will-change**：适当使用 will-change 提示浏览器优化
4. **避免动画回流**：不动画 layout 属性（width, height, top, left等）
5. **debounce/throttle**：滚动事件配合防抖节流
6. **移动端优化**：减少动画复杂度，使用低功耗属性

```css
.animated-element {
  will-change: transform, opacity;
  backface-visibility: hidden;
}

.optimized-animation {
  transform: translateZ(0);
  gpu-acceleration: true;
}
```

## 动效复原标准

完全匹配Figma/Sketch动效参数：
- 缓动曲线（ease）精确对应
- 持续时间（duration）毫秒级精确
- 延迟时间（delay）按需设置
- 动画属性完全一致

### 常用缓动曲线对照

| Figma/Sketch | GSAP |
|--------------|------|
| ease-in | power2.in |
| ease-out | power2.out |
| ease-in-out | power2.inOut |
| linear | none |
| spring | elastic.out(1, 0.5) |

## 组件动效库

### 1. 折叠/展开
```javascript
gsap.to(".content", {
  height: "auto",
  duration: 0.4,
  ease: "power2.out"
});
```

### 2. 标签页切换
```javascript
gsap.to(".tab-content", {
  opacity: 0,
  y: 10,
  duration: 0.2,
  onComplete: () => {
    gsap.to(".new-tab-content", {
      opacity: 1,
      y: 0,
      duration: 0.3
    });
  }
});
```

### 3. 模态框
```javascript
const modalTl = gsap.timeline();
modalTl.to(".modal-backdrop", { opacity: 0.5, duration: 0.3 })
       .from(".modal-content", { scale: 0.8, opacity: 0, duration: 0.4 }, "-=0.1")
       .from(".modal-close", { opacity: 0, duration: 0.2 }, "-=0.2");
```

### 4. 工具提示
```javascript
gsap.to(".tooltip", {
  opacity: 1,
  y: -5,
  duration: 0.2,
  ease: "power2.out"
});
```

### 5. 进度条
```javascript
gsap.to(".progress-bar", {
  width: "100%",
  duration: 1.5,
  ease: "power2.inOut"
});
```

## 技术栈

- GSAP 3+
- ScrollTrigger
- JavaScript ES6+
- CSS3 Transitions/Animations
- requestAnimationFrame

## 关键标准

1. **顶级视觉质感**：Awwwards级别动效体验
2. **跨端无卡顿**：桌面端、移动端均保持60fps
3. **还原设计动效**：精确匹配设计稿参数
4. **可访问性兼容**：尊重 prefers-reduced-motion
5. **代码规范清晰**：模块化、可维护、易扩展

## 使用建议

1. 在需要使用GSAP的页面引入CDN或npm包
2. 注册所需插件（ScrollTrigger等）
3. 按组件或页面模块划分动画逻辑
4. 使用数据属性或类名绑定触发器
5. 开发环境开启 markers 调试，生产环境关闭

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/ScrollTrigger.min.js"></script>
```

或使用npm：

```bash
npm install gsap
```

```javascript
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);
```