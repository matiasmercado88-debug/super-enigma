# Accessibility & Fallback

This is the gate that matters most in this skill — the equivalent of the legibility check
in `brutalist-web-sourcing` or the consistency model in `illustrated-narrative-sourcing`.
An immersive experience that only works for someone with a recent GPU, full vision, a
stable vestibular system, and JavaScript enabled hasn't shipped an inclusive "immersive
web experience" — it's shipped a demo for people who match the developer's own setup.

## Canvas content is invisible to screen readers by default — plan real alternative content

A `<canvas>` element is, by default, a blank box to assistive technology — whatever text,
labels, or narrative meaning lives inside the 3D scene doesn't exist for a screen-reader
user unless it's deliberately provided elsewhere. This isn't a minor edge case to patch
later; design the alternative content as a real, first-class deliverable:

- Provide the same key content (product description, narrative beats, calls to action) as
  actual DOM text somewhere on the page, not only as visual elements inside the 3D scene.
- Use `aria-label` or a visually-hidden text description on the canvas container to
  summarize what the scene shows, so a screen-reader user gets *something* even if they
  don't get the visual experience itself.
- Make sure every interactive control that matters (navigation, a "next section" action, a
  CTA) exists as a real, keyboard-reachable DOM element — not something only triggerable by
  hovering or dragging inside the canvas.

## No-JS and load-failure paths

3D scenes depend on JavaScript loading and executing successfully — and on the model,
texture, and shader assets actually downloading. Plan for the case where any of that
doesn't happen:

- A `<noscript>` block with real content (not just "please enable JavaScript") so a
  no-JS visitor still gets the substance of the page.
- A loading-failure fallback (a static hero image, real text) if the 3D bundle fails to
  load or times out on a slow connection — don't let a failed WebGL context leave a blank
  screen.

## `prefers-reduced-motion` for camera movement — a safety issue, not a preference

Scroll-driven camera movement through a 3D scene is a stronger trigger for vestibular
discomfort (dizziness, nausea) than an ordinary fade or slide — simulated first-person or
near-first-person movement is a well-established motion-sickness trigger, closer in kind to
a VR experience than to a webpage animation. Treat `prefers-reduced-motion: reduce` as a
requirement to fundamentally change the experience, not just slow it down:

- Under reduced motion, replace scroll-driven camera movement with either a static camera
  view of each scene (cut between fixed viewpoints instead of moving continuously between
  them) or drop the 3D camera entirely in favor of the accessible fallback content.
- Any object rotation, parallax, or particle motion that's purely decorative should stop or
  reduce dramatically under reduced motion, same as in every other skill in this family —
  but the camera-movement case specifically deserves the strongest response, since it's the
  one most likely to cause real physical discomfort, not just visual busyness.

## Device and bandwidth exclusion is an accessibility question too

A visitor on a five-year-old phone or a constrained mobile data plan who gets a frozen tab
or a multi-minute load time is just as excluded from the experience as someone using a
screen reader — treat this as part of the same accessibility conversation, not a separate
"nice to have" performance concern:

- Detect actual device capability (a basic WebGL/WebGPU feature check, or a simple
  heuristic like `navigator.hardwareConcurrency` / connection type via the Network
  Information API where available) and serve the lighter fallback proactively rather than
  making every visitor download the full experience to find out it doesn't run well for
  them.
- Budget real testing time on a genuinely mid-range or older device, not just the
  development machine — see `optimization.md`.

## The fallback is not a lesser version to be ashamed of

A well-built static or simplified fallback — real photography or a rendered still image of
the product, clear text, a normal scrolling page — is a completely legitimate, complete
experience on its own, not an apology for the people who "didn't get" the real site. Design
it with the same care as the 3D version, because for a meaningful share of real visitors,
it *is* the site.
