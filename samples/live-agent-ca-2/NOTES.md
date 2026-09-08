# NOTES.md for `live-agent-ca-2/`

## What this is

**A real California real estate agent's website, captured live, with the identity removed.**
Captured 2026-09-06 by `curl`, HTTP 200. 976 lines of the site's own HTML, its own robots.txt,
its own sitemap index, one page sitemap and its own combined stylesheet.

The licensee is a real California DRE salesperson working a Central Valley market. They did not
ask to be audited and do not know this run exists, which is exactly why the identity is gone.
The method is `method/anonymising-a-run.md` and the redaction is deliberate.

This is a WordPress site built with Elementor and the Rank Math SEO plugin. That matters to the
audit only because it explains the shape of what was found, never the verdicts.

## Jurisdiction

**California.** The page carries an eight digit CA DRE licence number and the copy names a
California market, so stage 02 loads the California pack. That is the fact that settles it, not
a guess.

## What was replaced

Every replacement keeps the shape of the thing it replaced, so no check is faked either way.

| Real value | Replaced with |
|---|---|
| The domain | `example-agent.test` |
| The licensee's name | `Alex Agent` |
| The brokerage named in the body copy | `Example Brokerage` |
| The **second** brokerage named in the same paragraph | `Second Brokerage` |
| The eight digit DRE number | `01885544`, also eight digits |
| The phone number | `(555) 555-0173`, in both its formats |
| The email address | `alex@example-agent.test` |
| A third party's email address in a `twitter:data1` meta tag | `webmaster@example-agency.test` |
| The street address | `1 Example Street`, postcode replaced |
| The `geo` latitude and longitude in the structured data | Rounded placeholder coordinates |
| The Google Maps place id and `cid` | Placeholders of the same length |
| Social profile URLs | The same platforms, placeholder handles |
| Two LeadConnector form ids | Placeholders of the same shape and length |
| A WordPress form nonce | Zeroes, same length |
| Image file names carrying the licensee's name | The same names with the placeholder |
| The six client testimonials | Generic testimonials of the same length |
| Distinctive headings and body paragraphs | Generic equivalents, keyword phrases kept |
| The achievement statistics | Different numbers, **the relationship between them kept** |
| **The city name** | `Example City`. See below |

## Two things this run does that the method did not previously require

Both are recorded here rather than left as an oversight.

1. **The city was replaced.** `method/anonymising-a-run.md` keeps the city, on the reasoning
   that a city with hundreds of licensees does not point at a person. This site sits in a small
   California city, and the check 4 search test failed twice: a search engine returned the real
   site for two sentences that had already had every name taken out, because the city plus one
   ordinary marketing phrase was enough. So the city went too. The state, which is the only
   thing the audit needs, is untouched: the DRE number, the `CA` region and the California
   postcode format all remain, and stage 02 still loads the California pack from them.
2. **The achievement statistics were changed.** "$60 million in sales", the review count and the
   sale count are a fingerprint when paired with a market. They are replaced with different
   numbers, and **the mismatch between them is preserved exactly**: the page still states one
   sales figure in its prose and its structured data, and a different, larger one in its
   statistics block, because that mismatch is a thing the audit looks at.

## What was changed for capture, and nothing else

1. **The stylesheet link.** It pointed at the live combined theme CSS. It now points at
   `style.css`, which is that same file saved beside the page. Without this, browser mode would
   render an unstyled page and every colour and type size measurement would be wrong.
2. **Images are not committed.** Their `src` attributes are untouched and still sit on the
   placeholder domain, so they will not load. No image was needed: the AB 723 pass reads
   `manifest.md` and never the pictures.

Nothing else was touched. Every tag, every attribute, every class and every line number is as
captured, so a finding that cites `index.html:936` lands on the line it says it does.

## The one thing a reader must know about line numbers here

**This site serves its entire page body on a single line, line 936, which is 68,940 characters
long.** That is how the server sent it, and reformatting it would change the rendering and
therefore every browser measurement, so it was left alone. Findings inside the body cite
`index.html:936` and add a **column number**, so a reader can land on the exact string:

```
awk 'NR==936' samples/live-agent-ca-2/index.html | cut -c 44448-44700
```

Findings in the head, the structured data and the footer sit on their own lines and cite them
normally.

## What the auditor should know before it starts

- **The HTTP status was 200.** Recorded here because a saved file carries no status code and
  `GSE-TR-2` is INSUFFICIENT EVIDENCE without it.
- **This is the licensee's own site**, which is what `CA-2773(a)(3)` needs to be true before
  10 CCR 2773 applies at all.
- **`/sitemap.xml` on the live host returned the home page HTML with HTTP 200**, not a sitemap.
  The sitemap the robots.txt actually declares is `/sitemap_index.xml`, which is valid, and both
  it and the one page sitemap it lists are saved here.
- **Both contact forms are third party iframes** on `api.leadconnectorhq.com`. Their contents
  are cross-origin and were not captured, so nothing inside them can be read from this artifact.
- **`manifest.md` is present but every row is UNKNOWN.** The owner was never asked how the
  photographs were made, because they were never asked anything. Every AB 723 row is therefore
  INSUFFICIENT EVIDENCE, not a pass and not a failure, and the run says what would settle it.
- **`style.css` contains eight digit numbers.** They are CSS percentage fractions such as
  `28.571428%`, not licence numbers. Redaction check 3 is run against `index.html`, where the
  only eight digit number is the placeholder licence.
