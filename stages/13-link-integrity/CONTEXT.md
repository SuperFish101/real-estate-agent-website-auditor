# Stage 13: Do the links work, and are the paid ones declared

Standard this stage enforces: `reference/google/qualify-outbound-links.md`, plus `BING-5` and
`BING-7` from `reference/bing/bing-webmaster-guidelines.md`

## Inputs

| Source | File/Location | Section/Scope | Why |
|---|---|---|---|
| Standard | `../../reference/google/qualify-outbound-links.md` | Full file | The `rel` vocabulary and the evidence bar for a paid-link finding |
| Standard | `../../reference/bing/bing-webmaster-guidelines.md` | `BING-5` and `BING-7` only | Crawlable internal links, and 301 versus 302 |
| Prior stage | `output/<run>/03-inventory.md` | Every link, with its line | The list to work from |
| Artifact | the folder under audit | Every HTML file | Internal targets are checked against files you were given, never against the live web |

## Process

1. **Internal links first.** For each link whose target is inside the artifact, check the file exists. A link to a page you were not given is INSUFFICIENT EVIDENCE, not a broken link: you were handed one page out of a site. Say which, and say that supplying the other pages would settle it.
2. **Fragment links.** `#section` targets are fully checkable from source. A fragment with no matching `id` on the page is a real FAIL, and it is the most common broken link on a one-page site.
3. **Outbound links.** Record every external host and count the links to it. **Do not fetch them.** A saved-artifact audit makes no network calls, and a 404 today is not evidence about the page as captured. Reachability is REQUIRES BROWSER, and the finding names the command that settles it.
4. **Redirect chains** are REQUIRES BROWSER for the same reason. When a browser is available, follow each outbound link once and record the status and the chain length. `BING-7` gives 301 for permanent moves and 302 only for changes shorter than two days, so a 302 that has clearly been in place for years is worth a note, never a finding, because you cannot know how long it has been there.
5. **Paid links.** Read the evidence bar in the Google file before writing anything. A `LINK-REL-sponsored` finding needs the artifact's own words marking the placement as paid, sponsored, advertising or affiliate, or a line in `NOTES.md`. **Absent that, INSUFFICIENT EVIDENCE.** You cannot see money.
6. **Crawlable links, `BING-5`.** Anything that navigates on click but is not an `<a href>`, such as a `<div onclick>` or a button with a JavaScript handler, is not a crawlable link. Report it. This overlaps `WCAG-2.1.1` in stage 07: same defect, two provisions, two findings, each with a `See also`.

## Outputs

| Artifact | Location | Format |
|---|---|---|
| Link findings | `output/<run>/14-link-integrity.md` | Findings plus a ledger of every link checked, by target |

## Audit

Run before writing to `output/`. If a check fails, revise first.

| Check | Pass Condition |
|---|---|
| No outbound link was fetched without the browser | The audit reads the artifact. Reachability is a browser job and is labelled as one |
| No paid-link finding rests on a guess | Quote the artifact's own wording, or the verdict is INSUFFICIENT EVIDENCE |
| A missing page is not called a broken link | You were given one page. Say so, and say what would settle it |
| Every fragment link was checked | These are fully static and there is no excuse for missing one |
