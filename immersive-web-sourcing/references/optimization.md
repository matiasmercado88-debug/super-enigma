# Optimization & Performance Budget

Performance discipline is not optional in this skill the way it's a nice-to-have elsewhere
— it's the other half of the accessibility gate in `accessibility-and-fallback.md`. A
budget decided in advance and actually measured against is what separates "immersive" from
"unusable for most real visitors."

## Set the budget before building, and measure against it, not after

Decide these numbers in SKILL.md step 1, before sourcing or building a single asset:

- Target frame rate (commonly 60fps desktop / 30fps as an acceptable mobile floor — decide
  explicitly rather than discovering the real number after the fact).
- Maximum total polygon count for the scene.
- Maximum texture memory footprint.
- Maximum concurrent particle count.
- Maximum initial bundle size for the 3D-related JS/assets.

Then actually measure against these on a real mid-range or older device — a laptop or
phone that isn't the developer's own high-end machine — not just in the browser dev tools'
CPU-throttling simulation, which doesn't fully capture real GPU-bound performance.

## Mesh compression — Draco

```bash
# gltf-transform CLI covers Draco + several other optimizations in one pass
npm i -g @gltf-transform/cli
gltf-transform draco model.glb model-draco.glb
```
Draco compression typically cuts geometry size dramatically with no visible quality loss —
apply it to every production glTF/GLB model rather than shipping raw exported geometry.

## Texture compression — KTX2 / Basis Universal

```bash
gltf-transform etc1s model.glb model-compressed.glb   # or --uastc for higher quality
```
GPU-compressed texture formats (KTX2 containers using Basis Universal encoding) load faster
and use far less GPU memory than raw PNG/JPEG textures baked into a model — meaningfully
more effective than only resizing the source image, since it also stays compressed in GPU
memory at runtime, not just on disk.

## Full optimization pass with gltf-transform

```bash
gltf-transform optimize model.glb model-optimized.glb \
  --compress draco --texture-compress webp
```
`gltf-transform` (https://gltf-transform.dev) bundles mesh simplification, compression, and
texture optimization into one CLI — the practical default pass for any production glTF
asset rather than hand-tuning each step separately.

## Lazy-load the 3D bundle

Don't ship the 3D engine and its assets in the initial page bundle for a page where the
scene isn't immediately visible or needed:

```js
// Load the Three.js scene only when its container enters the viewport,
// or only after the user opts in past a fallback/loading screen.
const { initScene } = await import("./scene.js");
```
This also gives a natural place to branch to the accessible fallback: check device
capability and `prefers-reduced-motion` *before* triggering the dynamic import, and skip
loading the heavy bundle entirely for visitors who are going to see the fallback anyway —
they shouldn't pay the download cost for an experience they won't receive.

## WebGPU with automatic WebGL2 fallback

See `spatial-devices.md` for the current Three.js (r171+) two-line pattern
(`three/webgpu` + `WebGPURenderer`, which falls back to WebGL2 automatically) and
Babylon.js's equivalent (WebGPU supported since v5.0). Don't ship a WebGPU-only experience
today — real gaps remain (older devices, Linux across browsers, some mobile GPUs), and the
fallback path costs little to keep given both major engines handle it natively now.

## Pre-launch checklist

- [ ] Performance budget (frame rate, polycount, texture memory, particle count, bundle
      size) was decided before building, and actually measured on a real mid-range/older
      device — not just simulated in dev tools on a high-end machine.
- [ ] Models run through Draco compression; textures through KTX2/Basis Universal.
- [ ] The 3D bundle lazy-loads, and doesn't load at all for visitors routed to the
      accessible fallback.
- [ ] WebGPU renderer has an automatic WebGL2 fallback, not a WebGPU-only path.
- [ ] Every asset's license is recorded in the provenance manifest
      (`rights-and-licensing.md`).
- [ ] The accessible fallback (`accessibility-and-fallback.md`) was tested as a real path,
      not just built and forgotten.
