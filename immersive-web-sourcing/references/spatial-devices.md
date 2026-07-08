# Building the Spatial Devices

The core techniques that make a site feel spatial rather than flat, with starting-point
code. As with the other skills in this family, understanding *why* a technique works
matters more than the snippet — adapt these to the actual scene, don't paste blindly.

**Contents:** scroll-driven camera path · parallax depth layers · basic particle
background · WebGPU renderer with automatic WebGL2 fallback.

---

## Scroll-driven camera path

Storyboard the beats first (see SKILL.md step 1), then drive the camera's position and
look-at target from scroll progress via GSAP ScrollTrigger, keeping Lenis as the single
source of truth for scroll position so nothing desyncs:

```js
import gsap from "gsap";
import ScrollTrigger from "gsap/ScrollTrigger";
gsap.registerPlugin(ScrollTrigger);

// camera path defined as keyframes at % of scroll progress
const path = [
  { p: 0,    pos: [0, 1, 5],  look: [0, 0, 0] },
  { p: 0.5,  pos: [3, 2, 2],  look: [0, 1, 0] },
  { p: 1,    pos: [0, 4, -2], look: [0, 0, 0] },
];

ScrollTrigger.create({
  trigger: "#scene-wrapper",
  start: "top top",
  end: "bottom bottom",
  scrub: 1,               // ties directly to scroll, not an independent timeline
  onUpdate: (self) => {
    const t = self.progress;               // 0..1
    const { pos, look } = interpolatePath(path, t);   // your own lerp between keyframes
    camera.position.set(...pos);
    camera.lookAt(...look);
  },
});
```

Keep `scrub` tied directly to scroll progress (not a separately-timed animation) so the
camera never runs ahead of or behind what the visitor is actually doing — a camera that
seems to have "a mind of its own" independent of scroll input is one of the fastest ways
to make a 3D scroll experience feel broken rather than magical.

---

## Parallax depth layers (lighter alternative when full 3D isn't justified)

Plain CSS/JS depth illusion for scenes that don't need a real 3D engine:

```css
.depth-layer { position: absolute; inset: 0; will-change: transform; }
```
```js
window.addEventListener("scroll", () => {
  const y = window.scrollY;
  document.querySelectorAll(".depth-layer").forEach((el) => {
    const speed = parseFloat(el.dataset.speed || "0.5"); // 0 = fixed, 1 = normal scroll
    el.style.transform = `translateY(${y * speed}px)`;
  });
}, { passive: true });
```
Drive this from `lenis.on('scroll', ...)` instead of the native listener if Lenis is
already running on the page — see the retrofit note in `bold-brand-asset-sourcing`.

---

## Basic particle background (tsParticles)

```js
import { tsParticles } from "@tsparticles/engine";
import { loadSlim } from "@tsparticles/slim";

await loadSlim(tsParticles);
await tsParticles.load({
  id: "particles-bg",
  options: {
    particles: {
      number: { value: 80 },       // keep this inside the polycount/particle budget from step 1
      move: { enable: true, speed: 0.6 },
      size: { value: 2 },
      opacity: { value: 0.4 },
    },
    detectRetina: true,
  },
});
```
Cap the particle count to the budget decided in SKILL.md step 1 — it's the single easiest
number to quietly let creep upward during development, and the first thing that tanks frame
rate on a mid-range device.

---

## WebGPU renderer with automatic WebGL2 fallback

The current recommended pattern (Three.js r171+) — two lines different from the classic
WebGL-only setup, with the fallback handled for you:

```js
// Classic, WebGL-only:
// import * as THREE from "three";
// const renderer = new THREE.WebGLRenderer();

// Current recommended pattern — WebGPU primary, automatic WebGL2 fallback:
import * as THREE from "three/webgpu";
const renderer = new THREE.WebGPURenderer();
```

Verify this against Three.js's current documentation before shipping — the exact import
path and API can shift between releases, and this is exactly the kind of specific,
fast-moving detail worth double-checking rather than assuming from memory.

## Discipline reminder

Same instinct as every other skill here: pick a small number of these techniques and
execute them well, rather than stacking a camera path, heavy particles, and multiple
shader effects into one scene. The immersive feeling comes from one coherent spatial idea
executed cleanly, not from maximizing how many techniques appear on screen at once.
