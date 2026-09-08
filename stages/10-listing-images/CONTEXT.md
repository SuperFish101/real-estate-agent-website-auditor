# Stage 10: Are altered listing images disclosed

Standard this stage enforces: ``reference/state/ca/bpc-10140-8-ab-723.md``

## Inputs

| Source | File/Location | Section/Scope | Why |
|---|---|---|---|
| Standard | `../../reference/state/ca/bpc-10140-8-ab-723.md` | Full file, 102 lines | The whole statute plus the provision index |
| Artifact | `index.html` in the folder under audit | Every `<img>` and all visible text | Pass A. Needs no manifest |
| Artifact | `manifest.md` in the folder under audit | Full file | Pass B. The ONLY evidence of how an image was produced |
| Artifact | `NOTES.md` in the folder under audit | Jurisdiction and site control | Whether the statute applies, and whether (a)(2) applies |

## This stage runs in two passes, and pass A always runs

**Pass A is checkable from the page alone.** It answers: does this page carry any alteration
disclosure at all, and does it link to unaltered originals? That question has an answer whether
or not anybody filled in a manifest, and it must never be reported as INSUFFICIENT EVIDENCE.

**Pass B needs the manifest.** It answers: which images were altered? Nothing but the manifest
can answer it. You cannot see the images and you never guess from a file name.

The two combine into one honest sentence even when the manifest is empty:

> This page carries N images and contains no alteration disclosure and no link to unaltered
> originals. **If any one of those N images was digitally altered, this page does not meet
> `CA-10140.8(a)(1)` today.** Which of them was altered is the one fact this run does not have.

That sentence is a result, not a gap. Write it.

## Process

1. If the site is not a California real estate licensee advertising property for sale, the whole
   section is NOT APPLICABLE. Say which fact settled that.
2. **Pass A, always.** Count `<img>` elements. Search all visible text for alteration disclosure
   wording and for a link to unaltered originals. Record both counts and the exact strings found,
   or "none". Report this whether or not a manifest exists.
3. **Pass B, if the manifest has real rows.** Classify each row against `CA-10140.8(b)(1)` and
   `CA-10140.8(b)(2)`. Covered, excluded, or between the two lists.
4. For every covered image, test all four obligations separately, then `CA-10140.8(a)(2)`.
5. If every manifest row says UNKNOWN, pass B is INSUFFICIENT EVIDENCE and **pass A still
   carries the section**. Say what one sentence per image from the site owner would settle.
6. Group by obligation, not by image, where the defect and the fix are identical.

## Outputs

| Artifact | Location | Format |
|---|---|---|
| Listing image findings | `output/<run>/11-listing-images.md` | Pass A result, then findings, then a seven row ledger |

## Audit

Run before writing to `output/`. If a check fails, revise first.

| Check | Pass Condition |
|---|---|
| Pass A was run and its two counts are in the output | Every time, including when the manifest is empty |
| Every finding names its manifest row | No manifest row, no LEGAL finding. There is no exception |
| The section never reads only "INSUFFICIENT EVIDENCE" | Pass A always says something. A reader must never be told just to go and look |
| The not-legal-advice line is present | Every time this stage produces output |
