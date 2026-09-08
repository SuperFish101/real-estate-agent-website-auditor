# WCAG 2.1, Level A and AA: what is in this folder

Router for one standard split across five files, because a single 715 line file broke the
200 line reference cap and forced an agent to load all four principles to check one criterion.
Load only the principle your check belongs to.

| File | Holds | Criteria | Lines |
|---|---|---|---|
| `conformance.md` | Section 5.2.1, Conformance Level. The provision that gives an ACCESS finding its consequence | 1 | 31 |
| `1-perceivable.md` | Principle 1. Text alternatives, time-based media, adaptable, distinguishable. Contrast lives here | 20 | 305 |
| `2-operable.md` | Principle 2. Keyboard, timing, seizures, navigable, input modalities | 17 | 279 |
| `3-understandable.md` | Principle 3. Readable, predictable, input assistance | 10 | 108 |
| `4-robust.md` | Principle 4. Parsing, name role value, status messages | 3 | 66 |

Fifty criteria in total, which is every Level A and AA criterion in WCAG 2.1. Level AAA is
excluded because this auditor audits to Level AA.

**Which one do I open?** The first digit of the provision ID is the principle.
`WCAG-1.4.3` is in `1-perceivable.md`. `WCAG-4.1.1` is in `4-robust.md`.

**Do not read all five.** `method/wcag-static-checkability.md` tells you which criteria are
even reachable from source. Twenty are. Look up the one you are checking, open the one file
it lives in, and stop.

`1-perceivable.md` and `2-operable.md` are still over the 200 line cap. They are single
published principles and splitting them further would cut between a criterion and its
exceptions, which is worse for a reader checking a finding than a long file. The cap is a
guardrail for files this project writes, and every word in these five is W3C's.
