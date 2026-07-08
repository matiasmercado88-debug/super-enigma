# Source Catalog

Where the raw materials for brutalist/neo-brutalist web design actually come from. Most of
this style needs less sourcing than the others in this family — the point is exposed,
undecorated structure, and several of its core materials (system fonts, hand-built CSS
devices) cost nothing to source because they're not "assets" at all. What follows is what
genuinely benefits from a real source.

**Contents:** 1. Typefaces · 2. Neo-brutalist component libraries · 3. Reference galleries
· 4. Cursor & glitch effects · 5. Color

---

## 1. Typefaces

- **Unstyled-HTML register**: the actual system font stack, used at unapologetically large
  sizes as a statement — `font-family: Times New Roman, Georgia, serif` or
  `font-family: Arial, Helvetica, sans-serif`. Zero download, zero license question, and
  genuinely part of the point (an "unstyled" look that's actually just the browser default,
  pushed to an oversized scale on purpose).
- **Utilitarian monospace register**: **Courier New** (system, free), or a real coded
  typeface for a sharper version of the same idea — **JetBrains Mono**, **IBM Plex Mono**,
  **Space Mono** (all Google Fonts / OFL, free commercial, self-hostable).
- **Neo-brutalist oversized-grotesk register**: **Archivo Black**, **Anton**, **Unbounded**
  (Google Fonts, free commercial) at extreme sizes with tight or negative tracking — the
  loud end of this family, closer to `bold-brand-asset-sourcing`'s territory but pushed
  toward starker contrast and thicker borders around the type rather than decorative devices.

Pick one register — don't run system-default Times New Roman next to a loud neo-grotesk;
that reads as two different projects, not one confident one.

---

## 2. Neo-brutalist component libraries

Ready-made, current as of this writing (verify status before depending on any of them long
term — component libraries in this space update quickly):

- **BoldKit** — https://boldkit.dev — free neo-brutalism UI library for React & Vue 3;
  60+ components, blocks, templates, shapes, charts; installs via the shadcn CLI.
- **neobrutalism-vue** — a Vue component collection built on shadcn-vue, styled for
  neo-brutalism, optimized for Tailwind v4 (search "neobrutalism-vue" on GitHub/npm for the
  current repo).
- **Neobrutalism components (Figma)** — https://www.figma.com/community — search
  "neobrutalism components"; multiple community files exist restyling shadcn/ui components
  with thick borders and hard offset shadows, usable as a Figma-side reference even when
  building by hand in code.
- **shadcn/ui theme files for neo-brutalism** — several community-maintained theme files
  restyle standard shadcn/ui components with neo-brutalist tokens (thick borders, offset
  shadows, bright primaries) without swapping the underlying component set — the fastest
  route to the look on an existing shadcn project, though expect to hand-tweak edge-case
  components.

These libraries are the practical shortcut for the *interface* side of neo-brutalism
(buttons, cards, forms, dashboards) — for a marketing page's hero/layout, hand-building the
devices in `raw-devices.md` usually gives more control than adapting a component kit.

---

## 3. Reference galleries — study the logic, never lift the assets

- **Brutalist Websites** — https://brutalistwebsites.com — Pascal Deville's long-running
  archive of classic web brutalism: raw HTML aesthetics, asymmetric grids, unrefined
  typography. The historical reference point for this style.
- **BRUTAL WEB** — https://brutalweb.com — a newer, actively curated gallery specifically
  of neo-brutalist sites, useful for seeing the louder, brighter, shadcn-adjacent branch of
  the style in practice.
- Real production examples worth studying for restraint-within-rawness: Bloomberg's
  homepage (stark, text-dense, "modern brutalist" rather than glitchy), and Craigslist
  (an accidental brutalist classic — pure function, zero decoration, and still standing
  after decades because it never needed a redesign).

---

## 4. Cursor & glitch effects

- **Custom cursors**: a simple CSS `cursor: url(...)` swap, or a JS-driven cursor-follower
  element, can carry a lot of the "raw/rebellious" character on its own — keep the custom
  cursor legible (don't obscure what's under it) even when it's deliberately blocky or
  oversized.
- **Glitch/distortion text and image effects**: achievable in pure CSS (layered
  `text-shadow` in clashing colors with a slight offset, animated via `clip-path` slices for
  a classic "glitch" cut effect) — search "CSS glitch effect" for current copy-paste
  techniques rather than reaching for a JS library for something this small.
- **Scanline/CRT overlays**: a repeating linear-gradient of thin horizontal lines at low
  opacity over the whole viewport approximates an old-monitor texture — pure CSS, no asset.

---

## 5. Color

- **Classic brutalism**: true black and white, sometimes with one "warning sign" accent
  (safety orange, hazard yellow) used sparingly against the monochrome.
- **Neo-brutalism**: a small set of clashing saturated primaries (a hot pink, an acid
  green, an electric blue) against a plain off-white or black background — the palette that
  shows up across most of the shadcn-based component kits in section 2. Keep the set small;
  neo-brutalist color reads as confident with two or three loud colors, and as chaotic with
  six.
- Build and pressure-test any palette the same way as in `bold-brand-asset-sourcing/
  sources.md`: Coolors or Realtime Colors to build and preview, then check contrast with
  APCA or WebAIM before calling it done — see `restraint-and-rights.md` for why this gate
  matters more here than in most other styles.
