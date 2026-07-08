# Restraint & Rights

For every other skill in this family, the trickiest gate is licensing. For brutalism, the
trickiest gate is different: **keeping the rawness deliberate without letting it become
actually unusable.** This file covers both, in the order they actually matter here.

## The legibility/usability gate — the one that matters most for this style

This is not a generic accessibility reminder bolted onto the skill — it's the specific,
repeatedly-stated warning in the style's own literature: brutalist choices must not
undermine usability, and the whole approach is a bad fit for any brand whose users need to
feel calm and in control rather than challenged. Concretely, before shipping:

- **Contrast still has to pass.** A harsh, high-contrast palette is on-brand for this
  style; an *illegible* one is not the same thing. Run the actual color pairs through APCA
  (https://www.myndex.com/APCA/) or WebAIM's checker
  (https://webaim.org/resources/contrastchecker/) — "it looks brutalist" is not a substitute
  for a passing contrast ratio on body text.
- **Navigation still has to be findable.** A raw or unconventional layout is the point; a
  layout where visitors genuinely can't find how to get to the next page is not
  brutalism, it's a broken site. If real users in a quick test can't find primary
  navigation within a few seconds, that's a signal to adjust — not proof the style doesn't
  work.
- **Hit targets still have to work, especially on mobile.** A broken-grid desktop layout
  that collapses into unusably small or overlapping tap targets on a phone is not a
  deliberate style choice carried through responsively — it's an unfinished responsive
  pass. Test at a real small-screen width before calling it done.
- **Hierarchy still has to be legible**, even inside oversized or unconventional
  typography. A visitor should still be able to tell, quickly, what the most important
  thing on the page is — brutalism can make that headline huge and blunt, but it shouldn't
  make it ambiguous which text *is* the headline.
- **Motion effects (glitch, distortion, scanlines) need real reduced-motion handling** —
  see `motion-and-interaction.md`; these effects are more likely than most to trigger
  motion sensitivity or photosensitivity, so this is a harder requirement here than in the
  other skills in this family, not a lighter one.

## Who this style is a bad fit for

Said plainly, because it's said plainly in the style's own literature: skip brutalism for
fintech, healthcare, or anything else where the user needs to feel safety and trust rather
than being challenged by the interface. The loud color and aggressive shadow language fight
against calm, and no amount of technical execution fixes a fundamental brand-fit mismatch.
If a client in one of those categories asks for "brutalist," that's worth a direct
conversation about what problem they're actually trying to solve before building anything.

## Component-kit and font licensing

Lighter gate than in the other skills, but not zero:

- **System fonts** (Times New Roman, Arial, Courier New, etc.): no license question at
  all — they're not distributed, just referenced.
- **Google Fonts** (JetBrains Mono, Archivo Black, Anton, Space Mono, Unbounded, etc.):
  OFL/Apache, free commercial, self-hostable — same as noted throughout the other skills in
  this family.
- **shadcn-based neo-brutalist component kits** (BoldKit, neobrutalism-vue, community theme
  files): generally MIT or similarly permissive, matching shadcn/ui's own licensing — verify
  the specific kit's license file before depending on it in client work, since community
  contributions vary and licenses can differ kit to kit.
- **Figma community neo-brutalism files**: check each file's usage terms individually —
  "free to use" on a community file doesn't always mean unrestricted commercial use; some
  authors ask for credit or restrict resale of the file itself (not the sites you build with
  it, which are normally fine).

## Provenance note

Given how little of this style is actually "sourced" (most of it is hand-built CSS or
system fonts), a full asset manifest is often overkill — but if a component kit or a
specific font was pulled in, record it the same way as the sibling skills: source, license,
date, and any attribution requirement, so it can be traced later.
