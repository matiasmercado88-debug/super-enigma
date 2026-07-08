# Asset Optimization & Self-Hosting

Character and scene illustration have their own weight profile, distinct from photography
or fonts. This is the prep pipeline; it assumes the general self-hosting/performance
context in `bold-brand-asset-sourcing/optimization.md` and adds what's specific here.

## Format choice

- **SVG** — the default for flat vector character illustration. Recolorable via
  `currentColor`, crisp at any size, animatable, and typically tiny. Run any exported SVG
  through `svgo` to strip editor cruft:
  ```bash
  npx svgo character.svg -o character.min.svg
  ```
- **Raster (AVIF/WebP)** — only for painterly, textured, or 3D-rendered scenes that
  genuinely can't be vector. Size to actual display dimensions, strip metadata, and lazy-load
  anything below the fold:
  ```bash
  npx @squoosh/cli --avif '{}' --resize '{"width":1200}' scene.png -d ./dist
  npx @squoosh/cli --webp '{"quality":80}' --resize '{"width":1200}' scene.png -d ./dist
  ```
- **Lottie JSON** — already lightweight by nature; avoid embedding unnecessarily large
  raster images inside a Lottie file (a common bloat source when an After Effects comp
  includes a photo layer) — keep Lottie compositions to vector shapes and simple fills where
  possible.
- **Rive `.riv`** — compact binary format; the main weight concern is the runtime player
  library itself (`rive.js` / the platform-specific runtime), so load it only on pages that
  actually use a Rive character, not globally.

## Multi-pose / multi-state characters

A character with several poses or expressions (like Pepper's own hover-state SVG) is best
consolidated rather than shipped as many separate files:

- **Single SVG, toggled layers**: put every pose/state as a group inside one SVG file,
  hidden by default, toggled via a CSS class or `data-` attribute — one file, one request,
  and trivially easy to keep every state in sync stylistically (see `character-consistency.md`).
- **Sprite sheet** (for raster only): consolidate multiple raster poses into one image and
  position via `background-position` or CSS `clip-path`, rather than one HTTP request per
  pose.

## Self-hosting

Same principle as the sibling skills: self-host rather than hotlink where practical. This
matters less for illustration assets themselves (they're usually already self-hosted files,
not a third-party embed) and more for **motion libraries** — `lottie-web` and any Rive
runtime should be bundled/self-hosted like GSAP or Lenis, respecting whatever CSP the site
has (see the retrofit checklist in `bold-brand-asset-sourcing/retrofitting-existing-sites.md`).

## Pre-launch checklist

- [ ] Character/scene illustrations are SVG where possible; raster only where genuinely
      necessary, and optimized (AVIF/WebP, sized to display, metadata stripped).
- [ ] Multi-pose characters consolidated (one SVG with toggled layers, or a sprite sheet) —
      not many separate small files.
- [ ] Lottie compositions contain vector shapes, not embedded raster bloat.
- [ ] Motion libraries (Lottie player, Rive runtime) are self-hosted/bundled per the site's
      CSP, loaded only on pages that use them.
- [ ] Every character animation has a real, deliberately-designed resting pose, and reduced
      motion jumps to it rather than freezing mid-loop (see `motion-for-characters.md`).
- [ ] Provenance manifest (`rights-and-ethics.md`) and, if applicable, the character model
      sheet (`character-consistency.md`) are included in the handoff.
