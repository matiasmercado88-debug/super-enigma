---
name: immersive-web-sourcing
description: >-
  Source the tools, assets, and technique for immersive, spatial, WebGL/3D-driven web
  experiences — scroll-as-camera-movement, cinematic depth, particle and shader work,
  product showcases that make a browser feel like a space rather than a document. Use for
  a product launch needing real presence, cinematic scrollytelling with camera movement, a
  generative/particle background, a 3D hero object, or anything described as "immersive",
  "3D interactivo", "WebGL", or "que se sienta como estar ahí". Also use to choose a 3D
  engine (Three.js/React Three Fiber, Babylon.js, Spline), source 3D models/HDRIs/textures
  with the right license, decide the WebGPU-vs-WebGL fallback strategy, and set a real
  performance/polycount budget. Do NOT use when content is mainly textual without a spatial
  reason, when the audience skews low-end devices without room for a real fallback, when
  load-time is critical, or when another register in this family fits better.
---

# Immersive Web Sourcing

This is the register that makes the browser feel like a space instead of a page: 3D
objects you orbit, a camera that moves as you scroll, particle fields, cinematic lighting
and depth. It's the most technically demanding style in this family, and the one where
ambition and exclusion are most directly in tension — which is exactly what this skill's
governing rule is built around.

## The trap this exists to avoid

Every other skill in this family has a failure mode about looking wrong (clutter, drift,
brokenness). This one has a failure mode about being **unreachable**: the same techniques
that make a site feel spatially alive — heavy 3D scenes, GPU-bound shaders, scroll-hijacked
camera movement — are also what makes it slow on a mid-range phone, nauseating for anyone
with vestibular sensitivity, and often literally invisible to a screen reader or a keyboard-
only visitor, since the "content" frequently lives entirely inside a `<canvas>` with nothing
else behind it. The more spectacular and "present" an immersive site becomes for the person
it was designed and tested on, the more likely it's quietly excluding a large slice of real
visitors. That's not a minor polish item to fix at the end — it has to be designed in from
the first decision, or it doesn't get fixed at all.

## When to use / not use

**Use when** the brief genuinely benefits from spatial presence: a product launch that wants
to feel like you're handling the object, cinematic scrollytelling with camera movement
through a scene, a generative/particle art piece, an agency or studio portfolio
demonstrating real 3D/WebGL capability, or anything explicitly asking for "immersive,"
"3D interactivo," or "que se sienta como estar ahí."

**Do not use when** the content is mainly textual or transactional and doesn't have a real
spatial reason to exist in 3D, when the realistic audience skews toward low-end devices or
constrained data plans without budget for a genuinely good fallback, when fast load time is
non-negotiable (checkout flows, documentation, anything utility-first), or when one of the
sibling skills' registers actually fits better — quiet photography-led editorial
(`editorial-layered-landing`), confident graphic devices (`bold-brand-asset-sourcing`),
character-led warmth (`illustrated-narrative-sourcing`), or raw honesty
(`brutalist-web-sourcing`).

## The rule that governs everything

**Fallback first, then spectacle, then budget.** Design and build the accessible,
low-bandwidth, reduced-motion path *before* or *alongside* the 3D spectacle, not as a patch
applied afterward — a fallback bolted on at the end is usually thin and usually skipped
under deadline pressure. Once the fallback exists, spend the spectacle budget freely. Then
hold every asset to a hard, decided-in-advance performance budget (polycount, texture size,
draw calls) — an experience that's stunning on the developer's machine and unusable on a
real visitor's mid-range phone hasn't actually shipped the "immersive" experience, it's
shipped a demo reel that works for whoever has the same hardware.

## Workflow

### 0. Retrofitting onto an existing site?

The retrofit audit in `bold-brand-asset-sourcing/references/retrofitting-existing-sites.md`
applies here too — existing CSS variables/theme mechanism, CSP (WebGL/WebGPU bundles are
large; check script-src and connect-src if models or textures load from a CDN), existing
scroll systems to coordinate with rather than fight, single- vs. multi-page structure.

### 1. Define the immersive system — including the fallback — before building anything

Lock this as a real spec, the same discipline as the other skills in this family, with one
addition that's unique to this one: the fallback is part of the spec, not an afterthought.

- **Primary engine**: Three.js/React Three Fiber for custom code-first control, Babylon.js
  for a more batteries-included engine, Spline for faster no-code-leaning builds when the
  scene is simpler, PlayCanvas for a more game-engine-like editor workflow. See `sources.md`
  for current fit notes.
- **Narrative arc**: for scroll-driven camera movement, storyboard the "beats" like a short
  film first — what the camera sees at scroll 0%, 25%, 50%, 100% — before writing any camera
  code. Building the camera path without a storyboard is how these scenes end up meandering.
- **Mood and lighting**: cinematic-dark-and-dramatic vs. bright-and-vibrant, decided once and
  applied consistently across every scene, lighting rig, and material.
- **Performance budget, decided up front, not discovered at the end**: a target frame rate,
  a maximum polygon count, a maximum texture memory footprint, a maximum number of active
  particles. Write the numbers down before sourcing or building a single asset — see
  `optimization.md`.
- **The accessible/fallback path, decided now**: what does a keyboard-only visitor, a screen-
  reader user, someone with `prefers-reduced-motion` set, and someone on a slow connection or
  low-end device actually get? A static hero image plus real text content, a simplified
  non-scroll-hijacked version, or a "skip the experience" link into a plain page are all
  valid answers — "nothing, they just don't get the site" is not. See
  `accessibility-and-fallback.md` before writing any 3D code.

### 2. Source per category

Full catalog in `sources.md`. Short version: Three.js/React Three Fiber or Babylon.js for
the engine; Sketchfab, Poly Haven, and Quaternius for models/HDRIs/textures (mind the
license per asset — very mixed on Sketchfab specifically); Shadertoy for shader *reference
and learning*, not copy-paste production use without understanding what it does; tsParticles
for particle systems without hand-rolling one; GSAP ScrollTrigger + Lenis (already covered in
`bold-brand-asset-sourcing/motion.md`) or Theatre.js for scroll-synced camera choreography.

### 3. Select and build for narrative fit and a real performance budget

Reject any asset — a model, a texture, a shader effect — that blows the budget locked in
step 1, no matter how good it looks in isolation. A gorgeous 2-million-polygon model that
tanks frame rate on a mid-range phone is the wrong asset for a web experience, full stop.

### 4. Build and verify the accessible fallback — the gate that matters most here

This is the equivalent of the legibility gate in `brutalist-web-sourcing` — the thing to
protect above almost everything else. Full detail in `accessibility-and-fallback.md`:
real alternative content (not just an empty canvas) for screen readers and no-JS visitors,
camera-movement handling under `prefers-reduced-motion` (this is a genuine vestibular-safety
issue, not just a preference), and a real low-end-device path, not a hope that everyone has
a recent GPU.

### 5. Clear rights on 3D assets, textures, and audio

More varied than the other skills in this family — 3D model marketplaces mix CC0, CC-BY,
CC-BY-NC, and paid-store licenses within the same platform. Full detail in
`rights-and-licensing.md`.

### 6. Optimize hard — this is not optional here

Compress meshes (Draco) and textures (KTX2/Basis Universal), keep an eye on draw calls,
lazy-load the 3D bundle so it only loads on the pages/interactions that need it, and use the
WebGPU-with-automatic-WebGL2-fallback pattern now supported natively in Three.js (r171+) and
Babylon.js rather than betting the whole experience on one API's current browser coverage.
See `optimization.md` for the current state and commands.

### 7. Hand off with the performance budget and fallback description included

The deliverable here includes two things beyond the usual asset manifest: the performance
budget actually hit (polycount, texture memory, measured frame rate on a real mid-range
device — not just the dev machine), and a plain description of what the accessible fallback
actually shows. Both are what let this experience be maintained and defended later, not just
shipped once and left as a black box.

## Reference files

- `sources.md` — 3D engines and their current fit, model/HDRI/texture sources, shader and
  particle libraries, scroll-camera-choreography tools, and the current WebGPU/WebGL browser-
  support picture.
- `spatial-devices.md` — how to build the core techniques with code: a scroll-driven camera
  path, parallax depth layers, a basic particle background, and a WebGPU-renderer-with-
  automatic-WebGL2-fallback setup.
- `accessibility-and-fallback.md` — the central gate: alternative content for screen readers
  and no-JS visitors, `prefers-reduced-motion` handling for camera movement specifically
  (vestibular safety, not just preference), and designing for low-end devices as an
  accessibility question, not just a performance one.
- `rights-and-licensing.md` — 3D model and HDRI/texture license families (mixed per-asset on
  marketplaces like Sketchfab), audio licensing if used, and engine licensing. Guidance, not
  legal advice.
- `optimization.md` — mesh and texture compression (Draco, KTX2/Basis Universal), draw-call
  and polycount budgeting, lazy-loading the 3D bundle, and the current WebGPU-with-fallback
  migration pattern.
