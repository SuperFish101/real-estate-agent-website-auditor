# Sitemaps XML protocol 0.9

| | |
|---|---|
| Publisher | sitemaps.org (jointly maintained by Google, Yahoo! and Microsoft) |
| Source | https://www.sitemaps.org/protocol.html |
| Version | 0.9 |
| Retrieved | 2026-09-06 |
| Licence | Published under the terms of the Attribution-ShareAlike Creative Commons Licence, per sitemaps.org |
| Scope of this file | The XML tag definitions, the file requirements, the file location rule and the "informing search engine crawlers" section, verbatim. The example files, the cross-submission section, the sitemap index section and the "other formats" section (RSS, text files) are not reproduced |

**Provision ID scheme.** `SM-REQ-<tag>` for a required tag, `SM-OPT-<tag>` for an optional one,
`SM-FILE-<n>` for a file-level requirement, `SM-LOC-<n>` for the file location rule and
`SM-INFORM-<n>` for telling the search engines where the file is.

---

## Required and optional tags

`SM-REQ-urlset` **required.** Encapsulates the file and references the current protocol
standard.

`SM-REQ-url` **required.** Parent tag for each URL entry. The remaining tags are children of
this tag.

`SM-REQ-loc` **required.** URL of the page. This URL must begin with the protocol (such as
http) and end with a trailing slash, if your web server requires it. This value must be less
than 2,048 characters.

`SM-OPT-lastmod` **optional.** The date of last modification of the page. This date should be
in W3C Datetime format. This format allows you to omit the time portion, if desired, and use
YYYY-MM-DD. Note that the date must be set to the date the linked page was last modified, not
when the sitemap is generated.

`SM-OPT-changefreq` **optional.** How frequently the page is likely to change. This value
provides general information to search engines and may not correlate exactly to how often they
crawl the page. Valid values are: always, hourly, daily, weekly, monthly, yearly, never.

`SM-OPT-priority` **optional.** The priority of this URL relative to other URLs on your site.
Valid values range from 0.0 to 1.0.

## File level requirements

`SM-FILE-1` The Sitemap must: begin with an opening `<urlset>` tag and end with a closing
`</urlset>` tag; specify the namespace (protocol standard) within the `<urlset>` tag; include a
`<url>` entry for each URL, as a parent XML tag; include a `<loc>` child entry for each `<url>`
parent tag.

`SM-FILE-2` The file itself must be UTF-8 encoded.

`SM-FILE-3` As with all XML files, any data values (including URLs) must use entity escape
codes for the characters `&`, `'`, `"`, `<` and `>`.

`SM-FILE-4` All URLs in a Sitemap must be from a single host, such as www.example.com.

`SM-FILE-5` In addition, all URLs (including the URL of your Sitemap) must be URL-escaped and
encoded for readability by the web server on which they are located.

`SM-FILE-6` You can provide multiple Sitemap files, but each Sitemap file that you provide must
have no more than 50,000 URLs and must be no larger than 50MB (52,428,800 bytes).

---

## Sitemap file location

`SM-LOC-1` The location of a Sitemap file determines the set of URLs that can be included in that
Sitemap. A Sitemap file located at `http://example.com/catalog/sitemap.xml` can include any URLs
starting with `http://example.com/catalog/` but can not include URLs starting with
`http://example.com/images/`.

`SM-LOC-2` Note that this means that all URLs listed in the Sitemap must use the same protocol
(http, in this example) and reside on the same host as the Sitemap. For instance, if the Sitemap
is located at `http://www.example.com/sitemap.xml`, it can't include URLs from
`http://subdomain.example.com`. URLs that are not considered valid are dropped from further
consideration.

`SM-LOC-3` It is strongly recommended that you place your Sitemap at the root directory of your
web server. For example, if your web server is at example.com, then your Sitemap index file would
be at `http://example.com/sitemap.xml`.

---

## Informing search engine crawlers

`SM-INFORM-1` Once you have created the Sitemap file and placed it on your webserver, you need to
inform the search engines that support this protocol of its location. You can do this by:

- submitting it to them via the search engine's submission interface
- specifying the location in your site's robots.txt file
- sending an HTTP request

The search engines can then retrieve your Sitemap and make the URLs available to their crawlers.

`SM-INFORM-2` You can specify the location of the Sitemap using a robots.txt file. To do this,
simply add the following line including the full URL to the sitemap:

```
Sitemap: http://www.example.com/sitemap.xml
```

This directive is independent of the user-agent line, so it doesn't matter where you place it in
your file. If you have a Sitemap index file, you can include the location of just that file. You
don't need to list each individual Sitemap listed in the index file.

---

## How the auditor uses this

| Provision | Check |
|---|---|
| `SM-REQ-urlset`, `SM-REQ-url`, `SM-REQ-loc` | Parse the supplied `sitemap.xml`. A missing required tag is a FAIL |
| `SM-FILE-4` | Every `<loc>` shares one host. A mixed-host sitemap is a FAIL, and it is a common defect on agent sites that syndicate listings |
| `SM-FILE-6` | Count URLs and bytes |
| `SM-LOC-1`, `SM-LOC-2` | Every `<loc>` shares the sitemap's host and protocol. Overlaps `SM-FILE-4`: cite one, not both |
| `SM-LOC-3` | The wording is "strongly recommended", so a sitemap away from the root is ADVISORY at most, never a FAIL |
| `SM-INFORM-1` | **The obligation is to inform the engines, by any of three routes.** Only one of the three, the robots.txt line, is visible from outside. A site with no `Sitemap:` record may still have submitted through a search engine's interface, and a file reader cannot see that. So an absent record is INSUFFICIENT EVIDENCE, never a FAIL, and the query names the console a person can go and check |
| `SM-INFORM-2` | The syntax of that one route. Judge it only where a `Sitemap:` record actually exists: full URL, independent of any user-agent line |
| `SM-OPT-*` | **Absence is never a failure.** Reported, not graded |

**Severity is ADVISORY, never BLOCKING.** A sitemap is a discovery aid, and no publisher in
`reference/` says a page is delisted for a malformed one. A sitemap declared in robots.txt that
does not resolve is the exception worth its own note, because the declaration is then simply
wrong.

**A sitemap index file is out of scope here**, because its own tag table is not reproduced in
this file. A run that is given one reports NOT COVERED rather than guessing.
