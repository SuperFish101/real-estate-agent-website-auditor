# manifest.md, blank

Copy this into the folder you are auditing and fill one row per image. Without it, the whole
AB 723 section of an audit is INSUFFICIENT EVIDENCE, because this auditor cannot see images
and will not guess which ones were altered.

Filled examples: `samples/fail-case/manifest.md` and `samples/pass-case/manifest.md`.

---

# Image manifest, {{LISTING_OR_PAGE}}

How each image on the page was produced.

| Image file | How it was produced | Original file |
|---|---|---|
| {{path}} | {{one sentence: photograph? what was changed? what tool?}} | {{path, or "none"}} |

## How to fill "How it was produced"

Say what was **done to the image**, not how it looks. The AB 723 pass classifies the row by
matching your words against two lists in the statute:

- Naming any element that was added, removed or changed makes the image **covered** under
  `CA-10140.8(b)(1)`. Furniture, fixtures, appliances, flooring, walls, paint colour,
  hardscape, landscape, facade, floor plans, views through windows, neighbouring properties.
- Naming **only** lighting, sharpening, white balance, colour correction, angle,
  straightening, cropping or exposure makes it **excluded** under `CA-10140.8(b)(2)`.

Wording that sits between the two lists gets INSUFFICIENT EVIDENCE, not a guess. "Cleaned up
a bit" is not enough. "Exposure lifted and cropped" is.
