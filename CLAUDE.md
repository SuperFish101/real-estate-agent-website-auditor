# The Real Estate Agent Website Auditor

Audits a real estate agent's website against published rules and reports every provision it
passes and every one it fails, each located to a file and a line.

## Folder Map

```
CLAUDE.md     you are here (Layer 0)      reference/    the standards, verbatim (Layer 3)
CONTEXT.md    task routing (Layer 1)      method/       our own lookups, NOT standards
README.md     for humans, not for you     templates/    blanks to copy
identity.md   who you are, what you refuse samples/    three live sites, two fixtures
rules.md      the contract                 output/       per-run artifacts (Layer 4)
examples.md   worked findings              stages/       one contract per pass (Layer 2)
```

## Triggers

| Keyword | Action |
|---|---|
| `audit <folder>` | Work `CONTEXT.md` stages 01 to 14 against that folder. **This includes browser mode.** Stage 03 renders the page unless the Playwright tools are absent |
| `audit <folder> no browser` | The same, deliberately without the browser. The run header must say the gap was chosen |
| `status` | List `output/*/` and say which stages each run completed |
| `verify` | Run `./verify-citations.sh`, report the seven checks |
| `freshness` | Run `./check-standards-freshness.sh`, report any standard that moved |

## Routing

| Task | Go to |
|---|---|
| Run a full audit | `CONTEXT.md` |
| Judge one thing | the one stage in `stages/` that owns that standard |
| Write a finding | `method/finding-format.md` |
| Decide if a finding is honest | `rules.md` section 6, then `examples.md` Example 3 |
| Prepare a folder to audit | `templates/manifest.md` |

## What to Load

The context window is working memory, not storage. No agent reads this whole folder.

| Task | Load | Do NOT load |
|---|---|---|
| Full audit | `identity.md`, `rules.md`, one stage contract at a time | Any standard until its stage says so. `README.md` ever, it is for humans |
| One accessibility criterion | `method/wcag-static-checkability.md`, then the one file its principle lives in | The other four WCAG files |
| Anything with a browser open | `method/browser-mode.md`, and `output/<run>/03b-render.md` if it exists | The standards. The browser measures, the stage judges |
| One structured data check | the two `reference/google/*structured-data*` files | `wcag/`, `california/`, `ietf/` |
| A spam judgement | `reference/google/spam-policies.md`, `rules.md` section 6, `examples.md` Example 3 | Everything else |
| Assemble the report | the stage outputs, `method/finding-format.md`, `templates/client-summary.md` | `reference/`, already consumed |

## Handoffs

Stages write to `output/<run>/NN-<stage>.md`. Stage 14 reads them all and assembles the two
reports. Edit a stage output and stage 14 picks up your edit. In browser mode stage 03 also
writes `03b-render.md`, which stages 07 and 09 read and nothing else does.

## The rule that outranks the rest

Every finding cites exactly one provision, by ID, from one file in `reference/`. No provision,
no finding. You have an opinion, and opinions are deleted, not reported.
