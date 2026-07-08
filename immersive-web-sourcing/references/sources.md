# Source Catalog

Where the tools and raw materials for immersive/3D web experiences come from. This is the
most technically varied catalog in the family — engines, not just assets — so fit notes
matter as much as URLs here.

**Contents:** 1. 3D engines & frameworks · 2. Models, HDRIs & textures · 3. Shaders &
particles · 4. Scroll/camera choreography · 5. The current WebGPU/WebGL picture

---

## 1. 3D engines & frameworks

- **Three.js** — https://threejs.org — the dominant web 3D library (millions of weekly
  downloads), MIT-licensed. The default choice for code-first control. Since r171 it ships
  a `WebGPURenderer` with **automatic fallback to WebGL2** on browsers/devices that don't
  support WebGPU — a two-line migration from the classic `WebGLRenderer` (see
  `optimization.md`). Steep-ish API; most real projects use it through a wrapper.
- **React Three Fiber** — https://docs.pmnd.rs/react-three-fiber — a React renderer for
  Three.js; makes scene graphs declarative and composable, the natural choice if the rest
  of the site is React/Next.js. Pairs with **drei** (https://github.com/pmndrs/drei), a
  large library of ready-made helpers (orbit controls, environment maps, text-in-3D, etc.)
  that saves a lot of boilerplate.
- **Babylon.js** — https://www.babylonjs.com — Apache-2.0, a more batteries-included engine
  than Three.js (built-in physics, a scene inspector/debugger, a visual node-material
  editor). Has supported WebGPU since v5.0 and rewrote its core shaders in native WGSL more
  recently — a strong alternative when the project wants more out-of-the-box tooling rather
  than assembling everything from smaller pieces.
- **Spline** — https://spline.design — browser-based, faster for simpler scenes and for
  designers without a 3D-engineering background; exports to React/Next.js/Webflow/Framer.
  **Pricing note (verify current terms):** free tier is limited (a small number of files)
  and free web exports carry a watermark — budget for a paid plan before promising a
  client a "free" Spline hero, same caveat as in `illustrated-narrative-sourcing`.
- **PlayCanvas** — https://playcanvas.com — a more game-engine-style editor workflow (open
  scene editor, asset pipeline, entity-component system); worth considering when the team
  is more comfortable in a game-engine mental model than a code-first one.

Pick one engine and commit — mixing two 3D engines on the same page is a real performance
and bundle-size cost, not just a style inconsistency.

---

## 2. Models, HDRIs & textures

- **Sketchfab** — https://sketchfab.com — the largest 3D model marketplace; **licenses
  vary per model** — CC0, CC-BY, CC-BY-NC, a "Standard"/"Editorial" license, and a paid
  Store tier all exist side by side on the same platform. Check every model's individual
  license page before using it commercially; don't assume the platform's general reputation
  covers a specific download.
- **Poly Haven** — https://polyhaven.com — CC0 (public domain), free for any use including
  commercial, no attribution required: HDRIs (environment lighting), textures, and a growing
  library of free 3D models. The safest first stop for lighting/environment assets.
- **Quaternius** — https://quaternius.com — free, low-poly 3D model packs (CC0), well-suited
  to stylized/lightweight scenes rather than photoreal ones — a good fit when the performance
  budget is tight.
- **Kenney** — https://kenney.nl — free game-asset packs (CC0), heavily used for lightweight
  stylized 3D and 2D game-adjacent assets; useful for particle sprites and simple props too.

---

## 3. Shaders & particles

- **Shadertoy** — https://www.shadertoy.com — the standard reference and learning resource
  for GLSL shaders. Treat it as a **learning and reference** resource, not a copy-paste
  production source — understand what a shader does before shipping it, both because
  license terms on individual Shadertoy entries vary and because an unoptimized reference
  shader is rarely tuned for real-world performance budgets.
- **tsParticles** — https://particles.js.org — a maintained, actively-developed particle
  system library (the modern continuation of the older particles.js), MIT-licensed, works
  standalone or with React/Vue/Svelte wrappers. The practical default for a particle
  background rather than hand-rolling one.
- **OGL** — https://github.com/oframe/ogl — a minimal WebGL library, much lighter than
  Three.js, worth considering when the scene genuinely only needs a small custom shader
  effect and the full weight of a general-purpose 3D engine isn't justified.

---

## 4. Scroll / camera choreography

- **GSAP + ScrollTrigger** — see `bold-brand-asset-sourcing/references/motion.md` — free
  including all plugins, the standard way to tie scroll position to a Three.js/Babylon.js
  camera's position and rotation.
- **Lenis** — see the same file — smooth scroll that should drive the same scroll value
  feeding the camera choreography, so the visual scroll and the camera movement stay in
  sync rather than fighting each other.
- **Theatre.js** — https://www.theatrejs.com — a proper keyframe-based animation/sequencing
  tool with a visual editor, purpose-built for choreographing complex camera and object
  animation over time (including scroll-scrubbed sequences) with far more control than
  hand-written tweens once a scene has more than a couple of animated beats.

---

## 5. The current WebGPU / WebGL picture

Worth checking at the start of any new project, since this changes fast:

- As of 2026, **WebGPU has broad support across all four major browser engines** — Chrome/
  Edge (since Chrome 113), Firefox (rolling out since 141+ on Windows, later on Mac), and
  Safari (26+ on macOS Tahoe, iOS 26, iPadOS 26, visionOS 26). Real gaps remain on Linux
  across browsers and on older/lower-tier Android GPUs — **verify current support figures**
  rather than assuming universal coverage, since this is still actively rolling out.
  WebGPU's real advantage is compute-heavy work (large particle systems, physics, ML
  inference) and a cleaner architecture than WebGL's aging OpenGL-based design.
- **Use WebGPU with an automatic WebGL2 fallback, not WebGPU alone.** Both Three.js (r171+)
  and Babylon.js (v5.0+) support this natively — see `optimization.md` for the Three.js
  migration snippet. Betting the whole experience on WebGPU support today still excludes a
  real slice of visitors (older devices, Linux users, browsers with it behind a flag).
