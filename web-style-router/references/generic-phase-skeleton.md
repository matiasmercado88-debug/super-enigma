# Generic Phase Skeleton

This is `editorial-layered-landing`'s own nine-phase structure, generalized so it works
regardless of which primary register `web-style-router` chose. Where the original skill
says "editorial" or names a specific device, this version says "pull from the routed
skill" instead — the rhythm of the phases stays the same across every register; only the
content poured into each phase changes.

Use this when the primary register is Illustrative Pop (devices or characters), Brutalism,
Immersive, or Swiss/editorial **with no existing site to retrofit**. If the primary register
is Swiss/editorial and there's an existing site to improve, use `editorial-layered-landing`'s
own phases directly instead of this generalized version — it's already written for exactly
that case and there's nothing to gain by generalizing it back. For a from-scratch
Swiss/editorial build, use this skeleton and pull Swiss-register content (type pairing,
layout patterns, visual-system rules) from `editorial-layered-landing`'s sections — just
skip its audit-first, preserve-the-stack framing, since there's no existing stack yet.

## Phase 0 — Retrofit audit (if applicable)

If this is landing on a site that already exists, run
`bold-brand-asset-sourcing/references/retrofitting-existing-sites.md`'s pre-flight
checklist before anything else: existing CSS variables and theming mechanism, CSP, existing
scroll/motion systems to integrate with rather than duplicate, existing repeated patterns
to hook new devices into, single- vs. multi-page structure. This applies no matter which
register won the classification.

## Phase 1 — Audit

Inspect the current project (or, for a from-scratch build, the brief and any references)
and produce a short implementation plan before touching anything.

Review: file structure, current stack, existing markup/component structure, CSS
organization, current typography and color, current sections, responsive behavior, image
usage, navigation, current animation if any, accessibility issues, performance risks, and
which parts should be preserved vs. refactored vs. left untouched.

Return: a short diagnosis, proposed phases, files likely to change, technical risks, and
the first recommended intervention — the same five-part output `editorial-layered-landing`
uses, register-agnostic.

## Phase 2 — Define the visual system

Pull this phase's actual content from the routed register skill's "define the kit" or
"define the system" step (each of the four sourcing skills has one): the display voice and
type pairing, the device/character/texture vocabulary, the palette, and — critically — the
register's own governing rule (bold-brand's cohesion-license-weight, illustrated-
narrative's consistency-rights-weight, brutalist's deliberate-legible-light, immersive's
fallback-spectacle-budget). Lock these before building a single section.

## Phase 3 — Hero

Build the strongest possible opening section using the routed register's core technique:
a layered hero with a device (bold-brand), a character-led scene (illustrated-narrative), a
raw exposed-structure hero (brutalist), or a spatial/camera-driven opening (immersive).
Whatever the register, the hero should dominate the screen and establish the register
immediately — a visitor should be able to tell which register they're in in the first
several seconds.

## Phase 4 — Section restructuring

Improve or build the remaining sections (concept/manifesto, services or benefits, product
or process, cases or examples, CTA, footer) using the routed register's layout patterns.
Preserve useful existing sections on a retrofit; don't force a section that the content
doesn't support.

## Phase 5 — Devices, characters, or spatial elements

This is where the routed sourcing skill's actual materials workflow happens in full: source
and build the devices (bold-brand), source and maintain the character model
(illustrated-narrative), build the raw devices (brutalist), or build the spatial techniques
(immersive) — following that skill's own workflow steps for sourcing, selection, and rights
clearance.

## Phase 6 — Motion

Add the register's motion signature: confident GSAP+Lenis devices and marquees (bold-brand),
character micro-animation via Lottie/Rive/SVG (illustrated-narrative), abrupt or deliberate-
glitch motion (brutalist), or scroll-driven camera/parallax/particle motion (immersive).
Every register's motion guidance converges on the same non-negotiable: gate everything
behind `prefers-reduced-motion`, in both CSS and JS where both apply.

## Phase 7 — Responsive pass

Audit all breakpoints and fix mobile issues. Test from 360px wide, same baseline as
`editorial-layered-landing`. Register-specific responsive risks to check: bold-brand's
devices (marquee overflow, seal sizing), illustrated-narrative's multi-pose characters,
brutalist's broken-grid layouts (hit targets on mobile specifically), and immersive's
performance budget on a real mid-range device, not just breakpoint behavior.

## Phase 8 — Accessibility and performance pass

Fix semantic, contrast, image, animation, and performance issues — plus the register's own
central gate, which is different in each case and shouldn't be treated as generic:

- Bold-brand: device weight and licensing (fonts, especially paid display faces).
- Illustrated-narrative: character consistency across every shipped scene, and the
  rights/ethics gate around commissioned or AI-generated art.
- Brutalist: contrast, hit targets, and findable navigation surviving underneath the
  deliberate rawness — this is the register's single most important check.
- Immersive: the accessible fallback (screen readers, no-JS, low-end devices) and
  `prefers-reduced-motion` handling for camera movement specifically — this register's
  single most important check.

## Phase 9 — Cleanup and handoff

Remove unused styles, simplify code, ensure maintainability — and produce whatever
provenance artifact the routed register skill calls for: an `ASSETS.md` manifest
(bold-brand, immersive), a character model sheet plus provenance manifest
(illustrated-narrative), or a lighter license note (brutalist, which sources very little).
