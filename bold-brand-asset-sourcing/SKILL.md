---
name: bold-brand-asset-sourcing
description: >-
  Source the raw materials for the bold, playful, graphic "creative studio" look that
  brand-forward agencies and Awwwards studios make. Covers where to get expressive
  display fonts, decorative graphic devices (stars, sparkles, badges/seals, stickers,
  squiggles, arrows), grain/riso/halftone textures, punchy color, hand-drawn
  illustration, and the motion that gives the feel (smooth scroll, marquees, animated
  split text). Use whenever a build wants character and punch rather than quiet
  minimalism: the user points at a bold studio/brand site as reference, or asks where
  to get a display face with attitude, a sticker or seal, a star or squiggle, a
  grain/riso texture, a marquee, smooth scroll, or a bright palette — even naming only
  one ("una tipo display con onda", "un marquee que corra"). Also
  use it to vet licensing (display fonts are often paid) and keep it light. Do NOT use
  for quiet/editorial minimalist pages, stock-photo-driven layouts, generating finished
  artwork, or building a brand identity from zero.
---

# Bold-Brand Asset Sourcing

This is the sourcing kit for sites with **punch** — bold brand studios like The Cloud
Studio, not quiet editorial magazines. That look isn't built from stock photography and
restrained serifs; it's built from **expressive display type, a small kit of graphic
devices, grain, bright color, and purposeful motion**. This skill is about where those
materials come from and how to bring them in without turning the page into a carnival.

## The trap this exists to avoid

Bold does **not** mean random. The failure mode of this aesthetic is a cluttered mess:
ten fonts, twenty stickers, three grain textures, everything spinning and bouncing. The
studios that pull it off do the opposite — they pick a **tight vocabulary** and repeat
it. One or two hero display faces. Three or four graphic devices, reused everywhere. One
grain. A limited bright palette. Motion with intent. The punch comes from **commitment
and repetition**, not variety. When in doubt, use fewer elements, bigger, more often.

## When to use / not use

**Use when** the target is expressive/graphic/brand-forward — the user references a bold
studio site, or needs display fonts with attitude, decorative devices (stars, seals,
stickers, squiggles, arrows, blobs), grain/riso/halftone texture, punchy color,
hand-drawn illustration, or the signature motion (smooth scroll, marquees, animated
type). Also to clear licensing (the good display fonts are frequently paid) and optimize.

**Do not use when** the brief is quiet/editorial/minimalist, photography-driven, or when
the task is generating finished artwork or a brand identity from zero. If the user wants
to copy a specific real site's assets, refuse — source original equivalents that hit the
same *logic*, never the same files.

## The rule that governs everything

**Cohesion first, then license, then weight.** A device that's fun in isolation but
doesn't belong to the page's vocabulary is the wrong device. A perfect display font you
can't legally ship is worthless. A cleared, cohesive kit that adds 2 MB of PNG stickers
and a heavy animation lib breaks the page. All three gates, in that order — reject on
cohesion before you spend time licensing or optimizing something that never fit.

## Workflow

### 0. Retrofitting onto an existing site? Audit first.

If this is a from-scratch build, skip to step 1. But the more common case —
and the one where this skill's guidance most often gets applied — is layering
bold-studio devices and motion onto a site that already works, already has a
brand, and already has its own JS. That has a different failure mode than a
fresh build: not clutter, but **collision** — a new smooth-scroll fighting the
site's existing scroll-spy, a device that doesn't resolve under the theme
mechanism the site actually uses, a CDN script blocked by a CSP nobody
checked. Read `references/retrofitting-existing-sites.md` and run its
pre-flight checklist (existing CSS variables and theming pattern, CSP,
existing scroll/motion systems, existing repeated patterns to hook into,
single- vs multi-page structure) before sourcing or building anything below.

### 1. Define the kit before sourcing

Don't collect assets, define a *system*. From the reference or brief, lock:

- **Display voice**: one or two display faces max — the personality of the whole thing.
  Decide the flavor: chunky grotesque (Anton, Monument), quirky-arty (Syne, Le Murmure),
  high-contrast wonky (Clash Display), retro/groovy, condensed poster. Everything else
  keys off this.
- **Device vocabulary**: pick 3–4 graphic devices and commit — e.g. a star/sparkle, a
  rotating seal/badge, a hand-drawn arrow, a squiggle underline. These recur across
  sections and *are* the brand feel. More than ~4 kinds and it reads as clip-art soup.
- **Texture**: one grain (or one riso/halftone treatment), applied globally so the whole
  page shares a surface.
- **Palette**: bright but bounded — usually 1–2 loud brand colors, a strong dark, a
  paper/off-white, maybe one secondary. Bold color reads as confident only when limited.
- **Motion feel**: decide the level — is it a marquee + smooth scroll + type reveals
  (common studio baseline), or heavier scroll-driven choreography? Pick a ceiling now so
  it stays intentional.

Write it down as a tiny spec. That spec is what keeps "bold" from sliding into "busy."

### 2. Source per category

Full catalog with URLs, licenses, and fit notes in `references/sources.md`. The signature
elements — stars, seals, stickers, squiggles, marquees — are often hand-built, so
`references/graphic-devices.md` shows how to make and source them (with code). The motion
that sells the look lives in `references/motion.md`. Short version:

- **Display fonts** → for free-but-arty, Velvetyne (Le Murmure), Google Fonts (Syne,
  Bricolage Grotesque, Anton, Unbounded), and Fontshare (Clash Display, Cabinet Grotesk)
  cover most briefs. Reach for paid indie foundries (Pangram Pangram, Displaay, Grilli
  Type, ABC Dinamo, Klim) when the brand needs a face with real distinction.
- **Graphic devices** → prefer SVG you can recolor/animate: build seals with text-on-path,
  stars/sparkles/arrows as tiny inline SVGs, blobs/waves via Haikei/Blobmaker, hand-drawn
  strokes via Rough.js. Grab decorative packs from SVG Repo / open illustration sets, but
  keep them inside your chosen vocabulary.
- **Grain / riso / halftone** → generate in SVG/CSS (grain via `feTurbulence`, halftone via
  filters) so it weighs nothing; raster only for genuine scanned riso.
- **Color** → build the bounded palette, test on a real layout (Realtime Colors), check
  contrast (APCA) — bright palettes fail contrast easily on the accessibility bar.
- **Illustration** → open sets (unDraw, Open Doodles, Humaaans, Storyset) or AI, always
  re-colored into the palette so it doesn't look borrowed.
- **Motion** → GSAP (now 100% free, all plugins, incl. commercial) + Lenis for smooth
  scroll; CSS for marquees. See `references/motion.md`.

### 3. Select for cohesion, not for "cool"

The catalog gives you a thousand options; the kit spec rejects most of them. Concretely:

- **Every device must earn its place in the vocabulary.** A gorgeous sticker that isn't
  one of your 3–4 device types doesn't go in, no matter how good it is alone.
- **Recolor everything into the palette.** Illustrations, devices, textures — nothing
  ships in its source colors. A page where every element was clearly recolored by one
  hand is what separates "designed brand" from "downloaded a pack."
- **Match the display face to the brand's personality**, not to what's trending. Syne says
  art/culture; Anton says loud/poster; Clash says playful-premium; a groovy retro face
  says nostalgic-fun. Pick the one that *means* the brand.

### 4. Clear the license — before anything reaches a client

The bold look leans on paid display fonts and mixed-license illustration packs, so this
gate matters more than in stock-photo work. Run assets through the checklist in
`references/licensing.md`. Non-negotiables: commercial use allowed (no trial/personal
font files on a live client site; confirm **webfont + self-host** rights); attribution
where required (CC-BY illustration packs, and free-stock **APIs**); and record every
asset's source + license + date in an `ASSETS.md`. GSAP and Lenis are free for commercial
use — good, but still note them.

### 5. Optimize and self-host

Punch is no excuse for bloat. See `references/optimization.md`: self-host + subset fonts
(woff2), keep devices/grain as SVG/CSS (near-zero weight), optimize any raster to
AVIF/WebP, and lazy-load below the fold. Crucially for this aesthetic, **gate all motion
behind `prefers-reduced-motion`** and keep the animation library payload justified — a
marquee and a few reveals don't need three libraries.

### 6. Hand off with provenance

Deliver assets optimized and self-hosted, plus the `ASSETS.md` manifest and the one-page
kit spec (fonts, devices, palette, grain, motion ceiling). That spec is what lets the
site stay coherent as it grows instead of accreting random stickers over time.

## Reference files

- `references/retrofitting-existing-sites.md` — the pre-flight audit checklist for adding
  devices and motion to a site that already exists and works: existing CSS variables and
  theming mechanism, CSP, existing scroll/motion systems, hooking into repeated patterns
  instead of inventing new markup, single- vs multi-page structure. Read this first for
  the (common) retrofit case.
- `references/sources.md` — the full bold-brand catalog: display fonts, device/illustration
  sources, grain/riso/halftone, color, and inspiration galleries, with URLs, license
  posture, and fit notes. The core "de dónde" answer.
- `references/graphic-devices.md` — how to build and source the signature elements: rotating
  seals (text-on-path), stars/sparkles/arrows (inline SVG), blobs/waves, hand-drawn strokes
  (Rough.js), grain and halftone — with copy-paste code.
- `references/motion.md` — the "feel": smooth scroll (Lenis), GSAP + ScrollTrigger + SplitText
  (now free), CSS marquees/tickers, and reduced-motion handling.
- `references/licensing.md` — license families, the client-work checklist (font tiers matter
  here), and the `ASSETS.md` format. Guidance, not legal advice.
- `references/optimization.md` — self-hosting, font subsetting, image/SVG optimization, and a
  performance checklist. Helper scripts in `scripts/`.
