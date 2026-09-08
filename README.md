# The Real Estate Agent Website Auditor

**A compliance auditor for a US real estate agent's website.** Attach this folder to an AI
agent that can read files, run a shell and drive a browser, point it at an agent's website,
and it reports every provision that site passes and every one it fails, each located to a file
and a line and each citing a published rule you can open and read.

It is a folder of instructions and standards, not a program. It runs inside a tool-capable AI
coding agent — Claude Code, Codex, Cursor, Hermes or any agent that reads this folder's
`AGENTS.md`/`CLAUDE.md` — and is model-agnostic. It does **not** run in a plain chat or a
knowledge-only "project" workspace, because those cannot save the page, write the reports, or
open the browser the render stage needs. See [Requirements](#requirements) and
[`SETUP.md`](SETUP.md).

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
| **`reference/`** | **The standards themselves, verbatim.** 18 published documents, each with a provenance table naming the publisher, source URL and retrieval date |
| **`README.md`** | This file |

Everything else is supporting work you can ignore on a first read: `stages/` holds one contract
per pass, `method/` holds the auditor's own lookups, `samples/` holds the artifacts the findings
point at, and `output/` holds five complete audits already run and committed.

**If you only open one thing, open `reference/`.** That is where an auditor is separated from an
opinion generator.

---

## Requirements

This is a folder of instructions, not an installable program. It runs inside a **tool-capable
AI agent** — one that can read the files in this folder and act on your machine. It is
model- and vendor-agnostic: an `AGENTS.md` and a `CLAUDE.md` at the root point any compliant
agent at the same pipeline. Known-good hosts include **Claude Code, OpenAI Codex, Cursor and
Hermes**; anything with the four capabilities below will work.

| Capability | Why the audit needs it | Without it |
|---|---|---|
| **Read files in this folder** | Load `identity.md`, `rules.md`, the stage contracts and `reference/` | The auditor cannot run at all |
| **Run a shell** | Save the page with `curl`, run `verify-citations.sh` and the freshness check | You must save the page by hand; the verify/freshness scripts don't run |
| **Write files** | Write the two reports into `output/<run>/` | Findings appear in chat only, nothing is committed to re-open later |
| **Drive a browser** (Playwright MCP, or equivalent) | Stage 03 renders the page for contrast, keyboard, focus, reflow and licence type-size | 14 WCAG criteria and the type-size rule stay honest gaps; coverage is 20/50 instead of 34/50 |

**Where it does NOT run:** a plain chat window, or a knowledge-only "project"/workspace that
merely attaches this folder as reference. Those can read the files but cannot save the page,
write the reports, or open the browser — so the headline run below is impossible there. A
knowledge-only workspace can still *reason* over a page you paste in and cite the standard, but
that is not an audit this tool will stand behind.

**Wiring it up takes a few minutes.** [`SETUP.md`](SETUP.md) has the exact steps, including how
to add the Playwright browser tools.

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
./verify-citations.sh        # six checks, no dependencies. Proves the citations are real
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

### No setup required, better with it

Nothing here needs an account, a key or an install to produce a real audit. One stage,
speed, gets better if you have more:

| You have | Stage 07 gives you |
|---|---|
| Nothing | The committed sample response, so you can see the stage work end to end |
| Lighthouse installed | Real lab LCP and CLS for the site. INP reported as needing field data, with the command to get it |
| A free Google API key | Real-user LCP, **INP** and CLS at the 75th percentile, which is the percentile Google's own thresholds are defined at |

Every other stage runs fully with nothing installed.

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

1. `./verify-citations.sh`. Six checks: every provision ID cited anywhere exists in
   `reference/`; every `file.md:line` pointer lands on the line carrying that provision; every
   sample pointer exists; every reference file declares provenance; every internal link
   resolves; and the files that load on every run are under their ICM size caps. It caught
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
