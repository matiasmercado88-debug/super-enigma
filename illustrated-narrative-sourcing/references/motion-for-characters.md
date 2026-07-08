# Motion for Characters

Character motion has a different job than the marquees and scroll-reveals in
`bold-brand-asset-sourcing/motion.md`: it's not about revealing content, it's about giving
a drawn character a sense of life. That changes both the tool choice and what "reduced
motion" should mean.

## Choosing the tool

- **Plain SVG + CSS/GSAP** — for simple state changes: hover reveals a different part,
  a click toggles an expression, a scroll position swaps an attribute. This is exactly the
  pattern already working in Pepper's own interactive pepper SVG (`data-hover` states
  driving which annotation shows). Cheap, no extra library, full control, and often
  genuinely enough — don't reach for Lottie or Rive until hand-authored SVG states
  actually run out of road.
- **Lottie** (https://lottiefiles.com) — for a looping or one-shot animation exported from
  After Effects (via the Bodymovin plugin) or built directly at LottieFiles: an idle bounce,
  a small celebratory reaction, a loading character. Lightweight JSON, scales crisply,
  widely supported via the `lottie-web` player (MIT). The right choice when the motion is
  pre-authored and doesn't need to branch based on user interaction.
- **Rive** (https://rive.app) — for a character that needs real interactive **state**:
  branching reactions to hover, click, or app/site state via state machines, not just a
  loop. More powerful than Lottie for interactivity, but check the current pricing model
  before committing — as of Rive's late-2025 change, the editor is free to design in
  indefinitely, but **exporting `.riv` files to run in production** requires a paid plan.
  Fine for a client project's budget, just don't promise "free" without checking current
  terms first.

## Basic animation-principle notes, applied to the web

A character that just fades in and out reads as a UI element, not a character. A few
classic animation principles, applied lightly, are what make a drawn character feel alive
rather than mechanical:

- **Anticipation**: a small counter-movement before the main motion (a slight dip before a
  bounce up) reads as more alive than a linear move straight to the target.
- **Squash and stretch**: even a subtle scale distortion during a bounce or reaction (never
  on rigid geometric shapes, but very natural on a rounded character) sells weight and
  energy far more than a plain transform.
- **Ease, not linear**: character motion should almost never use a linear easing curve —
  `power2.out`/`power3.out`-style eases (or their CSS `cubic-bezier` equivalents) read as
  organic; linear reads as robotic.
- **Idle isn't nothing**: a character that's meant to feel "alive" on the page usually wants
  a very subtle idle loop (a slow breathing scale, an occasional blink) rather than sitting
  perfectly static between interactions — but keep it subtle enough that it doesn't compete
  for attention with the content around it.

Apply these with restraint — a character with every principle cranked up reads as
manic, not alive. One or two well-chosen touches (a bit of anticipation on the main
interaction, a subtle idle loop) usually beats stacking all of them at once.

## What "reduced motion" should mean for a character specifically

Character motion needs the same `prefers-reduced-motion` gating as any other animation
(see `bold-brand-asset-sourcing/motion.md`), but naively setting `animation: none` on a
character can look broken rather than calm — a mascot frozen mid-bounce, or missing
entirely if its resting state was never drawn. Handle it deliberately:

- Make sure the character has an explicit, complete **resting pose** that isn't just an
  arbitrary freeze-frame of the animated loop — design it as a real static state.
- Under reduced motion, jump straight to that resting pose rather than pausing the
  animation wherever it happens to be.
- Interactive state changes (hover reveals, click reactions) can still happen under reduced
  motion — reduced motion means no *unprompted* looping or large-scale movement, not that
  the character becomes entirely inert to interaction. A hover that instantly swaps to a
  different static state (no animated transition between them) is usually fine even under
  reduced motion; a continuously bouncing idle loop is not.
