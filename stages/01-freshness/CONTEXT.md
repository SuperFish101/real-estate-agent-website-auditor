# Stage 01: are the rules we audit against still the current rules

Runs first, every time, before anything is read from the site under audit. Not optional and
not a thing a person remembers to do.

**It repairs, it does not block.** A rule that changed is a reason to update the rule and keep
going, not a reason to abandon the audit. The only thing it refuses to do is audit against a
rule it knows is dead.

Two standards went stale under this repo while it was being written. **24 CFR part 109**, the
fair housing advertising rule almost every real estate marketing guide still cites, was
removed from the eCFR on 26 October 2020. **RFC 7489**, the DMARC standard almost every email
guide still cites, was obsoleted in May 2026. An auditor that enforces either one is
confidently wrong, which is worse than being silent.

## Inputs

| Source | File/Location | Section/Scope | Why |
|---|---|---|---|
| Registry | `../../reference/SOURCES.tsv` | Full file | One row per vendored standard: file, source URL, retrieval date, canary phrase |
| Script | `../../check-standards-freshness.sh` | Run it, **if this host can run a shell** | Does the fetching and matching. No shell? Step 0 below is the whole stage |
| Pointers | `../../reference/POINTERS.md` | Full file | Standards that apply but are not vendored, for the closing section of the report |

## Process

**Step 0. Can this host run a shell and reach the network?** That decides which of two paths this
stage takes. Both are valid runs and neither is a defect.

**No shell or no network** (a plain Claude project, an attached-folder chat, an offline run):
**declaring the vendored dates satisfies this stage, and the audit continues.** Do not attempt the
script, do not report a failure, and do not stall waiting for a tool that is not there. Take the
`Retrieved` dates from `../../reference/SOURCES.tsv`, record them in `output/<run>/01-freshness.md`
with the reason freshness was not re-checked, and put this sentence in both report headers:
**"The standards in this run were not re-checked against their live sources. They were vendored on
the dates listed and are trusted as of those dates."** Then go to stage 02. That is an honest run.
What it is not is a claim that the rules are current, and the header must never imply one.

**Shell and network available:** run the full check, from step 1.

1. Run `./check-standards-freshness.sh` from the repo root.
2. Read the result for every row. There are five outcomes and each has a different consequence.
3. **The audit does not stop. It repairs and continues.** Halting on a stale rule would mean a
   rule change silently costs the client their whole audit. Each outcome has a repair.
4. **CURRENT**: the canary is still on the live page. Nothing to do.
5. **STALE**: the page resolves but our wording has changed. **Re-vendor it now.** Fetch the
   source, replace the file's body, keep the provenance table and update its `Retrieved` date,
   then run `./verify-citations.sh`. Line pointers will have moved, so fix them. Record in
   `01-freshness.md` exactly what text changed, old and new, and carry that diff into the
   report so the reader can see the rule moved under them. Then continue the audit against the
   new text.
6. **WITHDRAWN**: 404 or 410, the Part 109 case. You cannot auto-repair this, because a
   rescinded rule has no replacement text to fetch. Do three things and keep going: mark every
   provision in that file `NOT VERIFIABLE`, skip the stage that owns it, and put a plain
   sentence at the top of the report saying which standard could not be confirmed and what
   part of the audit is therefore missing. **Never audit against it, and never silently drop
   it.**
7. **BLOCKED**: 403 or 429. Bot blocking, not withdrawal. W3C and Justia both refuse plain
   curl. Open the URL in a browser, check the canary by eye, note who checked, continue.
8. **UNREACHABLE**: network. Re-run once. If it fails again, treat as BLOCKED.
9. Record everything in `output/<run>/01-freshness.md` with today's date. Every report states
   which standards were confirmed current, which were re-vendored, and which could not be
   confirmed.

## Outputs

| Artifact | Location | Format |
|---|---|---|
| Freshness record | `output/<run>/01-freshness.md` | The script's output, verbatim, plus the date and any by-hand checks |

## Audit

| Check | Pass Condition |
|---|---|
| The stage took one of the two paths, and said which | Either the script output carries **today's** date (not a copied result from a previous run), or `01-freshness.md` states that no shell was available and lists the vendored dates instead. A run that silently skipped both has failed this check |
| Every STALE file was re-vendored before the audit continued | Its `Retrieved` date is today, and `verify-citations.sh` exits 0 |
| Every WITHDRAWN standard is named in the report header | The reader learns what could not be checked without hunting for it |
| Every BLOCKED row was checked by hand | Each one names the person who opened it and what they saw |
| The record goes in the report | The findings ledger states which standards were confirmed current and on what date |
