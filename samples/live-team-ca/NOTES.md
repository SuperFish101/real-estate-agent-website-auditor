# NOTES.md for `live-team-ca/`

## What this is

**A real California two-agent real estate team's website, captured live, with the identity
removed.** Captured 2026-09-06 by `curl`, HTTP 200. 9,014 lines of the site's own HTML, its own
robots.txt and its own sitemap index.

The licensees are two real California DRE salespeople working a Central Valley market. They did
not ask to be audited and do not know this run exists, which is exactly why the identity is gone.
The method is `method/anonymising-a-run.md` and the redaction is deliberate.

This is a hosted agent-website platform, server rendered, with the page markup formatted across
9,000 readable lines. That matters to the audit only because it explains the shape of what was
found, never the verdicts.

## Why this site is in `samples/` alongside the other two live runs

**It is the two-licensee case.** `CA-2773(a)-EACH` says that if more than one licensee is named,
each one's licence number must be disclosed. The other live runs are single agents, so that
provision has never been exercised against anything real. This page names two licensees, and a
third licensed entity, so it is the artifact that tests the rule.

It is also the first live run where a page **passes** the texting consent checks rather than
failing them. An auditor whose corpus only contains failures teaches the reader nothing about
what a pass looks like.

## Jurisdiction

**California.** The page carries three eight digit CA DRE licence numbers, labelled `CA DRE#`,
so stage 02 loads the California pack. That is the fact that settles it, not a guess.

## What was replaced

| Real value | Replaced with |
|---|---|
| The domain | `example-team.test` |
| The two licensees' names | `Blake Agent` and `Casey Agent` |
| The team name | `The Agents` |
| The brokerage | `Example Brokerage` |
| The second licensed entity named in the footer | `EXAMPLE HOLDINGS INC` |
| The three eight digit DRE numbers | `01885544`, `01885545`, `01885546`, all eight digits |
| The phone number | `(555) 555-0198` |
| The office street address | `1 EXAMPLE ST` |
| Six sold property addresses and their URL slugs | `101 Example Lane` and so on, same shape |
| Six sale prices | Different prices, all still seven figures |
| Seven client names on testimonials | `Client One` to `Client Seven` |
| Seven testimonial excerpts | Generic excerpts of the same length, `...` truncation kept |
| Google Tag Manager, GA4 and Universal Analytics ids | Placeholders of the same shape |
| Every CDN media id, including the MLS photo paths | Placeholders of the same shape |
| Social profile URLs | The same platforms, placeholder handles |
| Distinctive marketing copy | Generic equivalents of the same length |
| The achievement statistics | Different numbers of the same shape |
| **The city name and a neighbouring place name** | `Example City`, `Example Park`, `Example Town` |

## Two things this run does that the method did not previously require

Recorded here rather than left as an oversight, and the same two as the other run captured on
this date.

1. **The city was replaced.** `method/anonymising-a-run.md` keeps the city. This team sits in a
   small California city, and the check 4 search test failed: a search engine returned the real
   site for a sentence that had already had every name taken out. The state is untouched, which
   is all stage 02 needs.
2. **The achievement statistics were changed.** Years in business, dollar volume and unit count
   are a fingerprint when paired with a market. They are replaced with different numbers of the
   same shape. Nothing in the audit reads their values.

## What was changed for capture, and nothing else

1. **Nothing in the markup.** Unlike the other live run, this page needed no stylesheet rewrite:
   its layout CSS is inline, and the one external stylesheet is a generic vendor file on a
   platform CDN that loads normally in browser mode and identifies nobody.
2. **Images are not committed.** Their `src` attributes are untouched and still point at the
   platform CDN with placeholder ids, so they will not load. No image was needed: the AB 723
   pass reads `manifest.md` and never the pictures.

Every tag, every attribute, every class and every line number is as captured, so a finding that
cites `index.html:341` lands on the line it says it does.

## What the auditor should know before it starts

- **The HTTP status was 200.** Recorded here because a saved file carries no status code and
  `GSE-TR-2` is INSUFFICIENT EVIDENCE without it.
- **This is the licensees' own site**, which is what `CA-2773(a)(3)` needs to be true before
  10 CCR 2773 applies at all.
- **Most of this page's forms live inside pop-ups and modals that are closed on load.** Browser
  mode measured them as zero by zero pixels inside a hidden ancestor. Anything measured only in
  that closed state is reported as such and is never turned into a failure. This matters: six
  colour pairs on this page fall below the contrast threshold and **every one of them is inside
  a closed modal**, so none of them became a finding.
- **There is no structured data on this page at all.** Not invalid: absent. Zero
  `application/ld+json` blocks, zero microdata, zero RDFa.
- **The page carries unrendered template placeholders in its source**, such as `{{name}}` and
  `${src}`, inside hidden template elements. Browser mode checked the rendered text and found
  none of them visible, so they produce no finding.
- **`manifest.md` is present but every row is UNKNOWN.** The owners were never asked how the
  photographs were made, because they were never asked anything. Every AB 723 row is therefore
  INSUFFICIENT EVIDENCE, not a pass and not a failure.
