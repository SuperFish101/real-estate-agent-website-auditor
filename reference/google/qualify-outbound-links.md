# Qualify your outbound links to Google

| | |
|---|---|
| Publisher | Google |
| Source | https://developers.google.com/search/docs/crawling-indexing/qualify-outbound-links |
| Retrieved | 2026-09-06 |
| Licence | Creative Commons Attribution 4.0 License. Content reproduced under that licence. Not endorsed by Google |
| Scope of this file | The complete `rel` value guidance and the multiple-values section, verbatim. The "when to use nofollow for crawl control" aside and the linked paid-links policy page are not reproduced |

**Provision ID scheme.** `LINK-REL-sponsored`, `LINK-REL-ugc`, `LINK-REL-nofollow`,
`LINK-REL-MULTIPLE`, `LINK-REL-NONE`.

---

For certain links on your site, you might want to tell Google your relationship with the linked
page. In order to do that, use one of the following `rel` attribute values in the `<a>` tag.

`LINK-REL-NONE` For regular links that you expect Google to fetch and parse without any
qualifications, you don't need to add a `rel` attribute.

`LINK-REL-sponsored` Mark links that are advertisements or paid placements (commonly called paid
links) with the `sponsored` value.

> Note: The `nofollow` attribute was previously recommended for these types of links and is
> still an acceptable way to flag them, though `sponsored` is preferred.

`LINK-REL-ugc` We recommend marking user-generated content (UGC) links, such as comments and
forum posts, with the `ugc` value. If you want to recognize and reward trustworthy contributors,
you might remove this attribute from links posted by members or users who have consistently made
high-quality contributions over time.

`LINK-REL-nofollow` Use the `nofollow` value when other values don't apply, and you'd rather
Google not associate your site with, or crawl the linked page from, your site. For links within
your own site, use the robots.txt `disallow` rule.

`LINK-REL-MULTIPLE` You may specify multiple `rel` values as a space- or comma-separated list.

Links marked with these `rel` attributes will generally not be followed. Remember that the
linked pages may be found through other means, such as sitemaps or links from other sites, and
thus they may still be crawled.

---

## How the auditor uses this

| Provision | Check | Severity |
|---|---|---|
| `LINK-REL-sponsored` | A link the artifact itself identifies as paid, sponsored or an advertisement, carrying neither `sponsored` nor `nofollow` | ADVISORY |
| `LINK-REL-ugc` | Links inside a comment or review block, unmarked | ADVISORY |
| `LINK-REL-nofollow` | Reported, never required | none |
| `LINK-REL-NONE` | An ordinary link carrying `nofollow` for no stated reason. Reported as a note, because it is a choice, not a defect | none |

**The evidence bar here is high and it is the point of the stage.** The auditor cannot know
whether a link was paid for. It can only see what the page says about it. A `sponsored` finding
therefore requires the artifact's own words: text like "sponsored", "advertisement", "paid
partner", "affiliate", or a `NOTES.md` line from the owner saying the placement was paid.
**Absent that, the verdict is INSUFFICIENT EVIDENCE and the finding says what would settle it.**

Real estate sites carry mortgage broker, title company, inspector and photographer links
constantly, and some of those are paid referral arrangements while most are not. Guessing which
is which would be exactly the kind of accusation this tool exists not to make.

**`rel` values are Google's vocabulary and no other publisher's.** Bing's guidelines in this
folder say links should use standard `<a href>` with relevant anchor text and say nothing about
`sponsored`. So a finding here cites Google, and only Google.
