---
name: open-image-prompts
description: Route image-generation prompt work to Open Image Prompts. Use for local prompt-image retrieval, visual reference comparison, source prompt lookup, art-direction cards, prompt taste selection, and bilingual derived prompts for AI image generation.
---

# Open Image Prompts Router

This is the shared root entry for `NanmiCoder/open-image-prompts`.

Use the smallest sub-skill that matches the request:

- `skills/img-gen-prompts/SKILL.md`: search real prompt-image pairs, inspect local galleries, compare references, copy exact source prompts, or retrieve traceable examples.
- `skills/img-gen-taste/SKILL.md`: develop art direction, choose a style card, improve an existing image prompt, or turn a subject/use case/reference into a compact creative spec.

Do not load both by default. Start with `img-gen-taste` when the visual direction is unclear; switch to `img-gen-prompts` when the user needs evidence, examples, image comparisons, or exact source prompts.

The repository data archive is intentionally not bundled here. If local preview images or the full prompt database are needed, follow the setup instructions in `skills/img-gen-prompts/SKILL.md` and keep the downloaded dataset in one shared checkout.
