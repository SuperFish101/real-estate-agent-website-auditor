# Google Search technical requirements

**This file is the standard, not a summary of it.**

| | |
|---|---|
| Document | Google Search technical requirements (part of Google Search Essentials) |
| Publisher | Google |
| Source | https://developers.google.com/search/docs/essentials/technical |
| Page last updated by publisher | 2025-12-18 UTC |
| Retrieved | 2026-09-03 |
| Licence | Creative Commons Attribution 4.0 (https://creativecommons.org/licenses/by/4.0/) |
| Scope of this file | The full page, verbatim. Hyperlinks flattened to plain text. |

**Provision ID scheme.** `GSE-TR-1`, `GSE-TR-2`, `GSE-TR-3` are the three numbered
requirements Google states on this page. `GSE-TR-INDEXABLE-A` and `GSE-TR-INDEXABLE-B` are
the two conditions Google gives for the third one.

---

## The page, verbatim

It costs nothing to get your page in search results, no matter what anyone tries to tell you.
As long as your page meets the minimum technical requirements, it's eligible to be
indexed by Google Search:

1. Googlebot isn't blocked.
2. The page works, meaning that Google receives an HTTP `200 (success)` status code.
3. The page has indexable content.

### Googlebot isn't blocked (it can find and access the page)

Google only indexes pages on the web that are accessible to the public and which don't
block our crawler, Googlebot, from crawling them. If a page is made private, such as requiring a log-in to view it,
Googlebot will not crawl it. Similarly, if one of the
several mechanisms are
used to block Google from indexing, the page will not be indexed.

#### Check if Googlebot can find and access your page

Pages that are blocked by robots.txt
are unlikely to show in Google Search results. To see a list of pages that are inaccessible to
Google (but that you would like to see in Search results), use both the
Page Indexing report
and Crawl Stats report
in Search Console. Each report may contain different information about your URLs, so it's a good idea to look at both reports.

To test a specific page, use the URL Inspection tool.

### The page works (it's not an error page)

Google only indexes pages that are served with an
HTTP `200 (success)` status code.
Client and server error pages aren't indexed. You can check the HTTP status code for a given
page with the URL Inspection tool.

### The page has indexable content

Once Googlebot can find and access a working page, Google checks the page for indexable
content. Indexable content means:

- The textual content is in a file type that Google Search supports.
- The content doesn't violate our spam policies.

---

## Provision index

Each ID below points at the sentence above that carries the requirement. The quoted text is
the requirement as Google words it.

| ID | Requirement, in the publisher's words |
|---|---|
| `GSE-TR-1` | "Googlebot isn't blocked." |
| `GSE-TR-2` | "The page works, meaning that Google receives an HTTP `200 (success)` status code." |
| `GSE-TR-3` | "The page has indexable content." |
| `GSE-TR-INDEXABLE-A` | "The textual content is in a file type that Google Search supports." |
| `GSE-TR-INDEXABLE-B` | "The content doesn't violate our spam policies." |

Google's stated consequence for failing any of these: the page is not eligible to be
indexed, so it cannot appear in Google Search at all. That is why this auditor grades a
technical requirement failure as BLOCKING.
