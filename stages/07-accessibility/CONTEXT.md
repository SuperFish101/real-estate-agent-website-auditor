# Stage 07: Does the page meet WCAG 2.1 Level AA

Standard this stage enforces: ``reference/wcag/``

## Inputs

| Source | File/Location | Section/Scope | Why |
|---|---|---|---|
| Method | `../../method/wcag-static-checkability.md` | Full file | Which of the 50 criteria are reachable, from source and with a browser. Read this FIRST |
| Prior stage | `output/<run>/03b-render.md` | Browser mode only, if stage 03 wrote it | The measured numbers behind every browser verdict |
| Method | `../../method/browser-mode.md` | Only when `03b-render.md` exists | How to read those numbers against the criterion |
| Standard | `../../reference/wcag/CONTEXT.md` | The router only | Tells you which of the five principle files to open |
| Standard | `../../reference/wcag/<principle>.md` | Only the criteria you are actually judging | Do not load all five principle files |
| Standard | `../../reference/wcag/conformance.md` | Full file, 31 lines | The consequence an ACCESS finding carries |

## Process

1. Open the method table. **`03b-render.md` should exist, because stage 03 runs the browser on every audit.** If it is missing, check that stage 03 recorded why before you go any further: an audit that quietly skipped the browser is a defect, not a source-only run. Read the column that matches: BROWSER when the file is there, SOURCE only when the tools were absent. That is 34 criteria reachable and 16 not, or 20 and 30 without.
2. For each one you cannot judge, write the ledger row now: REQUIRES BROWSER or REQUIRES HUMAN, with the tool or the person that would settle it. Do this before the judging, so the gaps cannot be quietly forgotten at the end.
3. For each one you can, open only the principle file it lives in and judge it against the artifact. A browser criterion is judged against the recorded number in `03b-render.md` and the finding quotes that number. No number, no verdict: the row stays REQUIRES BROWSER and never becomes a PASS.
4. On a STATIC-PARTIAL criterion, judge only the mechanical half and mark the judgement half REQUIRES HUMAN in the same row. An `alt` attribute either exists or does not; whether it is equivalent is not yours to say.
5. Every criterion gets a row. All 50.

## Outputs

| Artifact | Location | Format |
|---|---|---|
| Accessibility findings | `output/<run>/08-accessibility.md` | Findings plus a 50 row ledger |

## Audit

Run before writing to `output/`. If a check fails, revise first.

| Check | Pass Condition |
|---|---|
| All 50 criteria have a row | Count them. 50, not 20 and not 33 |
| No FAIL against a criterion this run could not reach | The evidence bar in rules.md section 6 forbids it. Without a browser that includes contrast, keyboard and focus |
| Every browser verdict quotes its number | The reader can open `03b-render.md` and find it |
| The gap is stated in words | The output says how many were not tested, and which. Without a browser it names contrast, keyboard and focus specifically |
