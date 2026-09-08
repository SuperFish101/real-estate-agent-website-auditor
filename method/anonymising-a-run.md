# Anonymising a run against somebody's real website

_Layer 3 lookup. `rules.md` is the contract and points here. Nothing in this file is a
standard. This is the auditor's own method for publishing a run against a real site whose
owner never asked to be audited._

Cited by `rules.md` section 1 and by `samples/README.md`.

---

## Why this file exists

This tool produces findings that name a licensee and say their site may not meet a rule whose
violation is a crime. It flags wording that touches fair housing. It reports missing texting
consent, which carries a private right of action.

Publishing that set of accusations against a real, named business that never asked for an
audit would be indefensible, whoever was right. But an auditor that has only ever run against
made-up HTML has not been tested. Both things are true, so the runs in `output/` are **real
sites with the identity taken out**.

## The rule

**Structure is kept. Identity is replaced. The report says which.**

Every audit run against a real site is published with the identifying details replaced by
placeholders of the same shape, and carries the header below saying so. Nothing else about the
page is touched: not the markup, not the layout, not the defects, not the line numbers.

**There is no exception and no permission route.** The auditor does not contact site owners and
does not publish a run under a real domain, whatever anyone agrees to. One rule, applied every
time, is the only version of this that cannot be got wrong in a hurry.

## What is replaced, and with what

Replace consistently across `index.html`, `robots.txt`, the manifest, every finding, and both
reports. The same real value always becomes the same placeholder.

| Real value | Becomes | Why this shape |
|---|---|---|
| The domain | `example-realty.test` | `.test` is reserved by RFC 2606 and can never be a real site, so nobody can go and look |
| The agent's name | `Agent Name` | Any two-word name keeps `CA-2773(a)-EACH`, which counts names against licence numbers |
| The brokerage name | `Example Brokerage` | Keeps `CA-2773(a)-BROKER` checkable |
| The licence number | Another **eight digit** number | The digit count is the whole check in `CA-2773(a)-LICENSE`. A seven digit placeholder would fake a failure |
| Phone numbers | `555` numbers | Reserved for fiction, so nobody is called |
| Street address | `1 Example Street`, real city kept | The city matters to `SD-LB-REQ-address` and to the spam check for stuffed city lists. The street does not |
| Email addresses | `agent@example-realty.test` | Same reason as the domain |
| Photos of people | Filename kept, file not committed | The manifest still records how the image was made, which is all the AB 723 pass reads |
| Distinctive page copy: blog titles, article headlines, taglines, URL slugs | Generic equivalents of the same shape and length | **This is the one people forget.** Everything else hides who the owner is. A distinctive sentence still *finds* them: paste one blog title into a search engine and you get one site. Replace with the same heading level, the same link text style and a similar length, so every check reads the same structure |
| Site keys and form tokens: reCAPTCHA site keys, WordPress nonces, analytics IDs | Placeholders of the same shape | Public in the page, but each one identifies the property they belong to |

## What is never touched

- **The HTML structure, every tag, every attribute and every line number.** A finding cites
  `index.html:47` and the reader must find the defect there.
- **Every defect.** Nothing is repaired on the way in. If the redaction would fix a finding,
  the redaction is wrong and gets redone.
- **The city, the county and the state.** They decide which state pack loads and they are not
  identifying on their own.
- **Anything already published by the site as fiction**, such as stock testimonials.

## The check that the redaction actually worked

Run all four before committing a redacted run. Any hit means it is not anonymous yet.

1. `grep -ri "<real domain>"` across the whole folder, including `output/`. Zero hits.
2. `grep -ri "<real agent surname>"` across the whole folder. Zero hits.
3. `grep -rE "\b[0-9]{8}\b"` and confirm every hit is the placeholder licence number.
4. Search the web for the most distinctive sentence left in the page text. If the real site
   comes back on the first page of results, that sentence is a fingerprint: replace it, or drop
   the run. Marketing copy is often unique enough to identify a site on its own.
5. `wc -l` the page before and after. **The line count must not change**, and neither must the
   line any finding cites. Redaction that shifts a line number breaks every citation in the
   run, which is the one thing this tool cannot ship. Spot-check three cited lines after the
   redaction and before writing the report.

**What is not the goal.** This is not a promise that no determined person could ever work out
whose site it was. It is a promise that the run does not state or point at the identity, that
nothing in it can be pasted into a search box to find them, and that no reader learns who was
audited. Say it that way. Claiming more than that would be the same overreach the rest of this
tool refuses.

## The header every anonymised run carries

Fixed wording. It goes at the top of both the ledger and the client summary.

> **This run is against a real website, published with the identity removed.** The site is a
> real California real estate licensee's site, captured on the date above at the HTTP status
> shown. The domain, the licensee's name, the brokerage name, the licence number, the phone
> numbers and the street address have been replaced with placeholders of the same shape. The
> markup, the line numbers and every defect are exactly as they were found. **The redaction is
> deliberate.** The owner did not ask to be audited, and publishing a named criminal-liability
> finding against a business that never asked for one would be wrong, whether or not the
> finding is correct. The method is `method/anonymising-a-run.md`.
