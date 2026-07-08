# Keeping It Honest About Weight

The architectural origin of this style — *béton brut*, raw concrete, structure with nothing
hiding it — has a direct digital translation: don't hide a bloated dependency tree behind
an aesthetic that claims honesty about its own materials. A brutalist site loaded with
unnecessary frameworks isn't just a performance problem, it's a premise contradiction.

## Fonts cost the least in this style — use that

Unlike the other skills in this family, this style has a genuinely free option that's also
the most authentic one: **system fonts**. `Times New Roman`, `Arial`, `Courier New` and
similar system stacks require zero network requests, zero self-hosting, zero licensing —
and they're period-correct for the "unstyled HTML" register. If the brief calls for that
register at all, this is the rare case where the cheapest option is also the most on-brand
one, not a compromise.

If the neo-brutalist oversized-grotesk register is the chosen one instead (Archivo Black,
Anton, etc.), follow the same self-hosting/subsetting guidance as
`bold-brand-asset-sourcing/optimization.md` — woff2, subset to the glyphs used, `font-
display: swap`.

## Component kits: take only what's used

The shadcn-based neo-brutalist kits in `sources.md` are built to be installed
component-by-component via the shadcn CLI (`npx shadcn add button`, etc.) rather than
imported as a monolithic library — use that granularity. Pulling in an entire component
library's JS for a marketing page that uses five components undercuts the "raw, honest,
nothing hidden" premise as surely as an oversized hero image would elsewhere.

## Hand-built CSS over downloaded assets

Nearly everything in `raw-devices.md` — the hard shadow, thick borders, exposed grid,
glitch text, scanline overlay — is a few lines of CSS with zero asset weight. Resist the
urge to source a pre-made "brutalist texture pack" or icon set when the effect is this
cheap to build directly; a downloaded asset for something this simple is both heavier and
less adjustable than the hand-built version.

## Glitch/cursor JS: keep it small

If a cursor-follower or a JS-driven glitch effect is used instead of the pure-CSS versions
in `raw-devices.md`, keep the implementation to plain vanilla JS with a `requestAnimationFrame`
loop rather than pulling in an animation library for an effect this narrow in scope — the
CSS-only versions in `raw-devices.md` cover most real cases without any JS at all.

## Pre-launch checklist

- [ ] Typeface is system-stack (zero cost) or a properly subset/self-hosted webfont — not
      loaded from an unnecessary third-party CDN.
- [ ] Component kit usage is trimmed to only the components actually used, not the whole
      library imported wholesale.
- [ ] Hard shadows, borders, exposed/broken grid, and glitch text are hand-built CSS, not
      downloaded texture/asset packs, wherever that's genuinely simpler (it usually is).
- [ ] Any cursor-follower or glitch JS is small and dependency-free, or replaced by the pure
      CSS version.
- [ ] Reduced-motion gating in place for glitch/distortion/offset effects specifically (see
      `motion-and-interaction.md`) — this is a harder requirement here, not an optional one.
- [ ] Contrast, hit targets, and navigation still pass real usability checks underneath the
      rawness (see `restraint-and-rights.md`).
