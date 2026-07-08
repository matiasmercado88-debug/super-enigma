# Retrofitting Onto an Existing Site

Everything else in this skill assumes sourcing materials for something being
built. In practice, the more common job is the opposite: a site that already
works, already has a brand, already has its own JS — and the task is to layer
bold-studio devices and motion onto it without breaking what's there. That's a
different risk profile, with its own pre-flight checklist. Run this **before**
sourcing or writing a single device.

## Why this is a separate step

Retrofitting fails in different ways than building fresh does. The fresh-build
failure mode is a cluttered kit (too many devices, no cohesion — see the main
SKILL.md discipline rule). The retrofit failure mode is **collision**: a new
smooth-scroll fighting the site's native scroll-spy, a new color that doesn't
resolve under the theme the site already has, a CDN script blocked by a CSP
nobody checked, a device duplicated across five pages because it needed new
HTML instead of living in the shared stylesheet. None of that shows up until
you actually load the page — so check for it first, not after.

## Pre-flight checklist

### 1. CSS custom properties — hook into what's already there
Before picking a color for any device, check whether the site already defines
theme variables (`--bg`, `--ink`, `--accent`, or similarly named) and, in
multi-section or multi-page sites, **per-section or per-page accent overrides**
(e.g. `.page-hero.sistema { --ac: var(--lime); }`). If they exist, every new
device should resolve against `var(--...)` or `currentColor`, never a hardcoded
hex — that's what makes the seal/marquee/squiggle automatically match whichever
theme or section it lands in, for free. Hardcoding a hex here is the single
most common way a device looks "bolted on" instead of native to the brand.

### 2. Theming mechanism — check all three patterns, don't assume one
Sites toggle dark/light in at least three different ways, often combined:
- an explicit attribute or class (`data-theme="dark"`, `.dark`),
- `prefers-color-scheme` media query with no explicit override,
- or both at once (explicit toggle that defaults to following the system
  preference until the user picks one — this is the trickiest and most common
  in mature sites).
A new device's colors need to be correct under whichever of these the site
actually uses. If unsure, grep for `data-theme`, `prefers-color-scheme`, and
any `.dark`/`.light` class before writing a single color rule, and cover
whichever patterns you find — not just the first one you notice.

### 3. CSP and script-loading constraints
Check for a `Content-Security-Policy` — in a `_headers` file, `netlify.toml`,
server config, or a `<meta http-equiv="Content-Security-Policy">` tag. If
`script-src` doesn't include the CDN you had in mind, motion libraries (GSAP,
Lenis) need to be bundled and self-hosted, or inlined, instead. If you find
**no** CSP at all, don't assume that's permanent license to use any CDN freely —
note it as an observation ("no CSP found in the files provided") rather than a
guarantee, since deployment config can live outside what you were given.

### 4. Existing scroll/motion systems — integrate, don't duplicate
Look for what the site already does on scroll: a scroll-spy that highlights
the active nav link, a custom `IntersectionObserver` fade-in, a parallax
effect, anything bound to `window.addEventListener('scroll', ...)`. Two valid
paths, and you must pick one on purpose:
- **Replace** it consistently with the new motion stack (e.g. drop the old
  fade-in classes, do all reveals through GSAP ScrollTrigger instead), or
- **Re-bind** the existing logic to fire from the new scroll source instead of
  native scroll (e.g. `lenis.on('scroll', existingScrollSpyFn)` instead of
  `window.addEventListener('scroll', existingScrollSpyFn)`).
What you must never do is leave both running independently and unaware of each
other — native scroll listeners plus a smooth-scroll library both firing
produces desync (the old system reads a scroll position the smooth-scroll
library has already moved past) and visible jank. Always keep a working
fallback for when the new motion is disabled (reduced motion, or a load
failure): the site should still be fully navigable on native scroll alone.

### 5. Reuse existing repeated patterns as device hooks
Before adding new markup for a device, look for a pattern the site already
repeats: a highlighted-word treatment (an `<em>` or `<span>` used the same way
across multiple headlines), a badge or label system, an icon used more than
once. Hanging a new device off an existing repeated pattern — a squiggle under
an already-highlighted word, a rotating ring around an already-present icon or
diagram — costs less to implement and reads as something the brand grew,
rather than something bolted on afterward. Only introduce new markup when
nothing suitable already repeats.

### 6. Existing bespoke interactive elements are assets, not obstacles
If the site already has a custom-built interactive centerpiece — a hand-coded
SVG diagram, a canvas sketch, an animated hero illustration — treat it as the
thing to extend (wrap a device around it, key a device's color to its hover
state) rather than competing with it by adding an unrelated device elsewhere
on the same screen. The most integrated version of a device is usually the one
attached to the thing that's already the visual anchor of the page.

### 7. Single-page vs. multi-page structure
Check whether the site is one file with everything inline, or multiple HTML
pages sharing common CSS/JS files. This changes where a device should live:
- Anything purely visual or motion-based (colors, animations, a marquee's
  styling) that lives in a **shared** stylesheet or script propagates to every
  page for free.
- Anything that requires **new HTML markup** (the marquee's actual text
  content, a seal's SVG markup) has to be duplicated into every page it should
  appear on — budget for that explicitly rather than discovering it mid-build.
If several pages already vary a themed accent per page (see #1), prefer
building the device once against `var(--ac)` so the per-page markup is
identical everywhere and only the CSS variable changes the result.

### 8. Reduced motion — gate it twice, not once
Any animation needs to no-op under `prefers-reduced-motion: reduce` in **both**
places it could be running:
- CSS: wrap the relevant `animation`/`transition` in the media query.
- JS: gate registration of scroll-triggered or JS-driven animation (e.g.
  `gsap.matchMedia('(prefers-reduced-motion: no-preference)')`, or checking
  `matchMedia('(prefers-reduced-motion: reduce)').matches` before initializing
  a smooth-scroll library at all) — see `motion.md`.
Doing only one of these leaves a gap: a CSS-gated animation can still be
retriggered by JS logic that doesn't know to skip it, and vice versa.

### 9. Font-loading reality check
Many real sites load fonts from a foundry's own CDN (Fontshare, Adobe Fonts)
rather than self-hosting, and that's a legitimate, working setup — not a bug
to fix in passing. `optimization.md`'s self-hosting advice is the performance
upgrade path for a font-heavy rebuild, not a prerequisite for adding a device
or a scroll effect. Don't bundle an unrelated font-loading migration into a
device-adding task unless it was actually asked for.

## Folding this into a handoff doc

When the checklist above turns into an actual audit or SPEC (see the
editorial-layered-landing skill's audit phase for the general audit
structure), each finding here becomes one of that audit's "technical risks" or
"what to preserve" items — this file is what makes sure those categories get
filled in with the retrofit-specific risks above, not just generic ones.
