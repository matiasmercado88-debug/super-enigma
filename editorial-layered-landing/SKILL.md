---
name: editorial-layered-landing
description: >-
  Improve an existing static website into a premium editorial landing page with layered
  composition, large typography, floating visual elements, subtle scroll animations,
  responsive layouts, and clean maintainable code — without rebuilding from scratch. Use
  when asked to improve an existing static landing page, make a site feel more premium,
  editorial, creative, or contemporary, add layered visual composition like modern creative
  studio websites, add subtle scroll animations, improve hero/service/case-grid/CTA
  sections, rework a static site without changing its tech stack, or make a site feel less
  generic, less SaaS-like, or less templated. Do NOT use for a full web app with backend
  logic, ecommerce functionality, a dashboard/login/database/complex interactivity, a site
  that must stay pixel-identical, a minimal technical fix only, copying another website
  exactly, or a project needing a full brand identity built from zero.
---

# Editorial Layered Landing

## Goal

Improve an existing static website into a premium editorial landing page with layered composition, large typography, floating visual elements, subtle scroll animations, responsive layouts, and clean maintainable code.

Do not rebuild from scratch unless necessary. Preserve the current stack and brand intent.

## Use when

Use this skill when the user asks to:

- Improve an existing static landing page.
- Make a website feel more premium, editorial, creative, or contemporary.
- Add layered visual composition similar to modern creative studio websites.
- Add subtle scroll animations.
- Improve hero sections, service sections, case grids, portfolios, or CTAs.
- Rework a static site without changing the whole technology stack.
- Use an existing website as the base for a stronger visual direction.
- Make a site feel less generic, less SaaS-like, or less templated.

## Do not use when

Do not use this skill when:

- The user wants a full web app with backend logic.
- The user wants ecommerce functionality.
- The user asks for dashboard, login, user accounts, database, or complex interactivity.
- The existing site must remain pixel-identical.
- The user explicitly asks for a minimal technical fix only.
- The user asks to copy another website exactly.
- The project requires a complete brand identity from zero before touching the website.

## Core rules

- Preserve the existing stack.
- Do not add unnecessary frameworks.
- Do not copy external websites, assets, code, or exact layouts.
- Use references only for design logic.
- Keep the site static, lightweight, responsive, accessible, and maintainable.
- Avoid generic templates, childish icons, excessive animation, and visual noise.
- Respect `prefers-reduced-motion`.

## First step: audit before editing

Before modifying code, inspect the project and produce a short implementation plan.

Review:

- File structure.
- Current technology stack.
- Existing HTML or component structure.
- CSS organization.
- Typography system.
- Color palette.
- Current sections.
- Responsive behavior.
- Image usage.
- Navigation.
- Current animation, if any.
- Accessibility issues.
- Performance risks.
- Which parts should be preserved.
- Which parts should be refactored.
- Which parts should not be touched.

Return:

1. Short diagnosis.
2. Proposed phases.
3. Files likely to change.
4. Technical risks.
5. First recommended intervention.

Do not start large code changes before this audit unless the user explicitly asks to execute immediately.

## Technical approach

Start by identifying the current stack.

### Plain HTML, CSS and JavaScript

If the project uses plain HTML, CSS, and JavaScript:

- Keep it vanilla.
- Use CSS for layout and transitions.
- Use `IntersectionObserver` for scroll reveals.
- Avoid adding heavy libraries.

### React, Next.js, Astro, Vite or similar

If the project uses React, Next.js, Astro, Vite, or similar:

- Keep the existing stack.
- Add reusable components only when useful.
- Use Framer Motion only if it fits naturally into the project.
- Do not add GSAP unless already installed or clearly necessary.

### Tailwind CSS

If the project already uses Tailwind:

- Extend the existing Tailwind system.
- Avoid duplicating styles in random CSS files.
- Use responsive utilities consistently.
- Keep class names readable.

### Plain CSS

If the project uses plain CSS:

- Organize styles clearly.
- Create reusable classes for layout, typography, animation, and layered elements.
- Avoid duplicated declarations.
- Group styles by section or pattern.

## Design direction

The upgraded website should feel:

- Editorial.
- Premium.
- Contemporary.
- Intentional.
- Well-composed.
- Clear.
- Lightweight.
- Visually memorable.

Avoid:

- Generic SaaS templates.
- Corporate stock aesthetics.
- Overused icon grids.
- Excessive gradients.
- Random floating blobs.
- Overanimated sections.
- Bouncing or spinning effects.
- Visual noise without concept.
- Z-index chaos.
- Hardcoded fragile layouts.

## Visual system

Use or refine the existing brand system.

If the current visual system is weak, propose a refined version based on the existing identity.

Recommended visual structure:

- Main background: light, warm, neutral, or brand-appropriate.
- Main text: dark, ink-like, or high-contrast.
- Accent color: used sparingly.
- Secondary sections: soft neutral or editorial dark background.
- Typography: strong display headings plus clean readable body text.
- Layout: asymmetry, spacing, negative space, editorial rhythm.
- Details: fine lines, labels, section numbers, marginal notes, visible or implied grids.

## Typography

Create clear type hierarchy:

- Huge hero headings.
- Large section headings.
- Short subheadings.
- Concise body copy.
- Small labels.
- Marginal notes.
- Button text.

Headings should be visually dominant but readable.

Body text must remain clear and accessible.

Avoid making the entire site depend on decorative typography.

## Recommended page structure

When improving a full landing page, use this structure unless the existing site requires something different:

1. Header
2. Hero
3. Concept or manifesto
4. Services, areas, or benefits
5. Product, method, or core differential
6. Process
7. Cases, projects, examples, or proof
8. Trust section, if relevant
9. Final CTA
10. Footer

Do not force every section if the content does not support it.

Preserve useful existing sections.

Remove or simplify weak sections.

## Layout patterns

Create reusable layout patterns when appropriate.

### 1. Layered Hero

Use for the opening section.

Should include:

- Large primary headline.
- Short explanatory text.
- Primary CTA.
- Optional secondary CTA.
- Floating image, mockup, or visual block.
- Floating labels.
- Fine lines or grid elements.
- Controlled overlap.
- Clear responsive fallback.

The headline should dominate the screen.

The visual elements should support the message, not distract from it.

### 2. Layered Text Image Block

Use for conceptual or manifesto sections.

Should include:

- Large editorial heading.
- Supporting paragraph.
- Image or visual block overlapping part of the layout.
- Optional side note or floating label.
- Generous negative space.

### 3. Editorial Service Blocks

Use for services, product areas, or core benefits.

Each block should include:

- Large title.
- Short description.
- Optional number.
- Optional visual accent.
- Optional floating label.

Avoid generic equal cards unless the content truly needs them.

### 4. Visual System Board

Use for explaining a product, method, modules, or process.

Should include:

- Multiple small floating cards.
- Clear labels.
- Subtle depth.
- Controlled overlapping.
- Responsive stacking on mobile.

### 5. Editorial Case Grid

Use for portfolio, case studies, examples, or projects.

Should include:

- Asymmetric cards on desktop.
- Clean single-column layout on mobile.
- Image or placeholder.
- Title.
- Category.
- Short description.
- Subtle hover state.

### 6. Method Timeline

Use for process or working method.

Should include:

- Numbered steps.
- Short text per step.
- Vertical or horizontal rhythm.
- Subtle scroll reveal.
- No overcomplicated interaction.

### 7. Final CTA

Use as the closing section.

Should include:

- Strong final headline.
- Short explanatory text.
- Clear action.
- Optional visual element.
- Footer transition.

## Animation system

Use subtle animation only.

Preferred effects:

- Fade in.
- Slight upward movement.
- Small stagger delay.
- Image reveal.
- Soft card hover.
- Button hover transition.
- Subtle parallax only if lightweight and justified.

Avoid:

- Bounce.
- Spin.
- Big scaling.
- Heavy blur.
- Scroll hijacking.
- Animation that blocks reading.
- Effects that exist only to show off.

Always respect `prefers-reduced-motion`.

## Vanilla JavaScript animation pattern

If the project uses plain HTML, CSS, and JavaScript, implement scroll reveal with `IntersectionObserver`.

Create a base `.reveal` class.

Initial state:

```css
.reveal {
  opacity: 0;
  transform: translateY(24px);
  transition: opacity 700ms ease, transform 700ms ease;
}
```

Visible state:

```css
.reveal.is-visible {
  opacity: 1;
  transform: translateY(0);
}
```

Reduced motion:

```css
@media (prefers-reduced-motion: reduce) {
  .reveal {
    opacity: 1;
    transform: none;
    transition: none;
  }
}
```

Suggested JavaScript:

```js
const revealItems = document.querySelectorAll(".reveal");

const observer = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (!entry.isIntersecting) return;

      const delay = entry.target.dataset.delay || 0;

      window.setTimeout(() => {
        entry.target.classList.add("is-visible");
      }, delay);

      observer.unobserve(entry.target);
    });
  },
  {
    threshold: 0.16,
  }
);

revealItems.forEach((item) => observer.observe(item));
```

Support optional stagger using data attributes such as:

```html
<div class="reveal" data-delay="100">...</div>
<div class="reveal" data-delay="200">...</div>
<div class="reveal" data-delay="300">...</div>
```

Apply reveal behavior to:

- Section headings.
- Body text.
- Images.
- Cards.
- Floating labels.
- Process steps.

## React animation pattern

If the project uses React and Framer Motion is appropriate, create reusable animation variants.

Suggested variants:

```ts
export const fadeUp = {
  hidden: {
    opacity: 0,
    y: 24,
  },
  visible: {
    opacity: 1,
    y: 0,
    transition: {
      duration: 0.7,
      ease: [0.22, 1, 0.36, 1],
    },
  },
};

export const staggerContainer = {
  hidden: {},
  visible: {
    transition: {
      staggerChildren: 0.12,
    },
  },
};

export const imageReveal = {
  hidden: {
    opacity: 0,
    scale: 0.96,
    y: 24,
  },
  visible: {
    opacity: 1,
    scale: 1,
    y: 0,
    transition: {
      duration: 0.8,
      ease: [0.22, 1, 0.36, 1],
    },
  },
};

export const cardHover = {
  y: -6,
  transition: {
    duration: 0.25,
    ease: "easeOut",
  },
};
```

Apply them consistently.

Do not create separate one-off animation logic in every component.

Respect reduced motion.

## Responsive rules

Mobile must be designed intentionally.

Requirements:

- No overlapping text should become unreadable.
- Layered layouts should stack cleanly.
- Huge headings should remain dramatic but readable.
- Floating labels should be reduced or hidden on small screens.
- Cards should become one column.
- Image overlaps should become simpler.
- Avoid fixed heights that break content.
- Test screens from 360px wide.
- Maintain visual identity without sacrificing usability.

Desktop can be expressive.

Mobile must be clear.

## Accessibility requirements

Ensure:

- Semantic HTML.
- Correct heading hierarchy.
- Accessible links and buttons.
- Good text contrast.
- Meaningful alt text for important images.
- Decorative images marked appropriately.
- No important content trapped inside images.
- Keyboard-friendly navigation.
- Reduced motion support.
- Clear focus states.

## Performance requirements

Keep the site lightweight.

Avoid:

- Unnecessary libraries.
- Huge unoptimized images.
- Heavy filters.
- Excessive blur.
- Too many shadows.
- Scroll listeners that hurt performance.
- Layout shifts.

Prefer:

- Optimized images.
- CSS transforms and opacity for animation.
- Lazy loading where appropriate.
- Reusable classes.
- Clean component structure.

## Code quality requirements

Maintain clean, readable code.

- Do not create fragile pixel-perfect hacks.
- Do not use arbitrary z-index values everywhere.
- Use semantic class names.
- Group related styles.
- Avoid duplication.
- Separate content from layout where possible.
- Preserve existing working code unless there is a clear reason to refactor.
- Leave comments only where they clarify non-obvious layout or animation logic.

## Content handling

Do not invent a new brand or change the meaning of the website without user approval.

Improve copy only when necessary for clarity and hierarchy.

When copy is missing, use neutral placeholders and mark them clearly.

Do not replace real content with generic marketing fluff.

## Implementation phases

### Phase 1: Audit

Inspect current structure and identify opportunities.

Output:

- Diagnosis.
- Proposed changes.
- Files to edit.
- Risks.
- First step.

### Phase 2: Visual foundation

Refine:

- Colors.
- Typography.
- Spacing.
- Containers.
- Section rhythm.
- Button style.
- Basic responsive rules.

### Phase 3: Hero upgrade

Create a stronger hero with:

- Big headline.
- Clear subtext.
- CTA.
- Layered composition.
- Floating elements.
- Responsive fallback.

### Phase 4: Section restructuring

Improve the remaining sections:

- Manifesto or concept.
- Services or benefits.
- Product, process, or differential.
- Cases or examples.
- CTA.
- Footer.

### Phase 5: Layered components

Add reusable patterns:

- Layered Hero.
- Layered Text Image Block.
- Editorial Grid.
- Floating Labels.
- Visual System Board.
- Method Timeline.

### Phase 6: Motion

Add subtle scroll and hover animations.

Respect reduced motion.

### Phase 7: Responsive pass

Audit all breakpoints and fix mobile issues.

### Phase 8: Accessibility and performance pass

Fix semantic, contrast, image, animation, and performance issues.

### Phase 9: Cleanup

Remove unused styles, simplify code, and ensure maintainability.

## Acceptance criteria

The final result should:

- Preserve the original project and brand intent.
- Feel more premium and editorial.
- Use layered composition with intention.
- Have a stronger hero.
- Improve typography, spacing, and visual rhythm.
- Include subtle scroll animation.
- Work well on mobile.
- Stay lightweight and maintainable.
- Avoid generic templates.
- Avoid copying any external website.
- Avoid unnecessary technical complexity.
- Have clean code and clear structure.

## Initial instruction template

Use this instruction before editing:

```txt
Analyze the current static website and prepare a phased plan to upgrade it into a premium editorial landing page with layered composition, large typography, subtle scroll animations, improved responsive behavior, and clean maintainable code. Do not modify files yet. First return a diagnosis, proposed phases, files to edit, risks, and the first recommended intervention.
```

## Execution instruction template

Use this instruction after the audit is approved:

```txt
Execute the approved plan. Preserve the existing stack and project structure where possible. Improve the visual system, hero, section hierarchy, layered compositions, subtle animations, responsive behavior, accessibility, and performance. Keep the site static, lightweight, and maintainable. Do not copy any external website. Use the layered editorial reference only as design logic, not as a template.
```
