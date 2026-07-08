---
name: web-style-router
description: >-
  Classify a web project's visual direction against the four style archetypes —
  Swiss/editorial, Illustrative Pop (graphic devices or character illustration), Brutalism,
  and Immersive/3D — and route to the right skill(s) for structure and materials. Use at
  the start of a web design project with no locked style, when given a reference site to
  match ("quiero que se vea como esta web"), when a project blends a primary register with
  an accent (a mascot inside an otherwise different site, a bold device on an editorial
  page), or when `full-website-build` reaches Phase 3 (Brand & Design System) and needs a
  design register. Also use to get the generic project-phase skeleton (audit through
  handoff) for any register other than Swiss/editorial, since `editorial-layered-landing`
  is the only skill in the family bundling its own structural methodology. Do NOT use this
  to source materials directly — once a register is chosen, hand off to its own skill.
---

# Web Style Router

This is the front door to the style-sourcing family: `editorial-layered-landing`,
`bold-brand-asset-sourcing`, `illustrated-narrative-sourcing`, `brutalist-web-sourcing`, and
`immersive-web-sourcing`. Each of those is deliberately narrow and opinionated about one
register. This skill doesn't replace any of them — it figures out *which one(s)* apply to a
given brief, and supplies the structural scaffolding the four newer skills don't carry on
their own.

## The gap this closes

`editorial-layered-landing` is self-contained: it bundles both a style (Swiss/editorial) and
a full page-structure methodology (audit → visual foundation → hero → sections →
components → motion → responsive → accessibility/performance → cleanup). The other four
skills in the family are deliberately materials-only — they assume something else is
handling the actual page structure. That's fine when one of those four registers is layered
as an *accent* onto an editorial-led build (which is how this family has been used so far),
but it leaves a real hole if one of them is the **primary** register of a project: there's
nowhere that says how to structure the actual pages. This skill is that missing piece, plus
the classification step that decides which register(s) apply in the first place.

## Step 1 — Classify against the six axes

Score the brief, reference site, or existing site against these six axes — the same
framework a well-known web-design style lookbook uses to compare its four archetypes.
Reading real signals against this table is more reliable than guessing from a vibe:

| Axis | Swiss / editorial | Illustrative Pop — devices | Illustrative Pop — characters | Brutalism | Immersive |
|---|---|---|---|---|---|
| Typography | Refined serif+grotesk pairing, italic accent, generous hierarchy | Bold display face with attitude, one or two loud fonts | Friendly/rounded, often paired with hand-lettering | System/monospace, or an oversized grotesk pushed extreme | Minimal, or integrated into/extruded within the 3D space |
| Layout | Grid-driven, generous negative space, asymmetric editorial rhythm | Layered/collage, controlled overlap | Scene-composition-driven, character-centered | Exposed grid, or a deliberately broken one | Spatial/depth-driven — camera composition, not a flat grid |
| Color | Muted paper+ink+one accent, restrained | Bright, bounded (1–2 loud colors + neutrals) | Warm/friendly or saturated-pop, matched to the character | Monochrome, or clashing bright primaries | Moody cinematic, or vibrant-for-depth, dramatic lighting |
| Imagery | Photography-led, quiet, negative space | Graphic devices — stars, seals, stickers, grain | Custom illustrated characters and scenes | Minimal or none — content-first | 3D models, particles, shaders, cinematic video |
| Motion | Subtle fade/reveal, restrained | Marquees, hover devices, confident GSAP+Lenis | Character micro-animation (Lottie/Rive state) | Abrupt/instant, or deliberate glitch | Scroll-driven camera, parallax depth, particle motion |
| Tone | Quiet, precise, considered, premium | Playful, confident, energetic | Joyful, warm, narrative | Rebellious, raw, anti-corporate | Cinematic, futuristic, high-production "wow" |

Score each axis independently — a brief rarely matches one column on every row. Whichever
column wins the most axes is the **primary register**. A column that wins only one or two
axes, tied to one specific element (a mascot, a hero device), is an **accent**, not the
primary — see step 2.

## Step 2 — Primary + accent, not just one label

Real projects usually aren't a pure archetype — they're a primary register with an accent
borrowed from another. Force a single label and you either flatten a project that genuinely
wants two things, or you pick the wrong skill entirely for the accent element. The canonical
case from this family's own history: a site whose overall typography/layout/color/tone
scored primarily as one register, but whose hero contained a custom interactive illustrated
character — that character should be built using `illustrated-narrative-sourcing`'s
consistency model even though the rest of the site takes its structure and materials from
elsewhere. Output both:

- **Primary register**: drives the overall structure, typography, color, and the generic
  phase skeleton (or `editorial-layered-landing`'s own, if primary is Swiss).
- **Accent register(s)**, if any: named per specific element ("the mascot: illustrated
  narrative", "the hero device: bold-brand"), each pointing to its own skill for that
  element specifically, without pulling its full structural methodology into the project.

## Step 3 — Route

| Primary register | Structural methodology | Material sourcing |
|---|---|---|
| Swiss / editorial — retrofitting an existing site | `editorial-layered-landing` (built in) | `editorial-layered-landing` (built in) |
| Swiss / editorial — from scratch, no existing site | `references/generic-phase-skeleton.md`, populated with Swiss content pulled from `editorial-layered-landing`'s design-direction/typography/layout-pattern sections | same source |
| Illustrative Pop — devices | generic phase skeleton (`references/generic-phase-skeleton.md`) | `bold-brand-asset-sourcing` |
| Illustrative Pop — characters | generic phase skeleton | `illustrated-narrative-sourcing` |
| Brutalism | generic phase skeleton | `brutalist-web-sourcing` |
| Immersive | generic phase skeleton | `immersive-web-sourcing` |

**Why Swiss/editorial splits in two:** `editorial-layered-landing` was written specifically
to improve an *existing* static site — it says so explicitly ("do not rebuild from scratch
unless necessary") and its whole methodology (audit first, preserve the current stack)
assumes there's something there to preserve. The other four registers in this family were
all written to support a from-scratch build as the default case, with retrofitting as an
explicit opt-in Phase 0 — so they don't need this split. If a from-scratch Swiss/editorial
project comes in, don't force it through a skill built to resist exactly that; use the
generic phase skeleton instead, with Swiss-register content (the type pairing, the layout
patterns, the visual-system rules) pulled straight out of `editorial-layered-landing`'s own
sections rather than its audit-first workflow.

For any accent register identified in step 2, pull only that skill's materials/consistency
guidance for the specific element — not its full workflow.

If the project is retrofitting onto a site that already exists (the common case in
practice), run `bold-brand-asset-sourcing/references/retrofitting-existing-sites.md`'s
pre-flight audit first, regardless of which register wins — its checklist (existing CSS
variables and theming mechanism, CSP, existing scroll/motion systems, single- vs.
multi-page structure) applies no matter which register is being retrofitted.

## Step 4 — Where this plugs into `full-website-build`

`full-website-build` already delegates to specialist skills at Phase 3 (Brand & Design
System) and Phase 5 (Development) — it just doesn't know this family exists yet. Concretely:

- **At Phase 3**, run this router (steps 1–2) before producing the phase's design-system
  deliverables (palette, typography, component inventory). The primary register and any
  accents become the actual content of that phase's outputs, sourced from the routed
  skill(s) in step 3.
- **At Phase 5**, use `editorial-layered-landing`'s own phase order if primary is Swiss, or
  `references/generic-phase-skeleton.md` otherwise, as the "order of operations" for that
  phase — in place of the generic placeholder steps `full-website-build` lists there.

## Reference files

- `references/generic-phase-skeleton.md` — the style-agnostic version of
  `editorial-layered-landing`'s nine implementation phases (audit through cleanup),
  generalized so any of the other four registers can use the same structural rhythm while
  pulling their own style-specific content into each phase.
