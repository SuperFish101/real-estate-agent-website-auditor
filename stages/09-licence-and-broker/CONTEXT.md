# Stage 09: Is the licence number and broker on the page

Standard this stage enforces: `reference/state/ca/10-ccr-2773.md`

## Inputs

| Source | File/Location | Section/Scope | Why |
|---|---|---|---|
| Standard | `../../reference/state/ca/10-ccr-2773.md` | Full file, and the provision index | The obligation and its scope |
| Artifact | `NOTES.md` in the folder under audit | Jurisdiction and whether the site is the licensee's own | Whether the regulation applies at all |
| Prior stage | `output/<run>/03-inventory.md` | The full visible page text | Where to search |
| Prior stage | `output/<run>/03b-render.md` | Browser mode only. The type size table | The only way to reach `CA-2773(a)-TYPESIZE` |

## Process

1. Establish scope first. `CA-2773(a)(3)` reaches websites "owned, controlled, and/or maintained by the soliciting real estate licensee". If the site is not a California licensee's own site, the whole stage is NOT APPLICABLE and you say which fact settled it.
2. Search the visible text for an eight digit number presented as a licence number. Not seven, not nine. Report the string and its line.
3. Search for a brokerage name. Whether it matches the current DRE record is REQUIRES HUMAN, settled at `www2.dre.ca.gov`. Say so and give the URL.
4. Count named licensees against licence numbers. More names than numbers is a finding under `CA-2773(a)-EACH`.
5. Type size. With browser mode on, take the two numbers from `output/<run>/03b-render.md`, measured by the routine in `../../method/browser-mode.md`: the computed font size of the element holding the licence number, and the smallest computed font size of any visible text on the page. Smaller is a FAIL on `CA-2773(a)-TYPESIZE`, and the finding quotes both pixel values. Equal or larger is a PASS, and it quotes them too. Without a browser this is REQUIRES BROWSER, never a pass.

## Outputs

| Artifact | Location | Format |
|---|---|---|
| Licensing findings | `output/<run>/10-licence-and-broker.md` | Findings plus a six row ledger |

## Audit

Run before writing to `output/`. If a check fails, revise first.

| Check | Pass Condition |
|---|---|
| Scope is settled before any finding | A non-California site cannot fail this stage |
| The DRE lookup URL appears in every broker finding | So the reader can finish the check themselves |
