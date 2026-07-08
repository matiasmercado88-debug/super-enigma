# Building the Signature Devices

The bold look is 80% a few graphic devices used with commitment. Most are cheaper, sharper,
and more on-brand **built as inline SVG/CSS** than downloaded as PNGs — they take
`currentColor`, scale crisp, animate, and weigh almost nothing. Copy-paste starting points
below. Recolor everything into the kit palette.

**Contents:** rotating seal · stars/sparkles/asterisks · arrows · squiggle underline ·
hand-drawn strokes (Rough.js) · blobs/waves · grain · halftone · riso/duotone.

---

## Rotating seal / badge (the signature studio device)

Curved text around a circle, in your display font, slowly rotating. Instantly reads
"designed brand."

```html
<svg class="seal" viewBox="0 0 200 200" aria-hidden="true">
  <defs>
    <path id="seal-path"
      d="M100,100 m-72,0 a72,72 0 1,1 144,0 a72,72 0 1,1 -144,0"/>
  </defs>
  <text class="seal-text">
    <textPath href="#seal-path" startOffset="0">
      ★ ESTUDIO CREATIVO ★ DESDE 2020 ★ ESTUDIO CREATIVO ★ DESDE 2020&nbsp;
    </textPath>
  </text>
  <!-- optional center mark -->
  <text x="100" y="112" text-anchor="middle" class="seal-center">✺</text>
</svg>
```
```css
.seal{width:140px;height:140px;animation:seal-spin 18s linear infinite}
.seal-text{font-family:"Your Display",sans-serif;font-size:15px;font-weight:700;
  letter-spacing:.5px;fill:currentColor;text-transform:uppercase}
.seal-center{font-size:34px;fill:currentColor}
@keyframes seal-spin{to{transform:rotate(360deg)}}
@media (prefers-reduced-motion:reduce){.seal{animation:none}}
```
Tune: circle radius via the `72` in the path, text via `startOffset`/font-size. Reverse the
arc sweep flags (`1,1` → `0,0`) to flip text to the inside.

---

## Stars, sparkles, asterisks

Small hand-authored SVGs; recolor with `currentColor`. Use ONE star style, repeated.

```html
<!-- 4-point sparkle -->
<svg class="star" viewBox="0 0 24 24" aria-hidden="true">
  <path d="M12 0 C13 8 16 11 24 12 C16 13 13 16 12 24 C11 16 8 13 0 12 C8 11 11 8 12 0Z"
        fill="currentColor"/>
</svg>
<!-- 5-point classic -->
<svg class="star" viewBox="0 0 24 24" aria-hidden="true">
  <path d="M12 2 15 9 22 9.3 16.5 13.8 18.5 21 12 17 5.5 21 7.5 13.8 2 9.3 9 9Z"
        fill="currentColor"/>
</svg>
<!-- asterisk / burst: just the glyph from your display font, sized big -->
<span class="burst">✳</span>
```
```css
.star{width:1em;height:1em;display:inline-block;vertical-align:middle}
.star--spin{animation:seal-spin 6s linear infinite}
```
Also fine: pull ★ ✦ ✳ ✺ ❋ ✷ directly from the display font — they inherit its personality.

---

## Arrows (hand-pointed, not icon-set generic)

```html
<svg class="arrow" viewBox="0 0 60 24" aria-hidden="true" fill="none"
     stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
  <path d="M2 12 H54 M44 4 L56 12 L44 20"/>
</svg>
```
For a hand-drawn wobble, generate it with Rough.js (below) instead of clean strokes.

---

## Squiggle underline (highlight a word)

```html
<span class="squiggle">importante</span>
```
```css
.squiggle{position:relative;display:inline-block}
.squiggle::after{content:"";position:absolute;left:0;right:0;bottom:-.15em;height:.35em;
  background:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='60' height='12'%3E%3Cpath d='M0 6 Q15 0 30 6 T60 6' stroke='%23ff5c39' stroke-width='3' fill='none'/%3E%3C/svg%3E") repeat-x;
  background-size:auto 100%}
```
Swap the stroke color (`%23ff5c39`) for your accent. This is a pure-CSS, zero-request device.

---

## Hand-drawn strokes with Rough.js (the "annotated" touch)

Rough.js draws sketchy SVG/Canvas programmatically — circles around words, underlines,
highlights, arrows, all with a hand-made wobble. https://roughjs.com — MIT.

```js
import rough from "roughjs";
const svg = document.querySelector("#annot");
const rc = rough.svg(svg);
svg.appendChild(rc.circle(90, 40, 120, {          // circle a headline word
  stroke:"var(--accent)", strokeWidth:3, roughness:2.2, fillStyle:"hachure"
}));
```
Great for one or two accents per page — don't rough-ify everything.

---

## Blobs & waves (background shapes)

Don't hand-plot these — generate and export SVG, then recolor:
- **Blobmaker** — https://www.blobmaker.app — organic blobs.
- **Haikei** — https://haikei.app — blobs, layered waves, corner shapes, low-poly, blurry
  gradients. The workhorse for section backgrounds.
Keep them behind content, low-contrast, in palette — background, not foreground noise.

---

## Grain overlay (unifies the whole page)

The most useful texture. Inline SVG noise, fixed, low opacity — ~0 KB, and it makes flat
color feel printed.

```html
<svg class="grain" aria-hidden="true">
  <filter id="grain"><feTurbulence type="fractalNoise" baseFrequency="0.85"
    numOctaves="2" stitchTiles="stitch"/><feColorMatrix type="saturate" values="0"/></filter>
  <rect width="100%" height="100%" filter="url(#grain)"/>
</svg>
```
```css
.grain{position:fixed;inset:0;width:100%;height:100%;pointer-events:none;
  opacity:.06;mix-blend-mode:multiply;z-index:9}
```
Higher `baseFrequency` = finer grain. Try `mix-blend-mode:overlay` on dark sections.

---

## Halftone dots

Comic/riso dot field via a repeating radial-gradient — pure CSS, no asset.

```css
.halftone{
  background-image:radial-gradient(var(--ink) 22%, transparent 23%);
  background-size:10px 10px;   /* smaller = finer dots */
  background-position:0 0;
}
```
Layer it at low opacity over a color block, or mask it to a shape for a gradient-of-dots.

---

## Riso / duotone (two-ink print look)

Force any image into two brand inks — the risograph signature — with a blend layer, no
texture file:

```html
<div class="riso"><img src="photo.webp" alt="…"></div>
```
```css
.riso{position:relative;filter:grayscale(1) contrast(1.1)}
.riso img{display:block;width:100%;mix-blend-mode:luminosity}
.riso::before{content:"";position:absolute;inset:0;
  background:var(--riso-a);mix-blend-mode:lighten}    /* light ink */
.riso::after{content:"";position:absolute;inset:0;
  background:var(--riso-b);mix-blend-mode:multiply;opacity:.9} /* dark ink */
```
Set `--riso-a`/`--riso-b` to two palette colors. Add the grain overlay on top to complete
the print feel.

---

### Discipline reminder

Pick 3–4 of these, commit, repeat them across the page. The look is built from a *small
vocabulary used often*, not from using all of the above at once.
