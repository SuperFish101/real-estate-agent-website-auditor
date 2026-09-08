# Stage 06: Is the markup valid and honest

Standard this stage enforces: ``reference/google/structured-data-general-guidelines.md``

## Inputs

| Source | File/Location | Section/Scope | Why |
|---|---|---|---|
| Standard | `../../reference/google/structured-data-general-guidelines.md` | Full file, 176 lines | Format, access, content, relevance, completeness, location, specificity |
| Standard | `../../reference/google/local-business-structured-data.md` | Full file, 111 lines | Required and recommended properties |
| Prior stage | `output/<run>/03-inventory.md` | The JSON-LD blocks and the visible headings | You compare one against the other |

## Process

1. Parse every JSON-LD block. A block that does not parse is a `SD-GEN-FORMAT-1` finding.
2. For each item, take every marked-up value and search the visible body text for it. Anything present in the markup and absent from the page is `SD-GEN-CONTENT-4`. This is the check that catches the most on real sites.
3. If the type is `LocalBusiness` or one of its subtypes, test `name` and `address`. Both are required. Missing either is ELIGIBILITY.
4. Test each recommended property. Absent is ADVISORY, never ELIGIBILITY.
5. If `aggregateRating` or `review` is present, establish whether the site captures reviews **about other businesses**. If it does not, cite `SD-GEN-CONTENT-5`. A business rating itself is the single most common defect on a small business site.
6. Check the type is the most specific applicable subtype. Cite `SD-GEN-SPECIFICITY-1` at ADVISORY.

## Outputs

| Artifact | Location | Format |
|---|---|---|
| Structured data findings | `output/<run>/06-structured-data.md` | Findings plus a 26 row ledger |

## Audit

Run before writing to `output/`. If a check fails, revise first.

| Check | Pass Condition |
|---|---|
| No rich result type outside LocalBusiness is judged | Breadcrumb, FAQ, Article and Product markup is reported NOT COVERED, because their property tables are not in reference/ |
