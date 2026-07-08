---
name: illustrated-narrative-sourcing
description: >-
  Source, direct, and maintain custom character and scene illustration where the
  illustration IS the storytelling device — not decoration. Covers 2D illustration-based
  characters, hand-drawn scenes, retro/Y2K illustrated looks, and playful 3D or
  claymorphism renders. Use when a project's warmth or humor comes through an illustrated
  character or scene rather than typography, graphic devices, or photography: a mascot, an
  explainer with a recurring character, a campaign needing a drawn world, "personajes que
  cuentan la historia", a Y2K/chrome/holographic look, or soft toy-like 3D. Also use to keep
  a character consistent across illustrations (model sheets, palette-locking, AI
  consistency), to clear rights on commissioned or AI-generated character art, and to choose
  SVG/Lottie/Rive for character animation. Do NOT use for abstract graphic devices (seals,
  grain — see bold-brand-asset-sourcing), photography-led editorial (editorial-layered-
  landing), a single decorative icon, or a brand identity from zero.
---

# Illustrated Narrative Sourcing

Some sites earn warmth through typography and graphic devices (see
`bold-brand-asset-sourcing`). Others earn it through **a drawn character or scene that
carries the emotional and narrative weight of the page** — a mascot that explains what the
product does, an illustrated everyday moment that makes a cause feel personal, a recurring
character that shows up across a campaign. That's a different brief with a different
source list and a different failure mode, and this skill is about that brief specifically.

## The trap this exists to avoid

Illustration-led design looks effortless — a loose line, a bouncy shape, a friendly
character — and that's exactly what makes it easy to get wrong. The style photographs as
spontaneous, but every illustration-led site that actually works is holding a strict,
mostly invisible consistency underneath: the same line weight in every drawing, the same
proportion system for every character, the same limited palette, the same rendering logic
(flat fill vs. shading vs. gradient) used every time. The failure mode here isn't clutter
(that's the bold-brand failure) — it's **drift**: a mascot that looks subtly different in
every illustration, as if drawn by three people who never saw each other's work. One
off-model drawing breaks the illusion that a whole world was imagined by one hand. Lock the
model before producing a single additional scene.

## When to use / not use

**Use when** a project's personality lives in a drawn character or scene: a mascot that
carries explanation or delight, a recurring illustrated character across a campaign, an
editorial or cause-driven site where an illustrated everyday moment does the emotional
work, a Y2K/retro illustrated aesthetic (chrome, holographic gradients, pixel art), or a
soft 3D/claymorphism look (rounded, toy-like, tactile). Also use to audit or extend an
*existing* illustrated character (a mascot a client already has) for consistency, and to
clear rights on commissioned or AI-generated character work before it ships.

**Do not use when** the brief wants abstract graphic devices (stars, seals, grain, marquee
— that's `bold-brand-asset-sourcing`), quiet photography-led editorial (`editorial-layered-
landing`), a single generic stock icon dropped in for decoration, or a full brand identity
built from zero (`brand-identity-construction`). If illustration is one minor accent among
many other devices rather than the thing carrying the story, this is probably the wrong
skill for the job.

## The rule that governs everything

**Consistency first, then rights, then weight.** A gorgeous single illustration that
doesn't match the character's established model is the wrong illustration — it'll read as
a seam the moment it sits next to the others. A perfectly consistent character you don't
actually have the rights to use commercially is worthless. A cleared, consistent character
system delivered as ten unoptimized raster files breaks the page. Check consistency before
you spend time clearing rights or optimizing a scene that was never going to match anyway.

## Workflow

### 0. Retrofitting onto an existing site or an existing mascot?

If there's already a character (a client's existing mascot, an established illustration
style) or an existing site with its own theming and motion systems, the retrofit audit in
`bold-brand-asset-sourcing/references/retrofitting-existing-sites.md` applies here too —
existing CSS variables and theme mechanism, existing scroll/motion systems to integrate
with rather than duplicate, single- vs. multi-page structure. On top of that general
checklist, specifically **reverse-engineer the existing character's model** before
producing anything new for it: trace its actual line weight, proportions, and palette from
the existing artwork rather than approximating from memory, so new scenes match the old
ones exactly (see `character-consistency.md`).

### 1. Define the character/scene system before producing anything

Lock these as a short spec — this is what turns "commission some illustrations" into a
consistent system instead of a folder of unrelated drawings:

- **Style flavor**: which register — flat 2D vector character illustration, organic
  hand-drawn linework, Y2K/retro (chrome, holographic gradient, pixel art), or playful
  3D/claymorphism (soft, rounded, toy-like). Pick one; mixing flavors is what makes a page
  feel like a mood board instead of a world.
- **Character model**: line weight (and whether it varies by emphasis or stays constant),
  proportion system (head-to-body ratio, hand/limb simplification level), fill logic (flat
  color, cel-shaded, soft gradient, textured), a small shape vocabulary (rounded vs.
  angular) that every character and prop obeys.
- **Palette**: locked to a small set, consistent across every scene — warm/friendly,
  saturated/pop, pastel/soft, or Y2K chrome/neon, depending on the flavor chosen.
- **Narrative role**: is the illustration the primary storytelling device (carrying tone,
  humor, or cause — budget real page real-estate and attention for it) or a supporting
  accent alongside other content? This determines how much of the layout it should own.
- **Motion role**: static illustration, simple hover/state-change reactions (see Pepper's
  own interactive SVG for a working example of this), or full character micro-animation
  (idle loops, reactions) — pick a ceiling now; see `motion-for-characters.md`.

### 2. Source per category

Full catalog with URLs and fit notes in `sources.md`. Short version:

- **Commission a real illustrator** for anything that needs to be genuinely bespoke and
  defensible — scout on Behance/Dribbble/Instagram, or use an illustration-retainer
  service for ongoing volume.
- **AI-generated character art** when budget or timeline doesn't allow commissioning —
  the hard part is keeping the *same* character consistent across many scenes; see
  `character-consistency.md` for the technique, and `rights-and-ethics.md` before you rely
  on the output commercially.
- **Open illustration systems** (unDraw, Humaaans, Open Doodles, Storyset, Blush, DrawKit,
  Icons8 Ouch, Absurd Design) as a starting point or for low-stakes decorative use — but
  used as-is, these rarely read as bespoke enough to carry a brand's actual narrative; plan
  to recolor and recompose at minimum, and don't expect them to substitute for a real
  character system when illustration is meant to be the primary storytelling device.
- **3D/claymorphism**: Spline or Blender for the render itself (see `sources.md` for the
  current state of each), pre-made 3D icon packs recolored to fit, or CSS-only soft-shadow
  claymorphism techniques for simpler needs.
- **Y2K/retro specifics**: chrome/holographic gradient generators, pixel-art editors
  (Aseprite, Piskel), VHS/glitch texture overlays.
- **Character motion**: Lottie (lightweight, widely supported), Rive (interactive state
  machines — see the current pricing note in `sources.md`), or plain SVG + CSS/GSAP for
  simple state changes.

### 3. Select and produce for narrative fit and consistency, not just "cute"

Reject anything generically stock-cute that doesn't actually serve the story being told —
an illustrated everyday moment that feels observed beats a generic smiling mascot. Then
run every candidate scene against the locked model from step 1: same line weight, same
proportions, same palette, same rendering logic. One drawing that doesn't match is worth
fixing before it ships, not after.

### 4. Clear the rights — this is the trickiest gate in this skill

More fraught here than plain font or stock-photo licensing. Full detail in
`rights-and-ethics.md`; the non-negotiables:

- **Commissioned work**: the contract should state usage scope (web only vs. broader),
  exclusivity, whether the client can edit or extend the artwork later, and illustrator
  credit requirements.
- **AI-generated character art**: avoid prompting "in the style of [a specific living
  illustrator]" — mimicking an identifiable artist's signature style is an active ethical
  and legal gray zone that some illustrators have publicly objected to. Confirm the
  generation tool's current commercial-use terms before shipping the output on a client
  site.
- **Open illustration sets**: license varies per set (and sometimes per asset within a
  set) — check before assuming "free" means unrestricted commercial use.
- **A mascot that becomes a distinctive brand identifier** may be worth a trademark
  conversation with the client, separate from the illustration's copyright.

### 5. Optimize and ship

- **SVG** for flat vector character illustration — recolorable, crisp, tiny, animatable.
- **Raster (AVIF/WebP)** only for painterly, textured, or 3D-rendered scenes that can't be
  vector; size to actual display dimensions and lazy-load below the fold.
- **Lottie JSON** for lightweight character micro-animation; **Rive** when the character
  needs real interactive state (hover/click-driven reactions, branching states).
- **Consolidate multi-pose characters** into a sprite sheet or a single SVG with toggled
  layers rather than many separate small files.
- Gate all character motion behind `prefers-reduced-motion` — see `motion-for-characters.md`
  for what "reduced" should mean for a character specifically (pause the idle loop, don't
  just remove it abruptly).

### 6. Hand off with a model sheet, not just a file manifest

The deliverable here is bigger than an `ASSETS.md` of sourced files: it's a **character
model sheet** — the locked line weight, proportions, palette, and rendering logic from
step 1, written down with reference images — so whoever produces the next illustration
(another illustrator, a future AI-generation pass, Claude Code building a new page) can
match the existing character instead of drifting from it. Keep the rights/provenance
manifest from `rights-and-ethics.md` alongside it.

## Reference files

- `sources.md` — the catalog: illustrator-commissioning routes, AI character-generation
  tools, open illustration systems, 3D/claymorphism tools (with current pricing-model
  notes for Spline and Rive), Y2K/retro-specific tools, and character-animation tools.
- `character-consistency.md` — how to build and keep a character model: model sheets,
  proportion and line-weight systems, palette-locking, and the practical technique for
  keeping an AI-generated character consistent across many scenes.
- `rights-and-ethics.md` — commissioned-art contract basics, the AI style-mimicry issue,
  open-set license notes, mascot/trademark considerations, and the provenance manifest
  format. Guidance, not legal advice.
- `motion-for-characters.md` — Lottie vs. Rive vs. plain SVG, basic animation-principle
  notes for character motion (anticipation, squash/stretch) applied to the web, and what
  reduced-motion should mean for an idle character loop specifically.
- `optimization.md` — SVG vs. raster vs. Lottie choice, sprite consolidation, self-hosting,
  and a pre-launch performance checklist adapted to illustration and character assets.
