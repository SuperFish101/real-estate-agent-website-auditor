# Stage 03: Inventory the artifact

Standard this stage enforces: `Nothing. This stage judges nothing.`

## Inputs

| Source | File/Location | Section/Scope | Why |
|---|---|---|---|
| Artifact | the folder under audit | Full file list | Everything the audit will cite must be listed here first |
| Contract | `../../rules.md` | Section 1, What you receive | Tells you which files are meaningful and which are optional |
| Method | `../../method/browser-mode.md` | Only when browser mode is on | The measurements to take and the rules for taking them |

## Process

1. List every file received, with its line count.
2. For each HTML page record: the `<html>` tag, `<title>`, every `<meta name="robots">`, every `<img>` with its line, every form control, every `<script type="application/ld+json">` block, every heading in document order, and every link.
3. Note whether `manifest.md` and `NOTES.md` are present. Their absence changes later stages.
4. Record what is NOT here: no robots.txt, no sitemap, no CSS. Each absence becomes an INSUFFICIENT EVIDENCE row later, not a silent gap.
5. **Browser mode. Run it. Do not wait to be asked.** Serve the folder over loopback with `python3 -m http.server`, open it in the browser, and take every measurement in `method/browser-mode.md`, in the order that file gives them. Confirm the stylesheets loaded before measuring any colour. Write the raw numbers to `03b-render.md`. Judge none of them. **The only reason to skip this step is that the Playwright tools are absent**, and then you say so in one line and the run header repeats it; stages 08 and 10 then keep their REQUIRES BROWSER rows.

## Outputs

| Artifact | Location | Format |
|---|---|---|
| Inventory | `output/<run>/03-inventory.md` | Lists and counts, no verdicts |
| Rendered measurements | `output/<run>/03b-render.md` | Browser mode only. Raw numbers with the selector each came from, no verdicts |

## Audit

Run before writing to `output/`. If a check fails, revise first.

| Check | Pass Condition |
|---|---|
| No verdict appears | The file contains no PASS, FAIL or severity word. This stage observes only |
| Browser mode ran, or the output says the tools were absent | There is no third option. A silent skip is a defect |
| Every browser number names its selector | A number nobody can reproduce is not evidence |
| Stylesheet loading is stated before any colour number | An unstyled render makes every colour measurement wrong |
