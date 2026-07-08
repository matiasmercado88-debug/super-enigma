# Character & Scene Consistency

This is the file that prevents the failure mode this whole skill exists to avoid: drift.
A character that looks subtly different scene to scene reads as several different hands,
not one imagined world. Consistency is a system, not a vibe — write it down before
producing anything.

## The model sheet

Before commissioning, generating, or drawing a single production scene, lock a short
written model — even three or four lines is enough to keep everyone (an illustrator, an AI
tool, a future collaborator) matching the same character:

- **Line weight**: a single stroke width, or an explicit rule for how it varies (e.g.
  "outer silhouette 4px, interior details 2px" — consistent across every scene, not
  eyeballed per drawing).
- **Proportion system**: head-to-body ratio, limb/hand simplification level (how many
  fingers, how simplified), eye size and placement relative to head — the numbers that make
  a character recognizable even in silhouette.
- **Fill logic**: flat color, cel-shaded with one shadow tone, soft gradient, or textured —
  pick one and apply it to every character and prop in every scene.
- **Shape vocabulary**: rounded or angular, and how consistently (a character built from
  circles and soft curves shouldn't suddenly have a sharp angular prop next to it unless
  that's a deliberate, established contrast).
- **Palette**: a fixed, small set of hex values — not "warm tones" as a vibe, actual values,
  reused across every scene so nothing feels like it wandered in from a different project.
- **Reference sheet**: 2-4 existing images (or, for a from-scratch character, 2-4 reference
  poses established first) that anyone producing new material can hold up against their own
  output before calling it done.

## Reverse-engineering an existing character

When the brief is extending or animating a mascot that already exists (a client's existing
illustration, like auditing Pepper's own pepper icon before adding new scenes to it), trace
the model from the real artwork rather than approximating from memory or a quick glance:

- Measure the actual proportions in the source file (or a screenshot) rather than eyeballing.
- Sample the actual hex values used, not a close guess.
- Note the actual stroke width in pixels at the file's native size.
- If the character is SVG, read the path data directly — it tells you the real shape logic
  more precisely than any visual impression will.

Skipping this step is the single most common way a "consistent" addition turns out not to
match once it's placed next to the original.

## Keeping an AI-generated character consistent across scenes

The hardest practical problem in this whole skill. Approaches, roughly in order of
reliability (check your specific generation tool for which of these it actually supports —
capabilities here change quickly, so verify rather than assume):

1. **Character/style reference input**: if the tool accepts a reference image alongside the
   prompt (rather than text description alone), use it every time — this is far more
   reliable than describing the character in words and hoping the model reproduces it.
2. **Locked seed + consistent prompt scaffold**: reusing the same seed value and the same
   prompt structure (changing only the scene/action description) holds a look together
   better than a fresh prompt each time, though it's less reliable than a true reference
   input where available.
3. **Generate a reference sheet first, then compose from it**: produce a clean set of
   reference poses/expressions for the character in isolation before generating any actual
   scene, and feed those references into every subsequent generation rather than starting
   from zero each time.
4. **Tight style constraints in every prompt**: explicit, repeated constraints ("flat vector
   illustration, 3px outline, no gradient, [palette hex values]") reduce drift even without
   a reference-image feature, because they narrow what the model can vary scene to scene.
5. **Manual correction pass**: budget time to redraw or touch up the details that drift even
   with the above (hands, facial proportions, and color are the most common drift points) —
   full automatic consistency across many scenes is not a solved problem with current
   tools, so plan for a human consistency pass rather than expecting zero drift.

Whatever the tool, run every output against the model sheet above before accepting it —
don't rely on "it looks close enough" in isolation; hold it next to an actual reference.

## Consistency checklist before shipping a new scene

- [ ] Line weight matches the model (or the documented variation rule).
- [ ] Proportions match — same head-to-body ratio, same hand/limb simplification.
- [ ] Fill logic matches (flat stays flat; don't let one scene sneak in a gradient).
- [ ] Palette uses only the locked hex values.
- [ ] Held up directly next to an existing reference scene — not judged in isolation.
- [ ] If AI-generated, passed a manual correction check on hands, face, and color.
