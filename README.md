# The Real Estate Agent Website Auditor

**A compliance auditor for a US real estate agent's website.** Point it at an agent's website
and it reports every provision that site passes and every one it fails, each located to a file
and a line and each citing a published rule you can open and read.

It is a folder of instructions and vendored standards, not a program — model- and
vendor-agnostic, driven by `AGENTS.md`/`CLAUDE.md`. Attach it to a plain Claude project and it
audits from source, reaching 20 of the 50 WCAG criteria with zero setup. Attach it to a
tool-capable agent (Claude Code, Codex, Cursor, Hermes) and it also saves the page itself,
renders it in a browser to reach 34 of 50, and writes the reports to disk. Same findings, same
citations either way. Full detail in [Requirements](#requirements) and [`SETUP.md`](SETUP.md).

It is not an SEO tool and it will not tell you how to rank. It answers questions that have
published, citable answers:

| Question | Whose rules decide it |
|---|---|
| **Can search engines index this page at all?** | Google Search technical requirements, RFC 9309 |
| **Can ChatGPT, Claude and Perplexity read it?** | Each company's published crawler documentation |
| **Is the markup honest and complete?** | Google's structured data guidelines and `LocalBusiness` property tables |
| **Can a disabled person use it?** | WCAG 2.1, Levels A and AA, all 50 criteria |
| **Is the licence number and broker on the page?** | 10 CCR 2773, which names websites explicitly |
| **Are AI-altered listing photos disclosed?** | Cal. B&P Code section 10140.8, in force since 1 January 2026 |
| **Does the wording risk a fair housing complaint?** | 24 CFR 100.75 |
| **Is there a privacy policy, and does the form have consent text?** | CalOPPA B&P 22575, and 47 CFR 64.1200(f)(9) |
| **Do the links work, and are the paid ones declared?** | Google's outbound link guidance, and the Bing Webmaster Guidelines |

The AB 723 one is what nothing else checks. AB 723 made undisclosed AI-staged listing photos a
criminal matter for the licensee this year, and it binds "any person acting on their behalf",
which means the agent's web developer and marketer too.

The auditor installs nothing and needs no API key: it is markdown, and its standards are
vendored in `reference/`. The only network access a run needs is fetching the page under
audit; nothing in this folder phones home.

---

## Where everything is

The five files that define the auditor, in the order they matter:

| File | What it is |
|---|---|
| **`identity.md`** | Who the auditor is, which standards it enforces, and what it refuses to do |
| **`rules.md`** | How it audits: the order, how it cites, how it grades severity, and the evidence bar |
| **`examples.md`** | Three worked examples: a finding, a pass, and a verdict it deliberately refused to issue |
| **`reference/`** | **The standards themselves, verbatim.** 18 published standards, vendored across 22 files (WCAG is split by principle), each with a provenance table naming the publisher, source URL and retrieval date |
| **`README.md`** | This file |

Everything else is supporting work you can ignore on a first read: `stages/` holds one contract
per pass, `method/` holds the auditor's own lookups, `samples/` holds the artifacts the findings
point at, and `output/` holds five complete audits already run and committed.

**If you only open one thing, open `reference/`.** That is where an auditor is separated from an
opinion generator.

---

## Requirements

This is a folder of instructions, not an installable program. It is model- and vendor-agnostic:
an `AGENTS.md` and a `CLAUDE.md` at the root point any compliant agent at the same pipeline. It
runs at two levels depending on what the host can do.

**If you drop it into a Claude workspace project (no setup), you can:**

- Save the agent's page yourself (three `curl` lines, or the browser's "Save Page As"), attach it with the folder, and get a real audit back in the reply.
- Run **11 of the 14 stages in full** — indexability, crawler access (Google, Bing, ChatGPT, Claude, Perplexity), structured data, spam, licence-and-broker *presence*, AB 723 listing-image disclosure, fair housing, privacy and consent, and internal-link integrity.
- Get **all of California law** (its pack is vendored) and **20 of the 50 WCAG accessibility criteria** — every check a static file can prove.
- Read every finding with its citation into `reference/`, so a judge can open the provision and check it.

**If you wire up the tools (a few minutes — see [`SETUP.md`](SETUP.md)), you also get:**

- **Auto-fetch:** it saves the page and stylesheet for you instead of you doing it by hand.
- **Accessibility 20 → 34 of 50:** the browser measures contrast, keyboard operability, focus visibility and reflow — things a saved file physically cannot show.
- **The licence type-size check:** not just that the licence number is present, but that it is legible rather than hidden in tiny type.
- **Live freshness re-checks:** stage 01 re-fetches each standard to confirm the rule hasn't changed since it was vendored.
- **Other states on demand:** it researches and builds a non-California state's pack.
- **Outbound-link reachability:** it actually follows external links and records redirect chains.
- **Reports on disk:** the findings ledger and client summary written to `output/<run>/` to re-open months later, instead of living only in the reply.

Either way the findings and their citations are identical — the tools change what the audit can
*reach and record*, never what it decides. The full breakdown is in the table below.

### Stage by stage: what runs where

The 20/50-vs-34/50 split is **only stage 07, accessibility.** Everything else runs in full from
source. This table is the whole truth, pass by pass.

| # | Stage | In a plain Claude project (source only) | What the tools add |
|---|---|---|---|
| 01 | freshness | Trusts the vendored standards and their retrieval dates in `reference/` | **Shell:** re-fetches each standard and confirms it hasn't changed since it was vendored |
| 02 | jurisdiction | **California runs in full** (its pack is vendored). Asks which state applies | **Shell/web:** researches and builds a *new* state's pack when it isn't California |
| 03 | inventory | Full: lists everything in the markup | **Browser:** also records the rendered measurements that stages 07 and 09 read |
| 04 | indexability | **Full.** Robots meta, canonicals, HTTP directives — all from source | — |
| 05 | crawler-access | **Full.** robots.txt for Google, Bing, ChatGPT, Claude, Perplexity | — |
| 06 | structured-data | **Full.** Parses the JSON-LD and checks it against `LocalBusiness` | — |
| 07 | accessibility | **20 of 50 WCAG criteria** — everything a static file can prove | **Browser:** contrast, keyboard, focus, reflow → **34 of 50** |
| 08 | spam-check | **Full** from source (rarely fires by design; turns on intent) | — |
| 09 | licence-and-broker | Checks the licence number and broker name **are present** on the page | **Browser:** the one thing source can't — whether the type is too small |
| 10 | listing-images (AB 723) | **Full.** Reads `manifest.md`; no manifest = insufficient evidence | — |
| 11 | fair-housing | **Full.** Flags wording against 24 CFR 100.75, hands to a person | — |
| 12 | privacy-and-consent | **Full.** Privacy policy present, lead-form consent text | — |
| 13 | link-integrity | Internal links and `#anchors` checked in full | **Browser:** outbound link reachability and redirect chains |
| 14 | report | Assembles both reports **into the reply** | **Write:** commits them to `output/<run>/` to re-open later |

So a plain Claude project runs **eleven of the fourteen stages in full**, plus California law,
plus 20 of 50 accessibility criteria — every legal, indexing, crawler, structured-data,
fair-housing, privacy and AB 723 check. The tools add: auto-fetching the page, live freshness
re-checks, non-California state packs, the 14 rendered accessibility criteria, the licence
type-size check, outbound-link reachability, and reports written to disk.

---

## Start here: how you actually run one

You need a real estate agent's website and a tool-capable agent with this folder attached
(see [Requirements](#requirements)). Nothing is installed into the folder.

**The short version.** Give it the website URL and say:

```
Audit this real estate agent's website: https://www.example-realty.com/
```

The agent saves the page and its stylesheet into a folder, then works the fourteen stages against
that folder. **The audit is always run against a saved copy, never against a live URL**, and
that is deliberate: every finding in this tool cites a file and a line number, and a live web
page has no line numbers. The saved copy is the thing the citations point at, so anyone can
open the same file and check the same line months later.

**If you would rather save it yourself**, do that and point at the folder instead:

```
mkdir -p smith-realty
curl -sSL https://www.example-realty.com/ -o smith-realty/index.html
curl -sSL https://www.example-realty.com/robots.txt -o smith-realty/robots.txt
cp templates/manifest.md smith-realty/manifest.md      # then fill it in
```

```
audit smith-realty/
```

**What happens next, in order.**

1. It checks its own rulebooks are still current before reading a word of the site.
2. **It asks which state the agent is licensed in.** California is wired. Any other state, it
   offers to research and build that state's pack first, or to skip state law entirely and run
   only the checks that apply to an agent anywhere.
3. It works the stages and writes the two reports into `output/`.

**A browser is part of the run, and you do not have to ask for it.** Stage 03 renders the page
and measures what a saved file cannot show you: colour contrast, whether the keyboard reaches
everything, whether focus is visible, whether the page reflows at 320 pixels, and whether the
licence number is set in type smaller than anything else on the page. That takes WCAG coverage
from 20 of the 50 criteria to 34.

It uses the browser tools (Playwright MCP or equivalent) in whatever agent you are running.
**If they are not there, the audit still runs**, says so in its header, and leaves those rows
as honest gaps rather than quiet passes. If you want the source-only run deliberately, say
`audit smith-realty/ no browser`.

**What it wants to be pointed at.** The public website of a US real estate agent, team or
brokerage: the home page, or the About page, or whichever page carries their licence number
and their broker's name. Not an MLS listing portal, not Zillow, not a page behind a login.

## Who this is for

- **A real estate agent or brokerage** who wants to know where their site stands before
  somebody else tells them.
- **Anyone who builds or markets those sites.** AB 723 puts you inside the statute alongside
  your client.
- **Anyone auditing a small business website**, minus the California section. Stage 02 will
  offer to skip state law entirely, and the audit then runs every check that applies to any
  business anywhere.

## The one rule everything else follows

**Every finding cites exactly one provision, by ID, from one file in `reference/`.**

If it cannot name the provision, it is not a finding. It is an opinion, and opinions are
deleted rather than reported. That single rule is what makes this an audit instead of a
critique, and `reference/` holds the actual standards, verbatim, so you can check any finding
against the rule it claims.

---

## 60 seconds

```
git clone <this repo>
cd real-estate-agent-website-auditor
./verify-citations.sh        # seven checks, no dependencies. Proves the citations are real
```

Then, in a tool-capable agent with this folder attached (see [Requirements](#requirements)):

```
audit samples/live-agent-ca/
```

A finding looks like this, and every one of the roughly 80 provisions also gets a pass, fail
or honest-gap row in the ledger:

```
F-001   LEGAL
Provision : TCPA-64.1200(f)(9)-AGREEMENT
            (reference/fcc/47-cfr-64-1200-consent.md:50)
Provision text
  "An agreement in writing, bearing a signature, that clearly authorizes the seller"
Location  : samples/live-agent-ca/index.html:451 (home valuation form)
            samples/live-agent-ca/index.html:617 (contact form)
Observed  : Both forms capture a telephone number in an <input type="tel">.
            Neither form contains any consent text, any checkbox, or any
            reference to calls or texts.
Verdict   : FAIL
Why       : Whether this licensee autodials is REQUIRES HUMAN and is not
            assumed. What the artifact establishes is that if they do, the
            written consent this section requires is not being obtained at
            the point of capture.
```

Open `reference/fcc/47-cfr-64-1200-consent.md`, go to line 50, and check the quote
matches. That is the whole idea, and it works for every finding in every run.

---

---

## What it actually checks, stage by stage

Fourteen passes. Each one owns a single rulebook and loads only that rulebook.

| # | Stage | What it does | For |
|---|---|---|---|
| 01 | freshness | Checks every rule in `reference/` is still the current rule. Re-fetches any that changed, then carries on. Two of them went stale while this was being built. | gate |
| 02 | jurisdiction | Asks which state the agent is licensed in, and loads only that state's law. Builds the pack first if that state is not wired yet. | gate |
| 03 | inventory | Writes down everything on the page. Judges nothing. In browser mode it also renders the page and records the measurements. | groundwork |
| 04 | indexability | Can search engines see this page at all, or is it accidentally hidden? | SEO |
| 05 | crawler-access | Can Google, Bing, **ChatGPT, Claude and Perplexity** each read it? Blocking the wrong bot quietly deletes an agent from AI answers. | AI search |
| 06 | structured-data | Does the page tell machines who this agent is, in the language they read? This is how you become a named entity instead of a blue link. | SEO + AI search |
| 07 | accessibility | Can a person using a screen reader or a keyboard actually use it? 20 of the 50 criteria from source, 34 with a browser. | legal |
| 08 | spam-check | Is anything here a trick Google punishes, like a footer stuffed with 47 city names? | SEO |
| 09 | licence-and-broker | Is the agent's licence number and their broker's name actually on the page, in big enough type? The type size check needs a browser. | legal |
| 10 | listing-images | Are AI-edited or virtually staged photos disclosed the way the state's law demands? | legal |
| 11 | fair-housing | Flags any wording that touches a protected class, says exactly which rule triggered the flag, and hands it to a person. Never calls anything discrimination. | legal |
| 12 | privacy-and-consent | Is a privacy policy posted, and does the lead form carry the consent text texting requires? | legal |
| 13 | link-integrity | Do the internal links and page anchors actually go anywhere, and are paid links declared the way Google asks? | SEO |
| 14 | report | Turns all of it into the two reports. | output |

**There is no score.** Every check is pass, fail, or an honest gap, each with the rule it
came from and what to change. A number out of 100 is an opinion wearing a number, and this
tool does not have opinions.


### One state at a time, on purpose

Most of what this checks is federal or universal and applies to an agent anywhere in the US.
Three things are state law: whether the licence number and broker must appear on the site,
whether AI-altered listing photos must be disclosed, and whether a privacy policy must be
posted.

**California is wired up.** Ask for any other state and stage 02 researches and builds that
state's pack first, using the fixed recipe in `reference/state/_TEMPLATE.md`, shows you what
it found, then runs the audit.

Fifty states are deliberately not pre-wired. An agent needs one, maybe two. Forty-eight
folders nobody opens would each quietly go stale, and citing a rule that changed two years
ago is the exact failure this tool exists to prevent.

**A Texas audit contains no California rules.** Not even as NOT APPLICABLE lines. Only the
loaded state appears.

---

## What to feed it

A folder. Nothing is required except one HTML file.

```
your-site/
  index.html          the page, saved from the browser or fetched with curl
  robots.txt          optional
  sitemap.xml         optional
  style.css           optional, used only for colour checks
  manifest.md         optional, how each image was made. Required for the AB 723 pass
  NOTES.md            optional, jurisdiction and anything else the auditor should know
```

`templates/manifest.md` is the blank, with instructions on wording it so the California
classification is decidable. `samples/README.md` shows how to capture a live site with `curl`
in three lines.

## What it gives back

1. **A findings ledger** for whoever does the work. Every failure with its location and
   citation, then **every provision listed with its verdict**, including the passes and the
   ones that did not apply. Long on purpose. An audit that lists only problems is a complaint.
2. **A client summary** for the site owner, who is not technical. Leads with what passed.
   Built from `templates/client-summary.md`. It may not contain a single recommendation that
   is not already a finding in the ledger.

---

## What it cannot do

Read this part. It is the difference between an auditor and a marketing tool.

- **Without a browser it sees only source.** Of WCAG 2.1's 50 Level A and AA criteria, **20
  need a rendered page and 10 need a person, so only 20 are reachable from the file alone.**
  Colour contrast, keyboard operability and focus visibility are all in that untested set.
  Browser mode reaches 14 of the 20, taking coverage to 34 of 50, and
  `method/wcag-static-checkability.md` lists which is which, criterion by criterion. Sixteen
  are out of reach whatever you do, because captions, flashing and whether alt text is
  *equivalent* need a person. **A clean accessibility result here does not mean a site is
  accessible**, and every run says so in its own words.
- **It does not predict rankings, and refuses to.** Nothing in `reference/` says what ranks.
- **It gives no keyword advice.** Density and keyword research are in no standard here.
- **It almost never issues a spam finding.** Every Google spam policy turns on intent, and
  intent is not in a file. Where an artifact matches Google's own example but intent cannot be
  established, the verdict is INSUFFICIENT EVIDENCE with a note on what would settle it.
- **It cannot see images.** The AB 723 pass reads `manifest.md` and nothing else. No manifest
  means INSUFFICIENT EVIDENCE, not a pass.
- **It covers `LocalBusiness` and no other rich result type.** Breadcrumb, FAQ and Article
  markup are reported NOT COVERED.
- **It is not legal advice** and nobody who built it is a lawyer. It reproduces a statute and
  reports whether an artifact matches its text.

---

## The standards, and where they live

All of them are in `reference/`, reproduced in full or near-full, each with a provenance table
naming publisher, source URL, version, retrieval date and licence. `reference/README.md` is
the registry and says exactly what was left out of the three partial files and why.

| Standard | Publisher | Licence |
|---|---|---|
| Google Search technical requirements | Google | CC BY 4.0 |
| Spam policies for Google web search | Google | CC BY 4.0 |
| General structured data guidelines | Google | CC BY 4.0 |
| `LocalBusiness` structured data | Google | CC BY 4.0 |
| WCAG 2.1 Levels A and AA, all 50 criteria | W3C | W3C Document Licence |
| Cal. B&P Code section 10140.8 (AB 723), complete | California Legislative Counsel | public record |
| 10 CCR 2773, licence identification in advertising | California Office of Administrative Law | public record |
| Cal. B&P Code section 22575, CalOPPA | California Legislative Counsel | public record |
| 24 CFR 100.75, discriminatory advertising | US Dept of Housing and Urban Development | public record |
| 47 CFR 64.1200(f)(9), prior express written consent | US Federal Communications Commission | public record |
| Qualify your outbound links to Google | Google | CC BY 4.0 |
| Bing Webmaster Guidelines | Microsoft | Microsoft documentation |
| OpenAI, Anthropic and Perplexity crawler docs | Each company | Their own documentation |
| Sitemaps XML protocol 0.9 | sitemaps.org | CC Attribution-ShareAlike |
| IndexNow protocol | IndexNow | Published documentation |
| **24 CFR 109.20, withdrawn 1996.** Flags only, never a finding | HUD | public record |
| RFC 9309, Robots Exclusion Protocol | IETF | BCP 78 |
| RFC 6797, HTTP Strict Transport Security | IETF | BCP 78 |

## Severity, and where it comes from

Summarised here. **`rules.md` section 4 is the definition** and the only place to change it.
No band is a judgement call; each quotes the publisher's own stated consequence.

| Severity | Trigger | The publisher's stated consequence |
|---|---|---|
| LEGAL | AB 723 obligation unmet | The bill's own digest: requirements "the violation of which is a crime" |
| BLOCKING | Technical requirement or spam policy | Not eligible to be indexed. "may rank lower in results or not appear in results at all" |
| ACCESS | Any Level A or AA criterion unsatisfied | WCAG 5.2.1: Level AA requires a page "satisfies all the Level A and Level AA success criteria" |
| ELIGIBILITY | Structured data guideline or missing required property | "Items that are missing required properties are not eligible for rich results" |
| ADVISORY | A recommended property or best practice | The publisher's own word is "recommended" |

---

## Five runs, already committed

You can read the output before running anything.

| Run | Target | Result |
|---|---|---|
| `output/live-agent-ca-2026-09-05/` | **A real California agent's website**, captured at HTTP 200, identity removed | 3 LEGAL, 4 ACCESS, 1 ELIGIBILITY, 3 ADVISORY, and two queries it refused to turn into findings |
| `output/live-agent-ca-2-2026-09-06/` | **A second real California agent's website**, WordPress and Elementor, identity removed | 1 LEGAL, 2 ACCESS, 2 ELIGIBILITY. Two of its three JSON-LD blocks do not parse. It is also the run where the auditor declined to issue a keyword stuffing finding, and said why |
| `output/live-team-ca-2026-09-06/` | **A real California two-agent team's website**, identity removed | 4 LEGAL, 3 ACCESS. The two-licensee case for `CA-2773(a)-EACH`, which it passes, and the first run where a page passes the texting consent checks. Six contrast readings were measured below threshold and **withdrawn**, because every one was inside a modal that is closed on load |
| `output/fail-case-2026-09-07/` | A controlled fixture with seeded defects | 27 findings across all five bands, plus a 141-provision ledger. It is also the run where browser mode **hit its own guard**: the fixture links a stylesheet that is not in the folder, so eight checks stayed REQUIRES BROWSER rather than quietly passing |
| `output/pass-case-2026-09-07/` | The same fixture, repaired | 0 findings, and a plain statement of why that is not the same as compliance. Fifty of its 141 rows are unanswered and the report leads with that rather than the zero |

**Every run carries the findings ledger and a one-page client summary**, which is what
`rules.md` section 10 asks for: the ledger for whoever does the work, the summary for the site
owner, and not one recommendation in the summary that is not already a finding in the ledger.
The four runs that used a browser also carry `03b-render.md`, holding every number the browser
findings rest on, so a reader can take the same measurement.

`samples/README.md` explains why two of the five are fictional, and why the three real ones are
published with the identity removed. Both come down to the same thing: not publishing
criminal-liability accusations about a real named business that never asked to be audited.

## Judge protocol, six minutes

1. `./verify-citations.sh`. Seven checks: every provision ID cited anywhere exists in
   `reference/`; every `file.md:line` pointer lands on the line carrying that provision; every
   sample pointer exists; every reference file declares provenance; every internal link
   resolves; the files that load on every run are under their ICM size caps; and every stage
   path named in the docs points at a real folder in a gap-free `01..N` sequence. It caught
   seventeen bad pointers during this build, which is what it is for. **(60s)**
2. Open `reference/state/ca/bpc-10140-8-ab-723.md`. A complete state statute, not an
   excerpt. Compare to the leginfo URL in its provenance table. **(60s)**
3. Open `output/live-agent-ca-2026-09-05/` and take finding F-001. It cites
   `TCPA-64.1200(f)(9)-AGREEMENT` at `reference/fcc/47-cfr-64-1200-consent.md:50`. Check the
   provision there, then check the two lead forms at `samples/live-agent-ca/index.html:451`
   and `:617`. A real California agent's site, a real defect, a real citation. **(90s)**
4. In the same run, read `Q-001` and `Q-002`. They are two findings the auditor refused to
   issue, with the reasoning, on a site where issuing them would have been easy and would have
   made the report look more impressive. That is the test of whether this is an auditor or an
   opinion generator. **(60s)**
5. Attach the folder to a tool-capable agent (see [Requirements](#requirements)) and run
   `audit samples/pass-case/`. It should return
   no LEGAL, BLOCKING or ELIGIBILITY findings and a large block of honest gaps. An auditor that
   finds problems in a clean artifact is broken. **(90s)**

## How it is built

`CLAUDE.md` is the folder map, the trigger list and the what-to-load table. `CONTEXT.md` is
the task router. Fourteen stage contracts in `stages/` each own one standard and load only that
standard. If you want the architecture, start at `CLAUDE.md`; this file is for deciding
whether to use the thing at all.

## Licence

The auditor's own files are MIT. `reference/` is other people's work under their own licences,
listed above and in full in `LICENSE`. Not endorsed by Google, W3C or the IETF.
