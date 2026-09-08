# Audit pipeline: where do I go

Read `identity.md` and `rules.md` once, then work the stages in order. Each stage contract
names its own inputs, so you never load a standard before the stage that enforces it.

## Task Routing

| Task | Go To |
|---|---|
| Run a full audit | Stage 01, then 03 through 15, in order |
| **Check the rules are still current** | `stages/01-freshness/CONTEXT.md`. Runs first, every time, automatically |
| **Decide which state's law applies** | `stages/02-jurisdiction/CONTEXT.md`. Asks. Builds the pack if the state is not wired |
| List what is in the artifact | `stages/03-inventory/CONTEXT.md` |
| Can search engines index this page | `stages/04-indexability/CONTEXT.md` |
| Can Google, Bing and the AI assistants each read it | `stages/05-crawler-access/CONTEXT.md` |
| Is the markup valid and honest | `stages/06-structured-data/CONTEXT.md` |
| Does it meet WCAG 2.1 AA | `stages/07-accessibility/CONTEXT.md` |
| Is anything here a spam violation | `stages/08-spam-check/CONTEXT.md` |
| Is the licence number and broker on the page | `stages/09-licence-and-broker/CONTEXT.md` |
| Are altered listing photos disclosed | `stages/10-listing-images/CONTEXT.md` |
| Does any wording favour or exclude a group | `stages/11-fair-housing/CONTEXT.md` |
| Privacy notice and form consent | `stages/12-privacy-and-consent/CONTEXT.md` |
| Do the links work, and are paid ones declared | `stages/13-link-integrity/CONTEXT.md` |
| Turn findings into the two reports | `stages/14-report/CONTEXT.md` |

## The pipeline

```
01-freshness  ->  02-jurisdiction  ->  03-inventory  ->  04 ... 13 (ten checks)  ->  14-report
   (gate)            (gate)          (+ browser mode)     (independent of each other)      (assembles)
```

Stages 09, 11 and 13 read from **whichever state pack stage 02 loaded**. With California
loaded they enforce 10 CCR 2773, B&P 10140.8 and CalOPPA. With another state loaded they
enforce that state's equivalents, and California is not read, not mentioned, and not listed as
NOT APPLICABLE.

**Stage 01 repairs, it does not block.** If a standard has gone stale or been withdrawn, the audit
stops there. An auditor that enforces a dead rule is worse than no auditor, because it is
confidently wrong. Stages 04 through 13 are independent of each other and all depend on 01.

## Which standard each stage owns

| Stage | Standard | Severity it can issue |
|---|---|---|
| 01 | `reference/SOURCES.tsv`, every vendored standard | none. It repairs the reference set |
| 02 | none. It chooses the state pack | none |
| 03 | none. It observes, and in browser mode it measures | none |
| 04 | Google Search technical requirements | BLOCKING |
| 05 | RFC 9309, the sitemaps protocol, IndexNow, the Bing guidelines and the OpenAI, Anthropic and Perplexity crawler docs | ADVISORY, or BLOCKING via `GSE-TR-1` |
| 06 | Google structured data guidelines and `LocalBusiness` | ELIGIBILITY, ADVISORY |
| 07 | WCAG 2.1 Levels A and AA | ACCESS |
| 08 | Google spam policies | BLOCKING, and rarely |
| 09 | The loaded state pack, licence identification | LEGAL |
| 10 | The loaded state pack, altered listing images | LEGAL |
| 11 | 24 CFR 100.75 | **none. This stage issues no verdict at all** |
| 12 | The loaded state pack privacy law, and 47 CFR 64.1200(f)(9) | LEGAL |
| 13 | Google's outbound link guidance | ADVISORY |
| 14 | none. It assembles what the other stages found | none |

No stage may issue a severity that is not in its row. A severity comes from the standard that
was broken, never from how serious the finding feels. **There is no score.** A score is an
opinion wearing a number.

## Browser mode

**On by default. Every audit runs it when the Playwright tools are present.** Stage 03 renders the page and writes
`output/<run>/03b-render.md`, and stages 08 and 10 read numbers out of it instead of leaving
those rows at REQUIRES BROWSER. It reaches contrast, keyboard operability, focus visibility,
reflow and the licence type size, taking WCAG coverage from 20 of 50 criteria to 34. The
method is [`method/browser-mode.md`](method/browser-mode.md). It adds evidence, never a rule.

## Before you start

The evidence bar in `rules.md` section 6 rises with severity. Read it before stage 07 and
stage 08, which are the two that can do real damage to a real business if you get them wrong.
