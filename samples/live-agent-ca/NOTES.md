# NOTES.md for `live-agent-ca/`

## What this is

**A real California real estate agent's website, captured live, with the identity removed.**
Captured 2026-09-05 by `curl`, HTTP 200. 723 lines of the site's own HTML, its own robots.txt,
its own sitemap index and its own stylesheet.

The licensee is a real California DRE salesperson working a coastal San Diego market. They did
not ask to be audited and do not know this run exists, which is exactly why the identity is
gone. The method is `method/anonymising-a-run.md` and the redaction is deliberate.

## Jurisdiction

**California.** The page carries a CA DRE licence number and the copy names California
markets, so stage 02 loads the California pack. That is the fact that settles it, not a guess.

## What was replaced

Every replacement keeps the shape of the thing it replaced, so no check is faked either way.

| Real value | Replaced with |
|---|---|
| The domain | `example-realty.test` |
| The licensee's name | `Agent Name` |
| The brokerage named in the structured data | `Example Brokerage` |
| The **different** brokerage named in the visible copy | `Second Brokerage` |
| The eight digit DRE number | `01998877`, also eight digits |
| The phone number | `(555) 555-0142` |
| The email address | `agent@example-realty.test` |
| Social profile URLs | The same platforms, placeholder handles |
| The reCAPTCHA site key | A placeholder of the same shape |
| A WordPress form nonce | Zeroes, same length |
| The twelve blog post titles and their URL slugs | Generic market equivalents of the same shape and length |

**Why the blog titles went too.** Everything above hides who the licensee *is*. The blog titles
were the one thing left that would **find** them: a distinctive title pasted into any search
engine returns one site. They are now generic ("Coastal Home Architecture Styles, Explained"
rather than a named neighbourhood), same heading levels, same link text, same lengths, so every
check that reads them reads the same thing.

**Why the market names stayed.** La Jolla, San Diego and the neighbourhood list are still here,
because the audit needs them: they settle which state pack loads, and the spam and fair housing
stages both read locality wording. A coastal San Diego market has hundreds of licensees, so
naming the market narrows the field without pointing at a person. That is a deliberate line,
recorded here rather than left as an oversight.

**Two different brokerage names appear on this page, and that is real.** The structured data
says the licensee is a member of one brokerage; the visible body copy and a testimonial say
another. Both are redacted, and the mismatch between them is left exactly as it was found,
because it is one of the things the audit is for.

## What was changed for capture, and nothing else

1. **The stylesheet link.** Line 64 pointed at the live theme CSS. It now points at
   `style.css`, which is that same file saved beside the page. Without this, browser mode
   would render an unstyled page and every colour and type size measurement would be wrong.
2. **Images are not committed.** Their `src` attributes are untouched and still sit on the
   placeholder domain, so they will not load. No image was needed: the AB 723 pass reads
   `manifest.md` and never the pictures.

Nothing else was touched. Every tag, every attribute, every class and every line number is as
captured, so a finding that cites `index.html:150` lands on the line it says it does.

## What the auditor should know before it starts

- **The HTTP status was 200.** Recorded here because a saved file carries no status code and
  `GSE-TR-2` is INSUFFICIENT EVIDENCE without it.
- **This is the licensee's own site**, which is what `CA-2773(a)(3)` needs to be true before
  10 CCR 2773 applies at all.
- **`manifest.md` is present but every row is UNKNOWN.** The owner was never asked how the
  photographs were made, because they were never asked anything. Every AB 723 row is therefore
  INSUFFICIENT EVIDENCE, not a pass and not a failure, and the run says what would settle it.
