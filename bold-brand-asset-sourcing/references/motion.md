# Motion — the "feel"

The bold-studio feel is as much *motion* as visuals: a page that glides on scroll, a
marquee running across a band, headlines that assemble as they enter. This file covers the
libraries and patterns, all free for commercial use, all gated behind `prefers-reduced-motion`.

Keep it intentional: pick a ceiling in the kit spec (a common baseline is **smooth scroll +
one marquee + type reveals**) and don't exceed it. Motion that exists only to show off is on
the aesthetic's "avoid" list even here.

**Contents:** smooth scroll (Lenis) · GSAP + ScrollTrigger · animated split text · CSS
marquee/ticker · reduced-motion.

---

## Smooth scroll — Lenis

The glide underneath most studio sites. Tiny, framework-agnostic, free (MIT), by Darkroom
(ex-Studio Freight). https://github.com/darkroomengineering/lenis

```bash
npm i lenis
```
```js
import Lenis from "lenis";

const lenis = new Lenis({ duration: 1.1, smoothWheel: true });
function raf(t){ lenis.raf(t); requestAnimationFrame(raf); }
requestAnimationFrame(raf);

// Respect the user's preference — turn it off entirely if they asked for less motion.
if (matchMedia("(prefers-reduced-motion: reduce)").matches) lenis.destroy();
```
Don't overdo `duration` — past ~1.3 it feels laggy, not smooth. If you use GSAP ScrollTrigger,
sync them: call `lenis.on("scroll", ScrollTrigger.update)` and drive Lenis from GSAP's ticker.

---

## GSAP + ScrollTrigger — scroll choreography

GSAP is now **100% free including all plugins (ScrollTrigger, SplitText, MorphSVG, DrawSVG,
ScrollSmoother), even commercial**, since April 2025 (Webflow). No Club license needed.
https://gsap.com — `npm i gsap`.

```js
import gsap from "gsap";
import ScrollTrigger from "gsap/ScrollTrigger";
gsap.registerPlugin(ScrollTrigger);

gsap.utils.toArray(".reveal").forEach((el) => {
  gsap.from(el, {
    y: 40, autoAlpha: 0, duration: 0.8, ease: "power3.out",
    scrollTrigger: { trigger: el, start: "top 85%" }
  });
});
```
Use `gsap.matchMedia()` to disable or simplify animations under reduced-motion in one place:

```js
const mm = gsap.matchMedia();
mm.add("(prefers-reduced-motion: no-preference)", () => {
  /* register the fancy scroll animations only here */
});
```
That way, users who ask for less motion simply never get the animations registered — the
cleanest possible reduced-motion story.

---

## Animated split text (headlines that assemble)

The signature "each letter/word rises in" headline. GSAP **SplitText** (now free, rewritten
2025, 50% smaller):

```js
import SplitText from "gsap/SplitText";
gsap.registerPlugin(SplitText);

const split = SplitText.create(".headline", { type: "chars, words" });
gsap.from(split.chars, {
  yPercent: 120, autoAlpha: 0, stagger: 0.02, duration: 0.7, ease: "power4.out",
  scrollTrigger: { trigger: ".headline", start: "top 80%" }
});
```
Free-standing alternative if you don't want GSAP: **SplitType** (https://github.com/lukePeavey/SplitType,
MIT) to split, then animate with CSS/GSAP. Accessibility note: SplitText's 2025 rewrite keeps
the text readable to screen readers — but always confirm the accessible text stays intact when
you split, and skip the effect under reduced-motion.

---

## Marquee / ticker (running text band)

Pure CSS, no library. Duplicate the content so the loop is seamless.

```html
<div class="marquee" aria-hidden="true">
  <div class="marquee__track">
    <span>DISEÑO&nbsp;★&nbsp;MARCA&nbsp;★&nbsp;WEB&nbsp;★&nbsp;</span>
    <span>DISEÑO&nbsp;★&nbsp;MARCA&nbsp;★&nbsp;WEB&nbsp;★&nbsp;</span>
  </div>
</div>
```
```css
.marquee{overflow:hidden;white-space:nowrap}
.marquee__track{display:inline-flex;animation:marquee 22s linear infinite}
.marquee__track span{font-family:"Your Display";font-size:2rem;font-weight:700}
@keyframes marquee{to{transform:translateX(-50%)}}
.marquee:hover .marquee__track{animation-play-state:paused}
@media (prefers-reduced-motion:reduce){.marquee__track{animation:none}}
```
Mark it `aria-hidden` if it's decorative (repeated words); if it carries real content, provide
a static accessible copy. For scroll-direction-reactive speed, drive it with GSAP + ScrollTrigger.

---

## Pinned panel sequence (bounded — panels advance while the section stays put)

The section pins in place on screen; scrolling doesn't move the page, it advances which
panel is showing. When the last panel has passed, the pin releases and the page continues
normally. `snap` keeps it from ever stopping mid-transition.

```js
gsap.registerPlugin(ScrollTrigger);

const panels = gsap.utils.toArray(".panel");

const tl = gsap.timeline({
  scrollTrigger: {
    trigger: "#gallery",
    start: "top top",
    end: () => "+=" + panels.length * 1000,  // fixed scroll range, sized to panel count
    pin: true,
    scrub: 1,
    snap: 1 / (panels.length - 1),
  }
});

panels.forEach((panel, i) => {
  if (i > 0) {
    tl.fromTo(panel, { autoAlpha: 0, x: 100 }, { autoAlpha: 1, x: 0, ease: "none" });
  }
});
```

**Use it with criterio — this is scroll-jacking, done well or done badly.** Pinning hands
control of what "scrolling" does to the code instead of the browser's native behavior. Used
well (a numbered process, a small case-study sequence, three or four panels) it feels
purposeful. Used on every section of a page, or with too many panels crammed into one pin,
it feels like the page is fighting the visitor's scroll — the exact complaint GSAP's own
docs acknowledge snapping is the closest thing to. Rules of thumb:
- **One, maybe two pinned sequences per page.** Reserve it for the moment that's actually
  rhythmic or sequential — not a default treatment for every section.
- **Keep the panel count small** (3–6). A pinned sequence with fifteen panels turns a quick
  scroll into a long, trapped one.
- **Respect `prefers-reduced-motion`**: skip the pin and `scrub` entirely for reduced-motion
  visitors, and just stack the panels as normal static content in document flow — see
  `motion.md`'s reduced-motion section below; this is the one technique in this file where
  falling back to "just show it as a normal list" is genuinely the right reduced-motion
  answer, not a lesser compromise.
- **Test that it actually releases** — confirm the pin ends cleanly and the rest of the page
  scrolls normally afterward; a pin that doesn't release reads as a broken page, not a
  deliberate effect.

A more advanced variant of this same GSAP mechanism makes the sequence loop infinitely
instead of stopping at the last panel (GreenSock's official "Infinite looped panels" demo,
https://demos.gsap.com/demo/infinite-looped-panels/) — it decouples the animation from real
scroll position via a proxy tween so the loop can wrap forever. That's a meaningfully more
complex technique (extra overlap frames, wraparound math) and its own failure mode (getting
disoriented in a loop with no visible end) — reach for the bounded version above by default,
and only go infinite when the content genuinely has no natural "last panel."

---

## Reduced motion — non-negotiable

Every animation here must no-op under `prefers-reduced-motion: reduce`. Three clean patterns:
- **CSS**: wrap keyframe animations so they're `none` in the reduce media query (shown above).
- **GSAP**: register fancy animations only inside `gsap.matchMedia("(prefers-reduced-motion:
  no-preference)")`.
- **Lenis**: `destroy()` it under reduce so native scroll returns.

The content must be fully usable with zero motion — motion is enhancement, never the only way
to read or navigate the page.
