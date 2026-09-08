# How to build a state pack

Followed by stage 02 when an audit is requested for a state that is not yet wired. Every
step names what to find and where. A state pack that skips a step says so rather than
pretending the state has no such rule.

**Never write a state pack from memory.** Every file needs a provenance table with a live
source URL, and every source URL needs a canary row in `SOURCES.tsv` so the freshness gate
can watch it. A remembered regulation is exactly how 24 CFR 109 gets cited in 2026.

## The four things to look for

| # | What | Where it usually lives | California's answer, as a worked example |
|---|---|---|---|
| 1 | **Licence identification in advertising.** Must the licensee's number and their broker appear on their own website? | The state real estate commission or department's regulations, plus the enabling statute | 10 CCR 2773, which names websites explicitly. Enabling statute B&P 10140.6 |
| 2 | **Team and trade name rules.** May the site brand itself as a team or company, and what must appear alongside | Same regulations, usually the section next door | 10 CCR 2770 to 2774 |
| 3 | **Altered or AI-generated listing image disclosure** | The state legislature. New in several states since 2025, so search the current session, not just the code | B&P 10140.8, added by AB 723, in force 1 January 2026 |
| 4 | **State online privacy law.** Must a commercial site collecting personal information post a privacy policy | The state code, business or consumer protection division | B&P 22575, CalOPPA |

## Where to search, in order

1. The state real estate commission's own site, for regulations and any published advertising
   advisory. Texas is TREC, Florida is FREC via DBPR, New York is DOS. Search for
   "advertising" plus "rule" plus the commission's name.
2. The state's official legislature or code site. Prefer it over Justia, Cornell or FindLaw:
   those are mirrors, and mirrors go stale. Use a mirror only when the official site blocks
   automated fetching, and say in the provenance table that you did.
3. A search for the state name plus "real estate advertising rule" plus the current year, to
   catch anything enacted in the last session that has not reached the code yet.

## The checks before a pack goes live

1. **Every file has a provenance table** with publisher, source URL, version or effective
   date, retrieval date and licence. `verify-citations.sh` enforces this.
2. **Every file has a provision index** with stable IDs, prefixed by the state:
   `TX-...`, `FL-...`, matching how `CA-...` works.
3. **Every source has a row in `SOURCES.tsv`** with a canary phrase, so the freshness gate
   watches it from then on.
4. **Confirm it is current law.** Check the source for a repeal, a superseding section, or a
   pending amendment. Write what you checked into the provenance table.
5. **Say what you could not find.** If a state has no altered-image disclosure law, the pack
   says "searched on <date>, none found" and names where you looked. An absence you verified
   is useful. An absence you assumed is a lie.
6. **Run `./check-standards-freshness.sh`** before the first audit against the new pack.

## What a state pack never contains

Best practice, marketing advice, or anything from a brokerage's own manual. Published law and
regulation only. If it cannot be quoted from a government source and pointed at with a URL,
it belongs in `../POINTERS.md` or nowhere.
