# Stage 12: Privacy notice and form consent

Standard this stage enforces: `reference/state/ca/bpc-22575-caloppa.md`, `reference/fcc/47-cfr-64-1200-consent.md`

## Inputs

| Source | File/Location | Section/Scope | Why |
|---|---|---|---|
| Standard | `../../reference/state/ca/bpc-22575-caloppa.md` | Full file | The privacy policy posting obligation and its 30 day qualifier |
| Standard | `../../reference/fcc/47-cfr-64-1200-consent.md` | Full file | What consent text a phone capture form needs |
| Prior stage | `output/<run>/03-inventory.md` | Every form and every form field | The trigger for both standards |

## Process

1. If there is no form capturing personal information, both standards are NOT APPLICABLE. Say which fact settled it and stop.
2. Find a privacy policy link. Check the link text, and whether the target resolves. Absence is a finding under `CALOPPA-22575(a)-POSTED`.
3. **Word the CalOPPA finding exactly as the statute does.** A missing policy is not yet a violation: the statute says an operator is in violation "only if the operator fails to post its policy within 30 days after being notified of noncompliance." Report the condition, not a crime.
4. If a form captures a telephone number, test the consent text against all four parts of `TCPA-64.1200(f)(9)`. The one almost always missing is (i)(B), the sentence saying consent is not a condition of purchase.
5. A pre-ticked checkbox is not a signature. Report it.
6. Every TCPA finding names the assumption it rests on: that the agent sends autodialed or prerecorded marketing. You cannot see that from the site, so you ask.

## Outputs

| Artifact | Location | Format |
|---|---|---|
| Privacy and consent findings | `output/<run>/13-privacy-and-consent.md` | Findings plus a nine row ledger |

## Audit

Run before writing to `output/`. If a check fails, revise first.

| Check | Pass Condition |
|---|---|
| The CalOPPA 30 day qualifier appears in every CalOPPA finding | Without it the finding overstates the law |
| Every TCPA finding names its assumption | The auditor cannot see whether an autodialer is used |
