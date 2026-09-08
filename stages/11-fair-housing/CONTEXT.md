# Stage 11: Does any wording favour or exclude a group

Standard this stage enforces: `reference/fair-housing/24-cfr-100-75.md`

## Inputs

| Source | File/Location | Section/Scope | Why |
|---|---|---|---|
| Standard | `../../reference/fair-housing/24-cfr-100-75.md` | Full file, and the limit section at the foot | The live rule, and why this stage never issues a FAIL. **Tier A** |
| Rescinded list | `../../reference/fair-housing/24-cfr-109-20-rescinded.md` | The word lists only | **Tier B.** Withdrawn from the CFR in 1996. Raises flags for a person, never a finding |
| Prior stage | `output/<run>/03-inventory.md` | All visible text, and every image alt attribute | Both words and pictures are inside the rule |

## Process

1. Read the limit section of the standard file before you read the artifact. This stage produces a located list for a person, never a verdict.
2. List every phrase that names or implies a protected class: race, colour, religion, sex, handicap, familial status, national origin. Include the line number and the surrounding sentence.
3. List every common proxy separately, marked as a proxy rather than a direct reference: school quality, 'safe' or 'crime', 'family friendly', 'ideal for', 'exclusive', religious landmarks used as selling points, and demographic descriptions of a neighbourhood.
4. `FHA-100.75(c)(1)` names "photographs, illustrations, symbols". List image alt text that describes people, and note that the images themselves were not seen.
5. **Tier B, the rescinded list.** Scan the same text against `24-cfr-109-20-rescinded.md` and raise a flag for each hit, in its own clearly headed section, separate from Tier A. **Every Tier B flag must state in the flag that the list was withdrawn from the CFR in 1996** and is raised for a person to read, not as a rule that was broken. A Tier B hit is never a finding, never a severity, and never evidence on its own: the section's own wording made context the test.
6. Give every item the verdict REQUIRES HUMAN. Never PASS, because an absent obvious phrase is not evidence of compliance. Never FAIL, because the rule turns on what a phrase indicates and that is a person's call.

## Outputs

| Artifact | Location | Format |
|---|---|---|
| Fair housing review list | `output/<run>/12-fair-housing.md` | A located list for a human, with no verdicts |

## Audit

Run before writing to `output/`. If a check fails, revise first.

| Check | Pass Condition |
|---|---|
| No FAIL and no PASS appears anywhere in the output | Only REQUIRES HUMAN. Check by grepping your own output |
| Every Tier B flag says the list is rescinded | Grep the output for `RESCINDED`. A Tier B flag without its status is a defect |
| No finding anywhere cites `FHA-109.20-RESCINDED-*` | A rescinded rule cannot be broken. It can only be pointed at |
| Every item has a line number and its sentence | A phrase without its context cannot be judged |
| The output says the images were not seen | Alt text is not the picture |
