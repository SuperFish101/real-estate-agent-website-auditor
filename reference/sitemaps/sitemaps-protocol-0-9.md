# Sitemaps XML protocol 0.9

| | |
|---|---|
| Publisher | sitemaps.org (jointly maintained by Google, Yahoo! and Microsoft) |
| Source | https://www.sitemaps.org/protocol.html |
| Version | 0.9 |
| Retrieved | 2026-09-06 |
| Licence | Published under the terms of the Attribution-ShareAlike Creative Commons Licence, per sitemaps.org |
| Scope of this file | The XML tag definitions, the file requirements and the location rule, verbatim. The example files, the sitemap index section and the "other formats" section (RSS, text files) are not reproduced |

**Provision ID scheme.** `SM-REQ-<tag>` for a required tag, `SM-OPT-<tag>` for an optional one,
`SM-FILE-<n>` for a file-level requirement.

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

## How the auditor uses this

| Provision | Check |
|---|---|
| `SM-REQ-urlset`, `SM-REQ-url`, `SM-REQ-loc` | Parse the supplied `sitemap.xml`. A missing required tag is a FAIL |
| `SM-FILE-4` | Every `<loc>` shares one host. A mixed-host sitemap is a FAIL, and it is a common defect on agent sites that syndicate listings |
| `SM-FILE-6` | Count URLs and bytes |
| `SM-OPT-*` | **Absence is never a failure.** Reported, not graded |

**Severity is ADVISORY, never BLOCKING.** A sitemap is a discovery aid, and no publisher in
`reference/` says a page is delisted for a malformed one. A sitemap declared in robots.txt that
does not resolve is the exception worth its own note, because the declaration is then simply
wrong.

**A sitemap index file is out of scope here**, because its own tag table is not reproduced in
this file. A run that is given one reports NOT COVERED rather than guessing.
