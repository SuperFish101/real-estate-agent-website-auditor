# Stage 14: Assemble the two reports

Standard this stage enforces: `Everything above`

## Inputs

| Source | File/Location | Section/Scope | Why |
|---|---|---|---|
| Prior stages | `output/<run>/[01][0-9]-*.md` | Full files | The findings and ledgers to assemble |
| Method | `../../method/finding-format.md` | Full file | Both output shapes |
| Template | `../../templates/client-summary.md` | Full file | The blank for the second output |

## Process

1. Assemble the findings ledger. Renumber findings `F-001` upward in severity order: LEGAL, BLOCKING, ACCESS, ELIGIBILITY, ADVISORY.
2. Merge the seven stage ledgers into one provision ledger. Every provision in `reference/` appears exactly once.
3. Write the summary counts from the ledger, not from memory.
4. Write the scope and limits section. It is the last thing written and the first thing a reader should trust.
5. Build the client summary from the template. Passes first.
6. Run `../../verify-citations.sh`. If it fails, the report is wrong, not the script.

## Outputs

| Artifact | Location | Format |
|---|---|---|
| Findings ledger | `output/<run>/audit-<site>-<date>.md` | The full report |
| Client summary | `output/<run>/summary-<site>-<date>.md` | One page, plain English |

## Audit

Run before writing to `output/`. If a check fails, revise first.

| Check | Pass Condition |
|---|---|
| Every provision appears exactly once | Count the ledger rows against reference/README.md |
| The summary contains no recommendation absent from the ledger | Check every bold line in the summary against a finding ID |
| verify-citations.sh exits 0 | Run it. Do not assume it |
