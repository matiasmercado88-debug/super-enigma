# Rights & Licensing

Practical guidance for shipping 3D assets without a licensing mess. **Not legal advice** —
a working framework for the mistakes that actually bite here, which are more varied than in
the other skills in this family because 3D marketplaces routinely mix license types on the
same platform.

## 3D models — check every model individually

Unlike a font library or an icon set (usually one license for the whole set), 3D model
marketplaces frequently mix license types within the same catalog:

- **Sketchfab specifically** hosts models under CC0, CC-BY (attribution required), CC-BY-NC
  (no commercial use — a common trap for client work), a "Standard"/"Editorial" license
  (often more restrictive, sometimes disallowing commercial use or requiring specific
  clearance), and a paid Store tier with its own per-purchase terms. **Check the license on
  the specific model's page before using it** — never assume based on the platform's
  general reputation or on another model you've used before.
- **Poly Haven** — CC0 across the entire library (models, HDRIs, textures) — the one source
  in this category where "free for anything, no attribution" is a safe blanket assumption.
- **Quaternius and Kenney** — CC0, same safe-blanket assumption as Poly Haven.

## HDRIs and textures

Same logic as models — Poly Haven's CC0 library is the safe default; anything sourced
elsewhere (a texture site, a marketplace) needs its own license check, same as the raster
and texture guidance in `bold-brand-asset-sourcing/references/sources.md`.

## Audio (if the experience uses sound design)

Licensed music/SFX libraries, or original composition, follow the same commercial-use and
attribution logic as any other licensed asset — confirm web/streaming use is covered
(some music licenses are scoped to video/broadcast and don't automatically cover
interactive web use) and keep the license record in the provenance manifest.

## Engine and library licensing

- **Three.js** — MIT, free commercial, no attribution required in output.
- **React Three Fiber / drei** — MIT, same.
- **Babylon.js** — Apache-2.0, free commercial, keep the notice file.
- **tsParticles** — MIT.
- **Theatre.js** — check current license (has had both open-source and commercial-tier
  offerings historically — verify current terms before depending on advanced features for
  client work).
- **Spline / PlayCanvas** — commercial platforms with their own terms; verify current
  pricing and export/commercial-use terms before committing (see the pricing caveat in
  `sources.md` and in `illustrated-narrative-sourcing/references/sources.md`).

## Provenance manifest

Same spirit as the sibling skills, with the fields that matter for 3D work specifically:

```md
# 3D asset provenance

| Asset            | Type    | Source      | License        | Attribution | Date       | Notes                          |
|-------------------|---------|-------------|-----------------|-------------|------------|----------------------------------|
| hero-object.glb   | model   | Sketchfab   | CC-BY           | Yes, footer | 2026-07-07 | Credited per model page terms   |
| studio.hdr        | HDRI    | Poly Haven  | CC0             | No          | 2026-07-07 | —                                |
| ambient-loop.mp3  | audio   | licensed lib | Web/streaming  | No          | 2026-07-07 | License covers interactive web  |
```

For agency/client work, this is what turns a licensing question into a five-minute lookup
instead of a scramble — especially valuable here given how often licenses mix within a
single marketplace.
