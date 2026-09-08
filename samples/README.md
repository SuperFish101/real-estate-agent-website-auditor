# samples/: what to run the auditor against

Three folders. One is a real California agent's website with the identity removed. Two are
controlled test fixtures. The difference matters and is stated on each.

| Folder | What it is | Why it exists |
|---|---|---|
| `live-agent-ca/` | **A real California real estate agent's website**, captured with `curl` on 2026-09-05. HTTP 200, 723 lines of real HTML, its own robots.txt, sitemap index and stylesheet. Identity removed per `method/anonymising-a-run.md` | Proof the auditor works on the actual web, in its actual domain, and not only on things built to be caught |
| `live-agent-ca-2/` | **A second real California agent's website**, captured 2026-09-06. HTTP 200, 976 lines, robots.txt, two sitemap files and its stylesheet. WordPress and Elementor. Identity removed | The structured data case. Two of its three JSON-LD blocks do not parse, and it has no privacy policy at all. It is also the run where the auditor **declined** to issue a keyword stuffing finding it could easily have issued |
| `live-team-ca/` | **A real California two-agent team's website**, captured 2026-09-06. HTTP 200, 9,014 lines, robots.txt and a sitemap index. A hosted agent platform. Identity removed | The two-licensee case, which nothing else in this folder exercises. `CA-2773(a)-EACH` counts names against licence numbers, and this is the only artifact with more than one of each. It is also the first run where a page **passes** the texting consent checks rather than failing them |
| `fail-case/` | A fictional agent site, hand-built with a known defect against every severity band | A known-answer test. You cannot tell whether an auditor catches things unless you already know what is there to catch |
| `pass-case/` | The same fictional site with every defect fixed | The harder test. An auditor that finds problems in a clean artifact is broken, and only a fixture you control can prove it does not |

Every run of all three is committed in `output/`.

**For browser mode, bring the CSS down too.** A page saved with `curl` alone renders unstyled,
and every colour and layout measurement taken off an unstyled page is worthless. Save each
`<link rel="stylesheet">` target beside the HTML, keeping the same relative path, or use the
browser's own Save Page As with "Web Page, Complete".

## On the fictional two

**They are the same fictional site twice, and that is the whole point.** `fail-case/` has a
defect seeded against every severity band. `pass-case/` is that identical site with each defect
repaired and nothing else touched. Same licensee, same licence number, same markup. An auditor
is only tested by an artifact whose right answer you already know, and the harder half of the
test is the clean one: **an auditor that finds problems in repaired markup is broken**, and you
cannot show that unless the repaired file is the same file. Giving them two different names
would read tidier and would destroy the control.

Neither was copied from a real website. Both are hand-built HTML. The real-website test is
`live-agent-ca/`.

They are fictional on purpose, and the reason is not convenience.

The `fail-case` seeds a **criminal-liability finding** under California law, a self-serving
star rating, and a footer that looks exactly like keyword stuffing. Publishing that set of
accusations against a real, named business that did not ask to be audited would be
indefensible, whatever the findings were. "Marisol Vega" does not exist, and both fixtures say
so in their own `NOTES.md`.

What is **not** fictional in them: the HTML is realistic WordPress-shaped markup, the defects
are the ones that actually occur on agent sites, and every finding against them cites a real
provision in a real published standard that you can open and check.

## On the real three

`live-agent-ca/`, `live-agent-ca-2/` and `live-team-ca/` are real California DRE licensees'
websites, each captured live at HTTP 200. All three are in the auditor's actual domain: working
agents, real licence numbers on the page, real lead forms, real listing photography.

They were chosen to be different from each other on purpose. One is a single agent on a hosted
platform, one is a single agent on WordPress with Elementor, and one is a two-person team on a
different hosted platform. Between them they exercise the provisions that a single fixture
cannot: `CA-2773(a)-EACH` needs more than one licensee, the structured data stage needs markup
that is actually broken rather than merely absent, and the texting consent stage needs at least
one page that gets it right.

**The owner did not ask to be audited and does not know this run exists**, so the identity is
gone. The domain, the licensee's name, both brokerage names, both licence numbers, the phone,
the email and the social handles are all placeholders of the same shape. The markup, the line
numbers and every defect are exactly as found. The method is
[`../method/anonymising-a-run.md`](../method/anonymising-a-run.md), and
each run's own `NOTES.md` lists every replacement made in that particular capture.

**The two runs captured on 2026-09-06 go past that method in two places, and say so.** They also
replace the city name and the achievement statistics. The method keeps the city, on the reasoning
that a city with hundreds of licensees does not point at a person. Both of those sites sit in a
small California city, and the method's own check 4 search test failed: a search engine returned
the real site for sentences that had already had every name taken out. The state, which is the
only fact the audit needs, is untouched in all three runs.

**The redaction is deliberate**, and it is the same reasoning that makes the other two
fictional: publishing a named criminal-liability finding against a business that never asked
for one would be wrong whether or not the finding turns out to be correct.

## Running it on your own site

```
mkdir -p your-site
curl -sSL https://example.com/ -o your-site/index.html
curl -sSL https://example.com/robots.txt -o your-site/robots.txt
cp templates/manifest.md your-site/manifest.md    # then fill it in
```

Record the HTTP status your `curl` returned. Without it, `GSE-TR-2` is INSUFFICIENT EVIDENCE
rather than a pass, because a saved file carries no status code.
