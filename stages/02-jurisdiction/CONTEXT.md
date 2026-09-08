# Stage 02: which state's rules apply

Runs after the freshness gate and before anything is read from the site. It decides which
state pack loads. Every later stage inherits that decision.

**Ask, do not guess.** An agent's domain, phone area code and the towns named on the page all
suggest a state and any of them can be wrong. A licensee can live in one state and be licensed
in another. Guessing here silently applies the wrong law to somebody's business.

## Inputs

| Source | File/Location | Section/Scope | Why |
|---|---|---|---|
| The person requesting the audit | Their answer to the question below | The state, or states | The only reliable source. Nothing on the page settles it |
| Registry | `../../reference/state/README.md` | Full file | Which packs exist |
| Recipe | `../../reference/state/_TEMPLATE.md` | Full file | Only when a pack has to be built |
| Artifact | `NOTES.md` in the folder under audit | Any statement of jurisdiction | Skips the question when it is already answered in writing |

## Process

1. If `NOTES.md` states the licensing state, take it and say which line you took it from. Otherwise ask, in these words, and wait:

   > **Before I start: which state is this agent licensed in?**
   >
   > Most of what I check is federal or universal and applies anywhere in the US. Three things
   > are state law: whether the licence number and broker have to appear on the site, whether
   > AI-altered listing photos have to be disclosed, and whether a privacy policy has to be
   > posted.
   >
   > **California is wired up and ready.** Is this a California agent's website?
   >
   > If it is another state, you have two choices:
   >
   > **A. Research and wire up that state first.** I find that state's real estate advertising
   > rules, altered-image law and privacy law, show you what I found and where, and add them
   > permanently. It takes a few minutes and it is a **one time job**: once a state is wired,
   > every future audit for that state just uses it.
   >
   > **B. Skip state law entirely.** I run the eleven federal and universal checks and say
   > plainly in the report that no state law was checked. Good for a quick look, or for trying
   > the tool out.
   >
   > **Why the other 49 states are not already built in:** a rule nobody is watching goes
   > stale, and citing a rule that changed two years ago is the exact failure this tool exists
   > to catch. Forty nine folders nobody opens would each be a wrong answer waiting to happen.
   > So states get wired when somebody actually needs them, and the freshness check watches
   > every one from then on.

2. **California**: load `../../reference/state/ca/`, record it, go to stage 03.

3. **Another state, choice A**: build the pack before auditing. Follow `_TEMPLATE.md` exactly: the four things to look for, the search order, the six checks. Vendor each standard verbatim with a provenance table, add its `SOURCES.tsv` row with a canary, and run `../../check-standards-freshness.sh` against the new rows.

4. **Show the new pack and wait for a yes before using it.** List every standard found with its source URL, and every one of the four categories where you searched and found nothing. A category searched and empty is a result; a category skipped is a hole. This review is not optional and it is not skippable in a non-interactive run: if nobody can answer, fall back to choice B and say so in the report.

5. **Another state, choice B**: load no state pack. Stages 09, 10 and 12 are skipped, not run and marked NOT APPLICABLE. The report's first section says, in one sentence, that no state law was checked and which state it would have been.

6. If a licensee holds licences in more than one state, load every pack named and label each finding with the state it came from. Do not merge them.

7. Record the decision in `output/<run>/02-jurisdiction.md`: the state, how you learned it, which pack loaded, whether it was built today, and whether the person reviewed it.

## Outputs

| Artifact | Location | Format |
|---|---|---|
| Jurisdiction record | `output/<run>/02-jurisdiction.md` | The state, its source, the pack loaded, and any pack built today |
| A new state pack | `../../reference/state/<code>/` | Only when one had to be built. Same shape as `ca/` |

## Audit

| Check | Pass Condition |
|---|---|
| The state came from a person or a written note | Never inferred from the domain, an area code or a town name. The record says which |
| Exactly one state pack is loaded, unless the licensee holds several licences | No pack is loaded "just in case" |
| **No other state's provisions appear anywhere in the report** | Grep the finished report for the other state codes. A Texas audit that lists California rules as NOT APPLICABLE has failed this check. It is noise pretending to be thoroughness |
| A newly built pack was reviewed by a person before use | The record names who approved it and what the search came up empty on. No approval means choice B, never an unreviewed pack |
| Choice B is stated in the report, not hidden | If state law was skipped, the report's first section says so and names the state |
