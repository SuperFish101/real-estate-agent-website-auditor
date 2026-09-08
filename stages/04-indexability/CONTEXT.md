# Stage 04: Can this page be indexed at all

Standard this stage enforces: ``reference/google/technical-requirements.md``

## Inputs

| Source | File/Location | Section/Scope | Why |
|---|---|---|---|
| Standard | `../../reference/google/technical-requirements.md` | Full file, 82 lines | The three technical requirements and their consequence |
| Prior stage | `output/<run>/03-inventory.md` | The robots meta and page list | Where to look |

| Standard | `../../reference/ietf/rfc-6797-hsts.md` | Full file | Whether the lead forms are served over a connection a browser must keep secure |

## Process

1. Check each page for `<meta name="robots">` containing `noindex`. Cite `GSE-TR-1`.
2. Check for login walls or content behind a script gate. Cite `GSE-TR-1`.
3. If a real HTTP status was captured when the page was saved, judge `GSE-TR-2`. If not, it is INSUFFICIENT EVIDENCE. Never assume 200.
4. Confirm the page carries indexable text in a supported file type. Cite `GSE-TR-3`.

6. **HSTS.** Check for a `Strict-Transport-Security` response header. **A saved HTML file carries no response headers**, so unless the capture recorded them this is INSUFFICIENT EVIDENCE and the finding names the `curl -I` that settles it. `HSTS-6.1.1` makes `max-age` required, so a header without it is malformed. `HSTS-6.1.2` is optional and its absence is never a failure. The standard sets no minimum `max-age`: report the value and stop.

## Outputs

| Artifact | Location | Format |
|---|---|---|
| Indexability findings | `output/<run>/04-indexability.md` | Findings plus a five row ledger |

## Audit

Run before writing to `output/`. If a check fails, revise first.

| Check | Pass Condition |
|---|---|
| Severity is BLOCKING | Every FAIL here quotes the publisher's consequence: the page is not eligible to be indexed |
