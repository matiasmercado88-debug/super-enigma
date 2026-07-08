---
name: brutalist-web-sourcing
description: >-
  Source the raw materials for brutalist and neo-brutalist web design — raw, unpolished,
  anti-corporate: exposed structure, thick borders, hard offset shadows (no blur), system
  or monospace fonts, stark or clashing color, and deliberately raw grids and interactions.
  Use when a project wants to read as honest, rebellious, or defiantly undecorated: a
  studio/dev-tool portfolio unpolished on purpose, a neo-brutalist dashboard (thick borders, hard shadows, bright primaries), or anything described as
  "brutalist", "neo-brutalism", "crudo/sin pulir", or "bordes gruesos y sombra dura". Also use to source neo-brutalist shadcn-based component kits, to keep rawness
  deliberate rather than actually broken (contrast, hit targets, navigation must survive),
  and to keep it lightweight. Do NOT use for polished bold-studio devices (bold-brand-
  asset-sourcing), quiet editorial (editorial-layered-landing), character illustration
  (illustrated-narrative-sourcing), or brands needing calm/trust (fintech, healthcare).
---

# Brutalist Web Sourcing

Brutalism takes its name from *béton brut* — raw concrete, structure left exposed rather
than dressed up. On the web it means the same instinct: exposed grids, thick borders, hard
shadows with no blur, plain or monospace type, and interactions that don't bother to ease
in gently. It's a deliberate rejection of the polish that most sites reach for by default —
which is exactly why it's harder to do well than it looks.

## The trap this exists to avoid

Brutalism photographs as an accident — like nobody tried. Every brutalist site that
actually works is the opposite: a strong art director decided exactly which rules to break
and left everything else disciplined. The failure mode isn't the bold-brand failure
(clutter) or the illustration failure (drift) — it's **mistaking actual brokenness for the
style**. Illegible contrast, hit targets nobody can find, a hierarchy that's genuinely
confusing — that's not brutalism, that's just a bad website wearing brutalism as an excuse.
Real sources on this style say it plainly: brutalist choices must not undermine usability,
and the style is a poor fit for any brand whose users need to feel calm and in control
(fintech, healthcare, anything trust-dependent) rather than challenged. If it needs a strong
art director standing over it to keep from collapsing into noise, that's not a bug in the
style — that's the actual skill it requires.

## When to use / not use

**Use when** the brief wants to read as raw, honest, rebellious, utilitarian, or
anti-corporate: a creative studio or developer-tool portfolio embracing unpolish on
purpose, a neo-brutalist SaaS interface (thick borders, hard offset shadows, clashing
bright primaries against off-white — the shadcn-adjacent look), a project explicitly
referencing brutalist architecture or early-web aesthetics, or a deliberately broken/glitch
grid used as a considered visual strategy.

**Do not use when** the actual need is polish (`bold-brand-asset-sourcing` for
devices-and-grain bold, `editorial-layered-landing` for quiet premium), when illustrated
characters carry the story (`illustrated-narrative-sourcing`), or when the brand needs
users to feel calm and trusting rather than challenged — fintech, healthcare, and luxury
are the classic bad fits, called out repeatedly in the style's own literature.

## The rule that governs everything

**Deliberate first, then legible, then light.** Every raw choice — a broken grid, a
clashing color pair, an abrupt hover — has to be a decision you could defend, not a thing
that happened because nobody refined it. A brutalist page that fails basic contrast or
hides its navigation isn't edgy, it's broken. And a "raw, honest" site loaded with
unnecessary JavaScript frameworks is lying about its own premise — the aesthetic claims
honesty about structure, so the implementation should actually be light, not just look
light. Check deliberateness first, because it's the cheapest thing to get right and the
one that separates "calculated rebellion" from "just a bad website."

## Workflow

### 0. Retrofitting onto an existing site?

The general retrofit audit in
`bold-brand-asset-sourcing/references/retrofitting-existing-sites.md` applies here
unchanged — existing CSS variables and theme mechanism, CSP, existing scroll/motion
systems, single- vs. multi-page structure. Read it first if this is landing on a site that
already works.

### 1. Define the raw system before sourcing anything

Lock these as a short spec so the rawness reads as one considered decision, not several
unrelated ones:

- **Typeface**: a real, honest choice between three registers — the *unstyled-HTML*
  register (actual system-default stack: Times New Roman, Arial, at unapologetically large
  sizes), the *utilitarian monospace* register (Courier, or a real coded typeface like
  JetBrains Mono/IBM Plex Mono), or the *neo-brutalist* register (an extremely bold geometric
  grotesk pushed to oversized scale — Archivo Black, Anton). Pick one; don't blend registers.
- **Border and shadow language**: thick solid borders (commonly 2–6px, usually pure black)
  and **hard offset shadows** — solid color, zero blur, offset a fixed few pixels — is the
  single most recognizable neo-brutalist device. Lock the border width and shadow offset as
  fixed values reused everywhere, the same discipline as any device vocabulary.
- **Grid honesty**: exposed grid lines and visible structure (the classic-brutalist move),
  or a deliberately broken/misaligned grid (the neo-brutalist move) — both are valid, but
  pick one on purpose rather than letting elements drift by accident.
- **Color**: true monochrome (black/white, maybe one warning-sign color) for classic
  brutalism, or a small set of clashing saturated primaries against off-white/black for
  neo-brutalism. Either way, keep the palette small — see `raw-devices.md`.
- **Interaction character**: instant, un-eased hover/active states (no smooth transition —
  the point is abruptness) for classic brutalism, or deliberately jarring
  glitch/distortion micro-interactions for a more performative neo-brutalist take. Decide
  the ceiling now — see `motion-and-interaction.md`.

### 2. Source per category

Full catalog in `sources.md`. Short version: system/monospace fonts need no sourcing at
all; neo-brutalist component libraries exist ready-made on top of shadcn/ui (BoldKit,
neobrutalism-vue, several Figma kits); the signature hard-shadow/thick-border look is
better hand-built in CSS than downloaded (see `raw-devices.md`); and the two reference
galleries worth studying for the *logic*, never for lifting assets, are
brutalistwebsites.com (the long-running classic-brutalist archive) and brutalweb.com (a
newer neo-brutalist curation).

### 3. Select for deliberateness, not accidental ugliness

Every choice should survive the question "could I defend this in a critique?" A broken
grid that's actually just misaligned because nobody checked isn't brutalism, it's a bug.
Run the discipline checklist in `raw-devices.md` before calling a layout done.

### 4. Protect legibility and usability underneath the rawness

This is the gate that matters most for this specific style — more than licensing, more
than weight. Full detail in `restraint-and-rights.md`: contrast must still pass even
inside a deliberately harsh palette, navigation must still be findable even inside a
deliberately unconventional layout, hit targets must still work on mobile even inside a
deliberately "broken" grid. The style can look uncompromising; the experience underneath
cannot actually be broken.

### 5. Clear licenses — lighter gate here, but not zero

Neo-brutalist shadcn-based component kits are usually MIT/open, but verify each one — see
`restraint-and-rights.md`. System fonts need no license at all, which is one of this
style's genuine practical advantages.

### 6. Keep it honest about weight

A raw, honest aesthetic built on a bloated stack undercuts its own premise. See
`optimization.md`: prefer system fonts (zero load cost), hand-built CSS for the
border/shadow devices (no library needed), and pull in a component kit only for the
specific components actually used rather than the whole library.

## Reference files

- `sources.md` — fonts (system/monospace/neo-grotesk), ready-made neo-brutalist component
  libraries (shadcn-based, current as of this writing), the two reference galleries, and
  cursor/glitch-effect sources.
- `raw-devices.md` — how to build the signature devices with code: the hard offset shadow,
  thick borders, exposed/broken grid, glitch cursor and hover states, ASCII/terminal
  touches — plus the deliberateness checklist.
- `restraint-and-rights.md` — the legibility/usability gate specific to this style
  (contrast, hit targets, navigation under a "broken" look), plus component-kit and font
  licensing. Guidance, not legal advice.
- `motion-and-interaction.md` — the philosophy of abrupt vs. glitchy motion, cursor
  customization, and reduced-motion handling for effects (glitch/distortion) that are
  especially prone to triggering motion sensitivity.
- `optimization.md` — the keep-it-light philosophy applied concretely: system fonts,
  hand-built CSS devices over downloaded assets, and trimming a component kit to only
  what's used.
