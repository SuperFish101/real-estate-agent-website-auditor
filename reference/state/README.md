# reference/state/: the swappable part

Most of what this auditor checks is federal or universal and applies to an agent anywhere in
the United States. A small part is state law, and that part swaps.

**One state is loaded per run. The others are not read at all.** Running a Texas agent's site
and printing a page of California rules marked NOT APPLICABLE is noise pretending to be
thoroughness. The report only ever contains the state the agent actually practises in.

## What is wired now

| State | Folder | Standards |
|---|---|---|
| California | `ca/` | 10 CCR 2773 (licence number and broker on the website), B&P 10140.8 / AB 723 (AI-altered listing images), B&P 22575 CalOPPA (privacy policy posting) |

**California only, on purpose.** Nobody needs fifty states. An agent needs one, maybe two.
Pre-wiring all fifty would mean forty-eight folders nobody opens, each quietly going stale,
each one a chance to cite a rule that changed two years ago. That is the failure this whole
tool exists to prevent, so it is not going to be the tool's own design.

## What happens for a state that is not wired

Stage 02 builds it, before the audit runs. It is a research pass with a fixed recipe, not a
guess: find the state's real estate commission advertising regulation, its licence
identification requirement, any AI or altered-image disclosure law, and the state privacy
statute. Vendor each verbatim with a provenance table, add a row to `SOURCES.tsv`, then start
the audit.

The recipe is `_TEMPLATE.md`. It names exactly what to search for and where.

## What is NOT in here, because it is federal and applies everywhere

`../fair-housing/24-cfr-100-75.md` and `../fcc/47-cfr-64-1200-consent.md`. Fair housing and
the TCPA bind an agent in every state. They never swap.
