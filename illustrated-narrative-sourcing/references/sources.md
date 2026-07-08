# Source Catalog

Where to get character and scene illustration, organized by route. Each with what it's
for, current pricing/rights posture in one line, and fit notes. Deep rights detail lives
in `rights-and-ethics.md`; character-consistency technique lives in `character-consistency.md`.

**Contents:** 1. Commissioning a real illustrator · 2. AI character generation · 3. Open
illustration systems · 4. 3D & claymorphism · 5. Y2K/retro-specific tools · 6. Character
animation tools

---

## 1. Commissioning a real illustrator

The route for anything that needs to be genuinely bespoke, consistent by construction, and
commercially defensible without ambiguity.

- **Behance** (https://www.behance.net) and **Dribbble** (https://dribbble.com) — browse by
  illustration style, message artists directly; both show enough of an artist's back
  catalog to judge consistency before hiring.
- **Instagram** — many illustrators post process/model-sheet content; searching a style
  term plus "illustrator" surfaces working artists directly, often faster than a
  marketplace.
- **Retainer/ongoing-volume services**: **Superside** (https://www.superside.com) and
  **Design Pickle** (https://www.designpickle.com) — subscription illustration-on-demand,
  useful when a campaign needs many consistent scenes over time rather than one commission.
- **Freelance marketplaces**: **Contra** (https://contra.com), **Upwork**
  (https://www.upwork.com) — wider net, more variance in quality; vet by portfolio
  consistency specifically (see the trap this skill is built around).

Brief every commission with the character-model spec from `character-consistency.md` up
front — it's what keeps ten commissioned scenes looking like one character instead of ten.

---

## 2. AI character generation

Use when timeline or budget doesn't support commissioning, or for rapid exploration before
briefing a real illustrator. The hard problem is consistency across scenes, not generating
any single image — see `character-consistency.md` for the actual technique (reference
images, locked seeds/style-references, iterative correction). Confirm each tool's current
commercial-use terms before shipping output on a client site — this is an evolving area,
covered in `rights-and-ethics.md`.

- General-purpose image models with reference/style-consistency features are the practical
  route for keeping one character across many scenes — check whichever current model you
  use for an explicit "character reference" or "style reference" input rather than relying
  on prompt text alone to hold a likeness constant.
- For simple flat/vector-style output, models that can be steered toward "flat vector
  illustration, no gradients, thick even linework" tend to hold a consistent look more
  easily than photoreal or painterly styles — constrain the style description tightly.

---

## 3. Open illustration systems

Good for a fast start, decorative low-stakes use, or filling gaps around a bespoke
character. Rarely reads as bespoke enough to *be* the narrative on its own — plan to
recolor and recompose at minimum.

- **unDraw** — https://undraw.co — open, recolor to any hex on the fly, free commercial,
  no attribution. The most reusable starting point.
- **Humaaans** — https://www.humaaans.com — mix-and-match people illustration, free.
- **Open Doodles** — https://www.opendoodles.com — CC0 hand-drawn marks and figures.
- **Storyset** — https://storyset.com (Freepik) — editable, some pre-animated; **check
  attribution terms** — free tier often requires credit.
- **Blush** — https://blush.design — mix-and-match illustration libraries by named artists;
  mixed free/paid, license varies per library.
- **DrawKit** — https://www.drawkit.com — free and paid packs, hand-drawn style.
- **Absurd Design** — https://absurd.design — surreal, distinctive, free with attribution.
- **Icons8 Ouch** — https://icons8.com/illustrations — large free/paid library, many styles
  in one consistent system (useful when you need breadth in one hand's style).

---

## 4. 3D & claymorphism

For soft, rounded, toy-like 3D character or object work.

- **Spline** — https://spline.design — browser-based, the accessible route into interactive
  3D for web (React/Next.js/Webflow/Framer export). **Pricing note (verify current terms):**
  free tier exists but is limited (a small number of files) and free web exports carry a
  watermark; removing the watermark and unlocking more files requires a paid plan. Budget
  for that before promising a client a "free" 3D hero.
- **Blender** — https://www.blender.org — free, open-source, full-featured; steeper learning
  curve, the route for a genuinely custom render exported as a still or video rather than a
  live interactive web scene.
- **Vectary** — https://www.vectary.com — another browser-based 3D tool, similar niche to
  Spline, worth comparing for a specific project's needs.
- **Pre-made 3D icon/object packs**: search "3D icon pack" on Figma Community or
  marketplaces like Iconscout (https://iconscout.com) — recolor and re-light to fit rather
  than using stock lighting/material as-is.
- **CSS-only claymorphism** (simpler needs, no 3D engine required): soft multi-layered
  box-shadows (a light shadow and a dark shadow offset in opposite directions) plus large
  border-radius and a soft gradient fill approximates the soft-toy look for UI elements
  without any 3D asset at all.

---

## 5. Y2K / retro-specific tools

For the chrome/holographic/pixel-art end of Illustrative Pop.

- **Chrome/holographic gradients**: generate with layered CSS gradients (a rainbow
  conic-gradient plus a metallic grayscale gradient blended with `mix-blend-mode: overlay`
  approximates chrome) or search "holographic gradient generator" for a dedicated tool.
- **Pixel art editors**: **Aseprite** (https://www.aseprite.org — paid, the standard) and
  **Piskel** (https://www.piskelapp.com — free, browser-based) for genuine pixel-art assets.
- **VHS/glitch texture overlays**: layer a subtle scanline SVG pattern (repeating thin
  horizontal lines at low opacity) or source a short looping VHS-noise video clip for a
  background texture — keep it subtle and behind content, not obscuring it.

---

## 6. Character animation tools

- **Lottie** — https://lottiefiles.com — free, JSON-based, lightweight, exports from After
  Effects (via the Bodymovin plugin) or built directly at LottieFiles; the standard for
  simple, widely-supported character micro-animation (idle loops, small reactions). Needs
  the `lottie-web` player library (MIT) at runtime.
- **Rive** — https://rive.app — for characters that need real interactive state (branching
  reactions to hover/click/app state via state machines), not just a looping animation.
  **Pricing note (verify current terms):** the editor itself is free to design and animate
  in indefinitely, but as of Rive's late-2025 pricing change, **exporting `.riv` files to
  run in production** (a live website or app) requires a paid plan — budget for that before
  committing to Rive for a shipped character, not just prototyping.
- **Plain SVG + CSS/GSAP**: for simple state changes (exactly the pattern already working
  in Pepper's own interactive pepper SVG — hover-triggered attribute/class changes), this is
  often lighter and more than sufficient; reach for Lottie/Rive only when the animation
  complexity genuinely outgrows hand-authored SVG states.
