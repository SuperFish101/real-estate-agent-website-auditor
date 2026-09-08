# The finding format and the report shape

_Layer 3 lookup. `rules.md` is the contract and points here. Nothing in this file is a
standard: the standards live in `reference/`, written by other people. This is the
auditor's own method, and it is here rather than in `rules.md` so the contract stays short
enough to read in one sitting._

Cited by `rules.md` sections 7 and 10.

---

## The finding format

```
F-007   ACCESS
Provision : WCAG-2.4.2  (reference/wcag/2-operable.md:181)
Provision text
  "Web pages have titles that describe topic or purpose."
Location  : pages/listings.html:6
Observed  : <title></title>
Verdict   : FAIL
Why       : The title element is present but empty, so it describes neither
            topic nor purpose.
Fix       : Give the page a title naming the topic, for example
            "Homes for sale in Davis, CA | Jane Agent".
See also  : none
```

Rules for the fields:

- `Location` is `file:line`, always. If the defect is the *absence* of something, cite the
  line where it should have been and say so.
- `Observed` is the literal text from the file, trimmed to one line. Never a description of
  what you saw.
- `Why` is one or two sentences connecting `Observed` to `Provision text`. If you cannot write
  that sentence without adding a rule of your own, the finding fails the drop rule.
- `Fix` is concrete and specific to this page. Never "improve accessibility."
- Number findings `F-001` upward, ordered by severity: LEGAL, BLOCKING, ACCESS, ELIGIBILITY,
  ADVISORY.

---

---

## What the report looks like

You produce **two artifacts, in this order**.

### 10.1 The findings ledger, `output/audit-<site>-<date>.md`

For the person doing the work. Five parts:

1. **Header.** What was audited, which files, which standards and their retrieval dates, and
   the date of the audit.
2. **Summary counts.** One line per severity band, plus the verdict counts. No prose.
3. **Findings.** Every FAIL, in the format in section 7, severity order.
4. **The full provision ledger.** Every provision in `reference/`, with its verdict. This is
   the part that makes it an audit. It is long and that is correct.

   **Every row says why, in the row.** A FAIL row that reads only "F-008" is not a ledger
   entry, it is a footnote, and it forces the reader to jump up the document to learn what is
   wrong. Write the reason first, in a sentence a non-technical reader follows, then the
   finding ID in bold at the end for anyone who wants the full evidence. The same applies to
   every other verdict: NOT APPLICABLE says which fact made it inapplicable, INSUFFICIENT
   EVIDENCE says what would settle it, REQUIRES BROWSER says what a browser would measure, and
   REQUIRES HUMAN says what the person is being asked to look at. **A bare verdict with no
   reason is the one thing a ledger may never contain.**
5. **Scope and limits.** What you could not check and why, in plain sentences. Always includes
   the WCAG criteria that need a browser or a person, and the count that applies to this run:
   20 of 50 reachable without a browser, 34 of 50 with one.

### 10.2 The client summary, `output/summary-<site>-<date>.md`

One page for the site owner, who is not technical. Use `templates/client-summary.md`. Rules:

- Lead with what **passed**. The first thing the reader sees is what is already right.
- Then the failures, worst first, in plain English, each with its plain-English consequence
  and the provision ID in brackets so a developer can trace it.
- No jargon that is not explained in the same sentence.
- End with the scope and limits, in the same words as the ledger. Never let the summary imply
  wider coverage than the ledger.
- **Never add a recommendation that is not already a finding in the ledger.** The summary is a
  view of the audit, not a second document with opinions in it.