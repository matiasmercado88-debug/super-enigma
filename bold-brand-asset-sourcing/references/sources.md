# Bold-Brand Source Catalog

The "de dónde sacar los recursos" for the bold, graphic, creative-studio look. Organized
by category, each source with: what it's for, license posture in one line, and how it fits
the aesthetic. Deep licensing lives in `licensing.md`; signature-element construction lives
in `graphic-devices.md`; the motion libraries live in `motion.md`.

**Contents**
1. Display fonts (the voice)
2. Graphic devices (stars, seals, stickers, squiggles, arrows, blobs)
3. Grain / riso / halftone / noise
4. Bright color & palettes
5. Hand-drawn illustration
6. Inspiration galleries (reference the logic, not the files)

---

## 1. Display fonts — the voice

The bold look lives and dies on the display face. You need **one or two with real
personality**, plus a neutral text face to carry the reading. Restraint in *count* is
what makes loud type look intentional instead of chaotic.

### Free + self-hostable, and still arty (start here)

- **Velvetyne** — https://velvetyne.fr — libre (OFL), the source the cool studios quietly
  use. **Le Murmure** is the standout — a free display face you'll recognize from a hundred
  agency sites; also **Basteleur**, **Ouroboros**, **Cirruit**, **Format 1452**, **Mixte**.
  Free, commercial, self-hostable. This is the single best free source for character.
- **Google Fonts** — https://fonts.google.com — OFL/Apache, free commercial, self-host.
  Bold picks that don't look defaulty:
  - Arty / wonky: **Syne** (the art-gallery face), **Bricolage Grotesque**, **Gantari**.
  - Loud poster: **Anton**, **Archivo Black**, **Big Shoulders Display**, **Unbounded**,
    **Bagel Fat One**, **Sixtyfour**.
  - Groovy / retro / display: **Bungee**, **Fredoka** (rounded), **Climate Crisis**,
    **Honk** (chromatic), **Gloock** (high-contrast serif), **Instrument Serif**.
  - Neutral text partners: **Inter**, **Space Grotesk**, **General Sans**-alike **Hanken
    Grotesk**, **Schibsted Grotesk**.
- **Fontshare** — https://www.fontshare.com — Indian Type Foundry, free personal +
  commercial, self-hostable. Display with punch: **Clash Display**, **Cabinet Grotesk**,
  **Bespoke Serif/Slab**, **Tanker**, **Khand**, **Melodrama**, **Boska**, **Zodiak**.
- **Uncut.wtf** (https://uncut.wtf) and **Collletttivo** (https://www.collletttivo.it) —
  curated free/libre display faces; great for a face nobody else is using. Check each license.

### Paid indie foundries — when the brand needs distinction

The faces you see on Awwwards-winning studio sites. Buy a **webfont license sized to
traffic**; confirm self-host vs hosted-only.

- **Pangram Pangram** — https://pangrampangram.com — free for personal, paid for commercial;
  the modern-studio staple (PP Neue Montreal, PP Editorial New, PP Right Grotesk, PP Mori,
  Neue World). Enormously common in this scene.
- **Displaay** — https://displaay.net — sharp contemporary display (Sligoil, Ohno-adjacent vibes).
- **Grilli Type** — https://www.grillitype.com — GT Flexa, GT Ultra, GT Maru, GT Alpina.
- **ABC Dinamo** — https://abcdinamo.com — ABC Monument Grotesk, ABC Diatype, ABC Favorit —
  iconic in the studio look.
- **Klim** (https://klim.co.nz), **OH no Type Co** (https://ohnotype.co — Obviously, Hobeaux,
  the source of a lot of "fun" display), **Sharp Type** (https://sharptype.co).

### Notes

- **Trial ≠ production.** Free "trial"/"personal" font files must not ship on a client's
  live site. See `licensing.md`.
- **Variable fonts** (Syne, Bricolage, many PP faces) cut requests and let you push weight to
  extremes for poster effects — preferred for the hero face.
- **Pairing**: one loud display + one neutral text is the whole game. If you use two display
  faces, make them *obviously* different roles (e.g. Le Murmure headlines + Space Grotesk
  labels), never two similar loud faces fighting.

---

## 2. Graphic devices — stars, seals, stickers, squiggles, arrows, blobs

The "extra punch." **Prefer SVG you can recolor and animate over PNG packs** — inline SVG
takes `currentColor`, scales crisp, and weighs nothing. Construction details and code are in
`graphic-devices.md`; this is where to source them.

### Build them (best — full control, on-brand color, animatable)

- **Rotating seals / badges** (curved "★ ESTUDIO ★ SINCE 2020 ★"): SVG `<textPath>` around a
  circle, in your display font, slowly rotating. The most recognizable studio device — see
  `graphic-devices.md`. No download needed.
- **Stars / sparkles / asterisks / arrows**: tiny hand-authored inline SVGs, or pull the glyphs
  straight from your display font. Fully on-brand, ~0 KB.
- **Blobs / organic shapes**: **Blobmaker** (https://www.blobmaker.app) and **Haikei**
  (https://haikei.app — blobs, waves, stacked waves, corner shapes, gradients, low-poly) —
  export SVG, recolor to palette. Haikei is the workhorse for background shapes.
- **Hand-drawn strokes / underlines / circles**: **Rough.js** (https://roughjs.com) renders
  sketchy SVG programmatically — perfect for that "annotated by hand" studio touch.
- **Wavy dividers / section shapes**: **Get Waves** (https://getwaves.io),
  **Shape Divider App** (https://www.shapedivider.app).

### Grab them (packs — mind the license, recolor to fit)

- **SVG Repo** — https://www.svgrepo.com — enormous free SVG library incl. stars, sparkles,
  arrows, badges, doodles; filter by license (many CC0/MIT, some not — check per icon).
- **Phosphor** (https://phosphoricons.com, MIT) and **Iconoir** (https://iconoir.com, MIT) —
  have clean stars, sparkles, asterisks, arrows in multiple weights; use the bold weights.
- **Reshot** (https://www.reshot.com) — free-for-commercial icons/illustrations, doodle-friendly.
- **Sticker/doodle packs**: search Figma Community for "sticker pack" / "doodle" / "brutalist
  elements" (editable, license varies — check the file), and **Open Doodles**
  (https://www.opendoodles.com, CC0) for hand-drawn marks.

**Discipline note:** whatever you grab, force it into your 3–4 device vocabulary and your
palette. A page with one star style used ten times reads as a brand; a page with ten
different stars reads as clip-art.

---

## 3. Grain / riso / halftone / noise

Texture is what makes bold color feel like *print*, not a flat web gradient. **Generate it in
SVG/CSS** wherever possible — near-zero weight, tweakable, and it unifies the whole page.

- **Grain / film noise**: inline SVG `feTurbulence` overlay at low opacity (code in
  `graphic-devices.md`). The single most useful texture; almost never needs to be a PNG.
- **Grainy gradients**: CSS gradient + noise overlay for that matte-print look —
  https://grainy-gradients.vercel.app, technique at https://css-tricks.com/grainy-gradients/.
- **Halftone / dots**: SVG filter or a repeating radial-gradient; gives the comic/riso dot
  texture. Code in `graphic-devices.md`.
- **Riso / duotone effect**: two-color duotone via CSS `mix-blend-mode` + a color layer, or
  SVG `feColorMatrix`. Reproduces the risograph two-ink look without a texture file.
- **Raster texture (only when a real scan is the point)**: **Texturelabs**
  (https://texturelabs.org — free, ink/paper/grain/riso scans), **Textures.com**
  (https://www.textures.com — free tier limited, check per-asset license). Tile a small
  optimized WebP; never a full-bleed PNG.

---

## 4. Bright color & palettes

Bold color reads as confident **only when bounded** — 1–2 loud brand colors, a strong dark, a
paper/off-white, maybe one secondary. Build the palette, then test it on a real layout and
against contrast (bright palettes fail WCAG easily).

- **Coolors** — https://coolors.co — generate/lock/explore; extract a palette from an image.
- **Huemint** — https://huemint.com — AI palettes with brand context; good at bold, non-muddy combos.
- **Realtime Colors** — https://www.realtimecolors.com — paste the palette onto a live mock
  layout and judge it in context, not in a swatch strip. Essential sanity check.
- **ColorHunt** (https://colorhunt.co) and **Happy Hues** (https://www.happyhues.co) — curated
  bold/retro palettes with real usage examples.
- **Adobe Color** — https://color.adobe.com — extract-from-image + harmony rules; CC sync.

**Contrast (accessibility bar):** **APCA** — https://www.myndex.com/APCA/ (modern perceptual,
better for big display type) and **WebAIM** — https://webaim.org/resources/contrastchecker/
for the standard WCAG figure. Loud color on loud color is a frequent failure — check it.

---

## 5. Hand-drawn illustration

Character illustration — mascots, spot drawings, scenes. Open sets are fine as a base, but
**recolor into the palette** so they read as yours, not borrowed.

- **unDraw** — https://undraw.co — open-source, recolor to any hex on the fly (MIT-ish; free
  commercial, no attribution). The default first stop.
- **Open Doodles** — https://www.opendoodles.com — CC0 hand-drawn people/marks.
- **Humaaans** — https://www.humaaans.com — mix-and-match people illustrations (free).
- **Storyset** — https://storyset.com (by Freepik) — editable, some animated; **check
  attribution terms** (free tier often requires credit).
- **DrawKit** (https://www.drawkit.com), **Absurd Design** (https://absurd.design — surreal,
  distinctive), **Icons8 Ouch** (https://icons8.com/illustrations), **Blush**
  (https://blush.design) — mixed free/paid, check per-set license.
- **AI illustration** (when you need a specific style/subject): generate, then recolor and add
  grain to fit. Rights posture is evolving — see the AI note in `licensing.md` and confirm the
  tool's current commercial terms.

---

## 6. Inspiration galleries — reference the *logic*, not the files

Where the bold studios get seen. Use these to study composition, device usage, and motion —
never to copy assets or layouts. Source original equivalents.

- **Godly** — https://godly.website — curated bold/experimental web design.
- **Awwwards** — https://www.awwwards.com — the benchmark; filter by "bold"/"typography".
- **Land-book** (https://land-book.com), **SiteInspire** (https://www.siteinspire.com),
  **Httpster** (https://httpster.net), **Minimal Gallery** (https://minimal.gallery).
- **Savee** (https://savee.it) and **Cosmos** (https://www.cosmos.so) — mood/asset boards the
  designers themselves use for visual research.
- **Dribbble** / **Behance** — brand and packaging references (the graphic-device vocabulary
  often comes straight from packaging design).

Studying a reference to understand *why* it works — the tight device kit, the one loud font,
the consistent grain — and then building your own version is the whole point. Lifting its SVGs
or fonts is not.
