# Building the Raw Devices

The recognizable materials of this style are almost all hand-built CSS, not downloaded
assets — that's part of the point (raw, honest, no hidden dependency doing the work for
you). Copy-paste starting points below; recolor into the palette locked in step 1.

**Contents:** hard offset shadow · thick borders · exposed grid · broken/misaligned grid ·
glitch text · CRT/scanline overlay · the deliberateness checklist.

---

## Hard offset shadow (the single most recognizable neo-brutalist device)

Solid color, zero blur, fixed offset — the opposite of a soft drop shadow.

```css
.brutal-card {
  border: 3px solid var(--ink);
  box-shadow: 6px 6px 0 var(--ink);   /* no blur radius — that's the whole trick */
  background: var(--paper);
  transition: none;                    /* abrupt, not eased, on purpose */
}
.brutal-card:hover,
.brutal-card:active {
  box-shadow: 3px 3px 0 var(--ink);    /* "pressed" feel: shadow shrinks, element implied to move toward it */
  transform: translate(3px, 3px);
}
```

Lock the border width and shadow offset as fixed values (`3px`/`6px` above) and reuse them
on every card, button, and panel — the repetition is what makes it read as a system rather
than a one-off effect.

---

## Thick borders as structure, not decoration

```css
.brutal-panel { border: 4px solid var(--ink); }
.brutal-divider { border-top: 4px solid var(--ink); }
```

Use the same border width everywhere it appears — mixing 2px in one place and 6px in
another undoes the "exposed structural system" read.

---

## Exposed grid (classic-brutalist move)

Make the grid visible instead of hiding it — thin lines at the actual column boundaries.

```css
.brutal-grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  background-image: repeating-linear-gradient(
    to right, var(--line) 0 1px, transparent 1px calc(100% / 12)
  );
}
```

---

## Broken/misaligned grid (neo-brutalist move — deliberate, not accidental)

A considered version of "off": nudge specific elements off the grid on purpose, rather
than leaving true misalignment to chance.

```css
.brutal-offset-2 { transform: translate(18px, -6px) rotate(-1.5deg); }
.brutal-offset-3 { transform: translate(-24px, 10px) rotate(2deg); }
```

Apply to a *specific, chosen* handful of elements (a headline, one card in a grid) —
if every element is offset, nothing reads as intentionally displaced.

---

## Glitch text effect (pure CSS)

```css
.glitch { position: relative; color: var(--ink); }
.glitch::before, .glitch::after {
  content: attr(data-text); position: absolute; inset: 0;
  clip-path: inset(0 0 0 0);
}
.glitch::before { color: var(--accent-a); transform: translate(-2px, 0); animation: glitch-a 2.4s infinite steps(2); }
.glitch::after  { color: var(--accent-b); transform: translate(2px, 0);  animation: glitch-b 2.4s infinite steps(2); }
@keyframes glitch-a { 0%,90%,100%{clip-path:inset(0 0 0 0)} 92%{clip-path:inset(10% 0 60% 0)} 94%{clip-path:inset(60% 0 5% 0)} }
@keyframes glitch-b { 0%,90%,100%{clip-path:inset(0 0 0 0)} 91%{clip-path:inset(40% 0 20% 0)} 95%{clip-path:inset(5% 0 70% 0)} }
@media (prefers-reduced-motion: reduce) {
  .glitch::before, .glitch::after { animation: none; clip-path: inset(0 0 0 0); }
}
```
```html
<h1 class="glitch" data-text="RAW">RAW</h1>
```
Keep glitch effects rare and short-lived (a headline, not body text) — see
`motion-and-interaction.md` for why this specific effect needs extra care around reduced
motion and photosensitivity.

---

## CRT / scanline overlay

```css
.scanlines::after {
  content: ''; position: fixed; inset: 0; pointer-events: none;
  background: repeating-linear-gradient(
    to bottom, rgba(0,0,0,0.08) 0 1px, transparent 1px 3px
  );
  mix-blend-mode: multiply;
}
```

---

## The deliberateness checklist

Before calling a layout done, hold every "raw" choice up to this:

- [ ] Could I explain, in one sentence, why this element is offset/oversized/harsh, rather
      than "it just ended up that way"?
- [ ] Is the border width and shadow offset the same everywhere it's used?
- [ ] Is there exactly one grid logic (exposed-honest or considered-broken), not both fighting
      each other?
- [ ] Would this still look intentional in a screenshot with no context, or does it just
      look like unfinished CSS?
- [ ] Does the rawness survive `restraint-and-rights.md`'s legibility checklist — contrast,
      hit targets, findable navigation — underneath the style?

If any answer is "it just happened," fix it before shipping — that's the line between
calculated rebellion and an actual bug.
