# Rights & Ethics

Practical guidance for shipping character and scene illustration without a legal or
ethical mess. **Not legal advice** — a working framework for the mistakes that actually
bite in this specific area, which is more fraught than plain font or stock-photo licensing
because of two things: commissioned-art contracts vary widely in what they actually grant,
and AI-generated character art sits in a genuinely unsettled ethical and legal space around
style mimicry.

## Commissioned illustration — get the contract scope right

A commission's price often has little to do with what rights it actually grants. Before
work starts, the brief or contract should state:

- **Usage scope**: web use only, or broader (print, app, merchandise, advertising)? A
  quote for "a mascot for the website" doesn't automatically cover using the same art on
  packaging or a billboard later.
- **Exclusivity**: can the illustrator reuse this character or a near-variant of it for
  another client? Exclusive rights typically cost more — decide if it matters for this
  brand before assuming it's included.
- **Editing rights**: can the client (or another illustrator, or an AI tool) modify, extend,
  or produce new poses of this character later without going back to the original artist?
  Get this in writing — it's the single most common source of friction on illustration
  contracts, since "the artist retains the original files" and "the client can commission
  variations from anyone" are very different defaults.
- **Credit requirements**: some illustrators require visible attribution; confirm and honor
  whatever was agreed.

## AI-generated character art — the ethical dimension, not just the legal one

This goes beyond the general AI-imagery rights notes that apply to any generated image
(rights posture is evolving and tool-specific, real-person likeness is off-limits, output
copyright itself may be uncertain in some jurisdictions — verify current terms for whichever
tool you use). Character illustration specifically raises one more issue:

- **Style mimicry of a living, identifiable illustrator.** Prompting a tool to generate "in
  the style of [a specific named illustrator]" — especially one without a broad licensing
  business around their style — is an active ethical and legal gray zone. A number of
  working illustrators have publicly objected to their signature style being reproduced this
  way without consent or compensation, and some jurisdictions are actively litigating
  related questions. Avoid naming a specific living artist's style in a prompt for client
  work; describe the *qualities* you want (line weight, palette, mood) instead of a name.
- **Disclosure**: as with any AI imagery, some clients or platforms require disclosing that
  character art is AI-generated. Ask; when in doubt, disclose.
- **Exclusivity is harder to guarantee**: if a character's copyrightability is uncertain
  (a risk with purely AI-generated output in some jurisdictions), the client may not be able
  to stop a competitor from generating something very similar. Flag this explicitly if the
  client cares about owning a truly exclusive mascot — it may tip the decision toward
  commissioning a real illustrator instead.

## Open illustration systems — license varies per set, sometimes per asset

Don't assume "free illustration library" means uniform terms across the whole library:

- **unDraw, Open Doodles**: genuinely open, free commercial, no attribution — the safest
  bucket.
- **Storyset, Blush, Icons8 Ouch, DrawKit**: mixed — some tiers/libraries require
  attribution, some restrict commercial use on free tiers, some libraries within the same
  platform come from different named artists with different terms. Check the specific set
  or library you're pulling from, not the platform's general marketing claim.

## Mascot / trademark considerations

If a character is becoming a **distinctive, recognizable brand identifier** (the way a
mascot often does over time), that's a separate legal question from the illustration's
copyright — trademark protects the character as a source-identifier for the business, on
top of whatever copyright protects the artwork itself. This is worth a conversation with the
client's counsel once a mascot is central enough to the brand that a competitor copying it
would cause real confusion — not something to resolve inside a sourcing workflow, but worth
flagging when it becomes relevant.

## Provenance manifest

Keep a record for every character/scene asset, same spirit as the manifests in the sibling
skills but with the fields that actually matter here:

```md
# Illustration provenance

| Asset               | Route        | Source / illustrator      | Rights scope        | Attribution | Date       | Notes                              |
|----------------------|--------------|---------------------------|----------------------|-------------|------------|-------------------------------------|
| mascot-hero.svg      | commissioned | Jane Doe (contract #___)  | Web, exclusive       | Yes, footer | 2026-07-07 | Contract on file, editing rights ceded |
| scene-02-ai.svg      | AI-generated | Tool X, prompt in /prompts/ | See rights-and-ethics.md | Disclosed | 2026-07-07 | No named-artist style used; manual hand-correction pass done |
| doodle-accent.svg    | open set     | Open Doodles               | CC0                  | No          | 2026-07-07 | Recolored to palette                |
```

For agency/client work, this record is what turns a dispute over a character's origin or
rights into a five-minute lookup instead of a scramble.
