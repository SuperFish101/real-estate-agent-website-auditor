# Stage 08: Is anything here a spam policy violation

Standard this stage enforces: ``reference/google/spam-policies.md``

## Inputs

| Source | File/Location | Section/Scope | Why |
|---|---|---|---|
| Standard | `../../reference/google/spam-policies.md` | Full file, 372 lines | Every policy, and the examples that set the evidence bar |
| Contract | `../../rules.md` | Section 6, the evidence bar | The rule that makes this stage slow |
| Calibration | `../../examples.md` | Example 5 | A worked case of refusing to issue a finding that looks obvious |

## Process

1. Read the evidence bar before you read the artifact. Every spam policy turns on intent, and intent is not in a file.
2. Go policy by policy. For each, ask whether the artifact matches one of Google's own listed examples almost word for word.
3. A close match is not a FAIL. It is INSUFFICIENT EVIDENCE, plus a `What would settle it` line naming the fact a person could go and check.
4. Only issue a FAIL where the artifact matches a listed example and the intent is not in question.
5. Every policy gets a row, including the ones that cannot apply to a website at all.

## Outputs

| Artifact | Location | Format |
|---|---|---|
| Spam findings | `output/<run>/09-spam-check.md` | Findings, queries, and an 18 row ledger |

## Audit

Run before writing to `output/`. If a check fails, revise first.

| Check | Pass Condition |
|---|---|
| Every FAIL quotes both sides | The artifact text and Google's example text appear side by side in the finding |
| Every near miss says what would settle it | A query with no next step is not useful to anyone |
