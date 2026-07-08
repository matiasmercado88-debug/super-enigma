# Licensing & Client-Work Safety

Practical guidance for shipping bold-brand assets to a client's live site without a legal
mess. **Not legal advice** — a working framework to catch the mistakes that actually bite.
For high-stakes work, confirm anything uncertain with the client's counsel.

The bold look leans on **paid display fonts** and **mixed-license illustration/SVG packs**,
so licensing bites harder here than in stock-photo work. The two things that go wrong most:
a "trial" or "personal" font file shipped on a live client site, and a CC-BY illustration
pack used without the required credit.

## License families you'll meet

- **SIL OFL (Open Font License)** — the free-font standard (Velvetyne, Google Fonts,
  Fontshare). Free commercial, self-hostable, embeddable; don't sell the font by itself;
  keep the license file with the project. No attribution in output.
- **Paid foundry webfont licenses** (Pangram Pangram commercial, Displaay, Grilli Type, ABC
  Dinamo, Klim) — you buy a specific scope. Read it: **web vs desktop vs app**, **traffic/
  pageview tier**, **self-host vs foundry-hosted**, number of domains. A desktop license does
  NOT cover a website. Buy the right tier for the client's traffic.
- **"Trial" / "Personal use" font files** — for comps and personal projects only. **Never on
  a client's live site.** This is the #1 font-licensing mistake.
- **CC0 / Public Domain** — no rights reserved, no attribution, commercial OK. Safest bucket
  (Open Doodles, many SVG Repo items).
- **MIT / ISC / Apache-2.0** — permissive; free commercial, keep the notice file. Covers
  Rough.js, Lenis, GSAP, unDraw (effectively), most icon libraries. No attribution in output.
- **CC-BY** — free commercial **but attribution required** in the format the license
  specifies. Common on illustration packs (some Storyset/Freepik tiers). Fine if you credit.
- **CC-BY-SA / CC-NC** — share-alike is awkward; **NonCommercial is out for client work.**
  Watch for these on "free" illustration and sticker packs.
- **Mixed-license libraries** (SVG Repo, Figma Community, Freepik) — license is **per asset**,
  not per site. Check each item you actually use; don't assume the platform's headline terms.

## GSAP & Lenis specifically

- **GSAP** — 100% free including all plugins, **commercial use included**, since April 2025
  (Webflow). No Club license required. Keep the standard license reference.
- **Lenis** — MIT, free commercial.
Both are safe for client work; still list them in `ASSETS.md`.

## The client-work checklist

Run every asset through this before it ships. Wrong answer → fix or replace.

1. **Commercial use allowed?** No CC-NC, no "personal use only" fonts, no trial files.
2. **Font license tier correct?** Confirm **webfont + self-host** rights and the right
   **traffic tier**. Paid foundry desktop licenses don't cover websites. Adobe Fonts are
   served by Adobe (fine, but not self-hosted — affects portability).
3. **Attribution required?**
   - OFL fonts / MIT icons / GSAP / Lenis / unDraw: no attribution in output (keep license files).
   - CC-BY illustration or SVG packs: **yes** — credit as specified.
   - Free-stock imagery via an **API** (if you pull any photos): yes — credit platform +
     author; standard download: no.
4. **Per-asset license checked on mixed libraries?** SVG Repo, Figma Community, Freepik —
   verify the specific star/sticker/illustration you're using, not the site's general terms.
5. **AI-generated illustration?** Rights are evolving and tool-specific — confirm the tool's
   current commercial terms; avoid real-person likeness, trademarks, and copyrighted
   characters; note that purely AI-generated images may not be copyrightable (affects the
   client's exclusivity). Disclose if the client or platform requires it.
6. **Trademarks / real brands in devices or illustration?** Don't imply a brand endorses the
   client. Don't rebuild a recognizable existing logo/mark as a "device."

## The `ASSETS.md` manifest

Keep a manifest in every project so any asset can be traced and defended in minutes:

```md
# Asset provenance

| Asset               | Type        | Source        | URL / ID                      | License              | Attribution | Date       | Notes                       |
|---------------------|-------------|---------------|-------------------------------|----------------------|-------------|------------|-----------------------------|
| le-murmure.woff2    | font        | Velvetyne     | velvetyne.fr/fonts/le-murmure | OFL                  | No          | 2026-07-07 | Subset Latin; woff2         |
| pp-neue-montreal    | font        | Pangram Pangram | pangrampangram.com/…        | Paid webfont (tier X)| No          | 2026-07-07 | Commercial license #____    |
| seal, stars, arrows | device      | Built (SVG)   | in /assets/devices/           | Original             | No          | 2026-07-07 | Inline SVG, currentColor    |
| blob-01.svg         | device      | Haikei        | haikei.app                    | Free (generated)     | No          | 2026-07-07 | Recolored to palette        |
| hero-illus.svg      | illustration| unDraw        | undraw.co                     | unDraw (free)        | No          | 2026-07-07 | Recolored to --accent       |
| GSAP + ScrollTrigger| motion lib  | GreenSock     | gsap.com                      | GSAP no-charge       | No          | 2026-07-07 | Free incl. commercial       |
| Lenis               | motion lib  | Darkroom      | github.com/…/lenis            | MIT                  | No          | 2026-07-07 | Smooth scroll               |
```

Store the actual license text files (OFL.txt, MIT LICENSE, the paid-font invoice/license PDF)
alongside the assets. For a paid font especially, **keep the purchase record** — it's the proof
you licensed it correctly if anyone ever asks.

## Territory note

These licenses are worldwide, so an Argentine studio building for any client is covered by the
same terms. The practical checklist above is what matters day to day: clear commercial use,
buy the right font tier, credit CC-BY packs, check mixed libraries per-asset, keep records.
