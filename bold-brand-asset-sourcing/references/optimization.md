# Asset Optimization & Self-Hosting

Punch is no excuse for bloat. The bold look's advantage is that most of it — devices, grain,
halftone, riso — is **SVG/CSS you generate**, which weighs almost nothing. The weight risks
are: unoptimized raster (illustration exports, textures, any photo), heavy or duplicated fonts,
PNG sticker packs, and unnecessary motion libraries. This file is the prep pipeline. Helper
scripts are in `../scripts/`.

## Fonts (usually the heaviest render-blocking asset)

### Self-host — don't hotlink

Download the font (Velvetyne, Google Fonts, Fontshare, or your paid foundry files) and serve
from your own domain: faster, private, portable.

### Subset to the glyphs you use

A full display face ships thousands of glyphs for a hero using ~120. Subset it.

**pyftsubset** (fonttools — precise, standard):
```bash
pip install fonttools brotli
pyftsubset Display.ttf \
  --unicodes="U+0000-00FF,U+0100-017F,U+2000-206F,U+20AC,U+2605,U+2726,U+2733,U+2736" \
  --layout-features='kern,liga,calt' --flavor=woff2 \
  --output-file=Display-subset.woff2
```
The extra star/sparkle codepoints (★ ✦ ✳ ✶) keep the glyphs you use as devices. The Latin
range covers Spanish incl. ñ/á/é/í/ó/ú/ü. Use `../scripts/subset-font.sh` for the common case.

**glyphhanger** auto-detects used glyphs from built HTML (tighter):
```bash
npm i -g glyphhanger
glyphhanger ./dist --subset='fonts/*.ttf' --formats=woff2 --whitelist=U+0020-00FF
```

### Serve it right

```css
@font-face{
  font-family:"Le Murmure"; src:url("/fonts/le-murmure-subset.woff2") format("woff2");
  font-weight:400; font-display:swap; font-style:normal;
}
```
```html
<link rel="preload" href="/fonts/le-murmure-subset.woff2" as="font" type="font/woff2" crossorigin>
```
- **woff2 only**, **minimal weights** (one loud display weight is often enough), **variable
  fonts** to collapse weights into one file, **`font-display:swap`**, **preload only the LCP
  display face** — not every font.

## Devices, grain, halftone, riso — keep them SVG/CSS

Everything in `graphic-devices.md` is near-zero weight when kept as inline SVG / CSS. Resist
the urge to export a device as a PNG "to be safe" — you lose recolor, crispness, and animation,
and gain KB. Run any hand-authored SVG through **svgo**:
```bash
npx svgo device.svg -o device.min.svg
```

## Raster (illustration exports, textures, photos)

When an asset must be raster, optimize hard:
```bash
# AVIF + WebP, sized to display, metadata stripped — see scripts/optimize-images.sh
npx @squoosh/cli --avif '{}' --resize '{"width":1200}' illus.png -d ./dist
npx @squoosh/cli --webp '{"quality":80}' --resize '{"width":1200}' illus.png -d ./dist
oxipng -o 4 --strip safe flat.png   # if it truly must stay PNG
```
- Prefer **SVG** for illustration when the source offers it (unDraw, Humaaans do) — infinitely
  crisp, recolorable, tiny.
- Set `width`/`height` on every `<img>` (or an aspect-ratio box) → zero layout shift.
- Lazy-load below-the-fold images; keep the hero eager (`fetchpriority="high"`).

## Motion payload

- **One animation stack.** GSAP (+ ScrollTrigger/SplitText) and Lenis cover essentially
  everything here — don't also pull in a second animation library for one effect. Marquees are
  pure CSS; don't import a marquee lib.
- **Load plugins you use**, not the whole GSAP bundle blindly. Tree-shake with npm imports.
- **Gate every animation behind `prefers-reduced-motion`** (see `motion.md`) — an accessibility
  requirement, and it also means reduced-motion users skip the JS work entirely.

## Pre-launch checklist

- [ ] Fonts self-hosted, subset, woff2, `font-display:swap`, minimal weights.
- [ ] Only the LCP display font is preloaded.
- [ ] Devices/grain/halftone/riso are inline SVG/CSS, not PNG; SVGs run through svgo.
- [ ] Any raster is AVIF/WebP, sized to display, metadata stripped; SVG illustration preferred.
- [ ] Every `<img>` has width/height (or aspect-ratio) → no layout shift.
- [ ] Hero eager + `fetchpriority="high"`; the rest lazy.
- [ ] One animation stack (GSAP + Lenis); marquee is CSS; no duplicate libs.
- [ ] All motion no-ops under `prefers-reduced-motion`.
- [ ] `ASSETS.md` updated; license/purchase files present (esp. the paid font invoice).
