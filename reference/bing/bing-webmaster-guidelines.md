# Bing Webmaster Guidelines

| | |
|---|---|
| Publisher | Microsoft (Bing Webmaster Tools) |
| Source | https://www.bing.com/webmasters/help/webmaster-guidelines-30fba23a |
| Version | The published guidelines as at the retrieval date |
| Retrieved | 2026-09-06 |
| Licence | Microsoft documentation, reproduced for reference. Not endorsed by Microsoft |
| Scope of this file | The twenty-two numbered guidelines in condensed form, and the abuse list in full. The introductory framing, the "measuring beyond clicks" discussion and the closing links are not reproduced |

**A capture note, because it matters for reproducibility.** This page is a JavaScript
application and returns no content to `curl`. It was captured by rendering the page in a browser
and reading `document.body.innerText`. The freshness script cannot check it with a plain fetch,
so its `SOURCES.tsv` row is marked as requiring a rendered check.

**Provision ID scheme.** `BING-<number>` for the numbered guidelines, `BING-ABUSE-<slug>` for
the abuse list.

---

## The numbered guidelines

`BING-1` SEO fundamentals still apply to grounding and AI experiences. Practices that support
crawl efficiency, indexing accuracy, URL consolidation, content clarity and structure, and
authority and trust signals also support eligibility for grounding results.

`BING-2` Make URLs easy for Bing and Copilot to discover, using IndexNow URL submission, XML
sitemaps, crawlable internal links, and external links from relevant websites.

`BING-3` Use sitemaps to signal importance and freshness. Sitemaps should list only canonical
URLs, reflect current site structure, remove deleted or redirected URLs promptly, and include
freshness signals (such as lastmod) where applicable.

`BING-4` Notify Bing and Copilot quickly when URLs change. Use IndexNow when URLs are added,
content is updated, or URLs are removed.

`BING-5` Use links to establish structure and authority. Ensure each important URL is reachable
through crawlable internal links. Links should use standard `<a href>` links and include
relevant anchor text or image alt attributes.

`BING-6` Consolidate duplicate URLs. Avoid serving the same content across multiple URLs.

`BING-7` Handle URL moves with proper redirects. Use 301 redirects for permanent URL changes.
Use 302 redirects only for very short-term changes (less than 2 days). Use redirects instead of
canonical tags.

`BING-8` Allow efficient crawling and rendering. Avoid: blocking important URLs unnecessarily;
hiding critical content behind client-side rendering; excessive or unnecessary HTTP requests to
render the content; outputting excessive or low-value URLs; blocking Bingbot in your robots.txt
file.

`BING-9` Remove URLs cleanly when content is deleted. Return a 404 status code.

`BING-10` Use robots.txt and meta directives correctly. robots.txt controls crawl access, not
indexing. Use NOINDEX when a URL should NOT appear in Bing search, Copilot experiences, or
grounding API results. NOARCHIVE prevents content from being used in Copilot responses and
grounding results.

`BING-11` Create content that is clear, focused, and useful. Thin, ad heavy, or affiliate-only
URLs may lose ranking eligibility and grounding visibility.

`BING-12` Optimize images and video for understanding. Provide descriptive file names, alt text,
and captions, transcripts, or structured data.

`BING-13` Structure content clearly using HTML. Follow best practices for `<title>` and meta
descriptions, logical `<H1>` to `<H6>` heading hierarchy, and semantic HTML elements. Missing,
duplicate, or overly short title tags and meta descriptions may reduce indexing reliability.

`BING-14` Use structured data accurately. Markup must accurately reflect visible content.

`BING-15` Ensure content can be verified independently. Facts and definitions are explicit, key
statements do not rely on implied content, and important information is visible on the URL
itself.

`BING-16` Define entities clearly and consistently. Use clear and consistent naming for people,
organizations, products, and locations. Avoid ambiguous references.

`BING-17` Focus each URL on a single topic.

`BING-18` Surface key information early. Place essential information near the top of the URL.

`BING-19` Keep content accurate and up to date.

`BING-20` Preserve URL stability over time.

`BING-21` Manage crawl efficiency and reduce crawl waste.

`BING-22` Crawl efficiency, visibility, and measuring beyond clicks.

## The abuse list

Bing's stated consequence for these: "Sites that engage in these practices may experience
reduced rankings, suppressed grounding visibility, loss of grounding eligibility, ignored
structured data, or removal from the Bing index."

`BING-ABUSE-CLOAKING` Showing different content to search crawlers than to users.

`BING-ABUSE-LINK-SCHEMES` Manipulating inbound links to inflate authority. This includes link
buying, link spamming, private networks, and artificial social promotion schemes.

`BING-ABUSE-DUPLICATE` Publishing the same or substantially similar content across multiple
URLs.

`BING-ABUSE-SCRAPED` Copying content from other sites without adding original value. Modifying
or lightly rewriting existing content without new insight or perspective is considered scraping.

`BING-ABUSE-KEYWORD-STUFFING` Excessive repetition, unnatural phrasing, or loading pages with
irrelevant keywords.

`BING-ABUSE-AUTOGEN` Large-scale content generated without oversight, quality control, or
editorial review.

`BING-ABUSE-AFFILIATE` Sites that primarily redirect users to retailers without providing
original value.

`BING-ABUSE-MALICIOUS` Phishing, malware distribution, or other harmful activities.

`BING-ABUSE-MISLEADING-SD` Structured data that is irrelevant, inaccurate, or misleading.

`BING-ABUSE-PROMPT-INJECTION` Attempts to add content designed to manipulate or interfere with
language models used by Bing or Copilot.

---

## How the auditor uses this

**Severity is ADVISORY for the numbered guidelines and BLOCKING for the abuse list**, on the
same reasoning used for Google: Bing states the consequence for the abuse list ("removal from
the Bing index") and states no consequence for most of the numbered items.

**The same evidence bar as the Google spam pass applies to every `BING-ABUSE-*` provision.**
These turn on intent and manipulation, which cannot be read from a file. A BLOCKING finding here
requires the artifact to match the described practice almost exactly, and the finding must say
that intent was not established. `BING-ABUSE-PROMPT-INJECTION` in particular is never issued
from pattern matching alone.

**Where Bing and Google agree, cite one, not both.** `rules.md` section 3 allows exactly one
provision per finding. Duplicate markup, cloaking and keyword stuffing all appear in both
rulebooks; pick the publisher whose consequence the finding is actually relying on and say why
in one line.
