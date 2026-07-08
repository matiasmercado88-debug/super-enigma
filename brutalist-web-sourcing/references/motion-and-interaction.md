# Motion & Interaction

Brutalist motion has a different job than the smooth reveals in `bold-brand-asset-sourcing/
motion.md` or the lively character loops in `illustrated-narrative-sourcing/motion-for-
characters.md`. Here, motion (or its deliberate absence) is itself part of the statement —
and the effects most associated with this style (glitch, distortion) carry real
accessibility risk that needs more care than a typical fade-in.

## Two valid motion philosophies — pick one

- **Classic brutalism: near-absent, abrupt motion.** Hover and active states change
  instantly, with `transition: none` rather than an eased transition — the abruptness is
  the point, echoing the style's rejection of anything that feels like it's trying to be
  pleasant. Page transitions, if any, are instant rather than smoothed.
- **Neo-brutalism: deliberate glitch/distortion as performance.** Short, punchy glitch
  cuts (see the CSS technique in `raw-devices.md`), sudden scale-snaps instead of smooth
  scaling, cursor-following elements that react abruptly rather than with easing. This is
  motion used to feel jarring on purpose, not motion used to feel alive (that's the
  illustrated-narrative-sourcing job) or motion used to feel premium (that's bold-brand's
  job).

Don't blend the two — a page that's mostly abrupt-and-instant with one soft eased fade
buried in it reads as inconsistent, not intentional.

## Reduced motion — a harder requirement here, not a lighter one

Glitch and distortion effects specifically are more likely than ordinary fades or
slides to cause discomfort for people with vestibular disorders or photosensitivity —
rapid clip-path cuts and color-channel-shift effects sit closer to the kind of motion
that triggers real physical symptoms than a gentle upward fade does. That makes the
`prefers-reduced-motion` gate more important here, not less, even though the aesthetic
itself claims to reject conventional politeness:

```css
@media (prefers-reduced-motion: reduce) {
  .glitch::before, .glitch::after,
  .scanlines::after,
  [class*="brutal-offset"] {
    animation: none !important;
    transform: none !important;
  }
}
```

Under reduced motion:
- Glitch text should render as its plain, single-color final state — not paused mid-glitch.
- Scanline/CRT overlays can stay (they're static texture, not motion) — only the *animated*
  variants need gating.
- Instant/abrupt hover states (the classic-brutalist philosophy) are already
  reduced-motion-safe by definition — there's no easing to remove, which is one of this
  style's few built-in accessibility advantages.

## Cursor customization

A custom cursor is a common brutalist/neo-brutalist touch (a blocky shape, a
follower-element, a cursor that snaps rather than glides). Keep it usable:
- Never fully hide the actual click point — a custom cursor should indicate precisely where
  a click will register, not just decorate the general area.
- Provide a normal system cursor fallback path for anyone using assistive input devices
  that a custom CSS cursor might not track correctly.
- Keep any cursor-follower JS lightweight — see `optimization.md` for why a raw aesthetic
  shouldn't be shipped on top of a heavy dependency.
