# RFC 9309, Robots Exclusion Protocol

**This file is the standard, not a summary of it.**

| | |
|---|---|
| Document | RFC 9309, "Robots Exclusion Protocol" |
| Authors | M. Koster, G. Illyes, H. Zeller, L. Sassman |
| Publisher | Internet Engineering Task Force (IETF) |
| Category | Standards Track. ISSN 2070-1721 |
| Published | September 2022 |
| Source | https://www.rfc-editor.org/rfc/rfc9309.txt |
| Retrieved | 2026-09-03 |
| Licence | Copyright (c) 2022 IETF Trust and the persons identified as the document authors. Subject to BCP 78 and the IETF Trust's Legal Provisions (https://trustee.ietf.org/license-info). |
| Scope of this file | Sections 1.1, 2.1 through 2.5, and 5, verbatim. Sections 3, 4 and 6 (Security Considerations, IANA Considerations, References) and the ABNF grammar block are not reproduced, because no finding in this auditor cites them. Everything a finding can cite is here in full. |

**Why an auditor of a website cites an RFC written for crawlers.** Most of RFC 9309 tells a
crawler how to behave. The parts reproduced below tell a **service owner** what a valid
robots.txt file is: where it must live, how it must be encoded, and what syntax a crawler is
required to honour. A robots.txt that breaks those rules will not do what its author
intended.

**Provision ID scheme.** `RFC9309-<section>`, for example `RFC9309-2.3`.

---

## `RFC9309-1.1` Section 1.1, Requirements Language

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in BCP 14 [RFC2119] [RFC8174] when, and only when, they appear in all capitals, as shown here.

## `RFC9309-2.1` Section 2.1, Protocol Definition

The protocol language consists of rule(s) and group(s) that the service makes available in a file named "robots.txt" as described in Section 2.3:

Rule: A line with a key-value pair that defines how a crawler may access URIs. See Section 2.2.2.

Group: One or more user-agent lines that are followed by one or more rules. The group is terminated by a user-agent line or end of file. See Section 2.2.1. The last group may have no rules, which means it implicitly allows everything.

## `RFC9309-2.2.1` Section 2.2.1, The User-Agent Line

Crawlers set their own name, which is called a product token, to find relevant groups. The product token MUST contain only uppercase and lowercase letters ("a-z" and "A-Z"), underscores ("_"), and hyphens ("-"). The product token SHOULD be a substring of the identification string that the crawler sends to the service.

Crawlers MUST use case-insensitive matching to find the group that matches the product token and then obey the rules of the group. If there is more than one group matching the user-agent, the matching groups' rules MUST be combined into one group and parsed according to Section 2.2.2.

If no matching group exists, crawlers MUST obey the group with a user-agent line with the "*" value, if present.

If no group matches the product token and there is no group with a user-agent line with the "*" value, or no groups are present at all, no rules apply.

## `RFC9309-2.2.2` Section 2.2.2, The "Allow" and "Disallow" Lines

These lines indicate whether accessing a URI that matches the corresponding path is allowed or disallowed.

To evaluate if access to a URI is allowed, a crawler MUST match the paths in "allow" and "disallow" rules against the URI. The matching SHOULD be case sensitive. The matching MUST start with the first octet of the path. The most specific match found MUST be used. The most specific match is the match that has the most octets. Duplicate rules in a group MAY be deduplicated. If an "allow" rule and a "disallow" rule are equivalent, then the "allow" rule SHOULD be used. If no match is found amongst the rules in a group for a matching user-agent or there are no rules in the group, the URI is allowed. The /robots.txt URI is implicitly allowed.

Octets in the URI and robots.txt paths outside the range of the ASCII coded character set, and those in the reserved range defined by [RFC3986], MUST be percent-encoded as defined by [RFC3986] prior to comparison.

If a percent-encoded ASCII octet is encountered in the URI, it MUST be unencoded prior to comparison, unless it is a reserved character in the URI as defined by [RFC3986] or the character is outside the unreserved character range. The match evaluates positively if and only if the end of the path from the rule is reached before a difference in octets is encountered.

The crawler SHOULD ignore "disallow" and "allow" rules that are not in any group (for example, any rule that precedes the first user-agent line).

Implementors MAY bridge encoding mismatches if they detect that the robots.txt file is not UTF-8 encoded.

## `RFC9309-2.2.3` Section 2.2.3, Special Characters

Crawlers MUST support the following special characters:

| Character | Description | Example |
|---|---|---|
| `#` | Designates a line comment. | `allow: / # comment in line` |
| `$` | Designates the end of the match pattern. | `allow: /this/path/exactly$` |
| `*` | Designates 0 or more instances of any character. | `allow: /this/*/exactly` |

If crawlers match special characters verbatim in the URI, crawlers SHOULD use "%" encoding.

## `RFC9309-2.2.4` Section 2.2.4, Other Records

Crawlers MAY interpret other records that are not part of the robots.txt protocol -- for example, "Sitemaps" [SITEMAPS]. Crawlers MAY be lenient when interpreting other records. For example, crawlers may accept common misspellings of the record.

Parsing of other records MUST NOT interfere with the parsing of explicitly defined records in Section 2. For example, a "Sitemaps" record MUST NOT terminate a group.

## `RFC9309-2.3` Section 2.3, Access Method

The rules MUST be accessible in a file named "/robots.txt" (all lowercase) in the top-level path of the service. The file MUST be UTF-8 encoded (as defined in [RFC3629]) and Internet Media Type "text/plain" (as defined in [RFC2046]).

As per [RFC3986], the URI of the robots.txt file is:

    "scheme:[//authority]/robots.txt"

For example, in the context of HTTP or FTP, the URI is:

    https://www.example.com/robots.txt
    ftp://ftp.example.com/robots.txt

## `RFC9309-2.3.1` Section 2.3.1, Access Results

**2.3.1.1. Successful Access.** If the crawler successfully downloads the robots.txt file, the crawler MUST follow the parseable rules.

**2.3.1.2. Redirects.** It's possible that a server responds to a robots.txt fetch request with a redirect, such as HTTP 301 or HTTP 302 in the case of HTTP. The crawlers SHOULD follow at least five consecutive redirects, even across authorities (for example, hosts in the case of HTTP). If a robots.txt file is reached within five consecutive redirects, the robots.txt file MUST be fetched, parsed, and its rules followed in the context of the initial authority. If there are more than five consecutive redirects, crawlers MAY assume that the robots.txt file is unavailable.

**2.3.1.3. "Unavailable" Status.** "Unavailable" means the crawler tries to fetch the robots.txt file and the server responds with status codes indicating that the resource in question is unavailable. For example, in the context of HTTP, such status codes are in the 400-499 range. If a server status code indicates that the robots.txt file is unavailable to the crawler, then the crawler MAY access any resources on the server.

**2.3.1.4. "Unreachable" Status.** If the robots.txt file is unreachable due to server or network errors, this means the robots.txt file is undefined and the crawler MUST assume complete disallow. For example, in the context of HTTP, server errors are identified by status codes in the 500-599 range. If the robots.txt file is undefined for a reasonably long period of time (for example, 30 days), crawlers MAY assume that the robots.txt file is unavailable as defined in Section 2.3.1.3 or continue to use a cached copy.

**2.3.1.5. Parsing Errors.** Crawlers MUST try to parse each line of the robots.txt file. Crawlers MUST use the parseable rules.

## `RFC9309-2.4` Section 2.4, Caching

Crawlers MAY cache the fetched robots.txt file's contents. Crawlers MAY use standard cache control as defined in [RFC9111]. Crawlers SHOULD NOT use the cached version for more than 24 hours, unless the robots.txt file is unreachable.

## `RFC9309-2.5` Section 2.5, Limits

Crawlers SHOULD impose a parsing limit to protect their systems; see Section 3. The parsing limit MUST be at least 500 kibibytes [KiB].

## `RFC9309-5` Section 5, Examples

### 5.1. Simple Example

    User-Agent: *
    Disallow: *.gif$
    Disallow: /example/
    Allow: /publications/

    User-Agent: foobot
    Disallow:/
    Allow:/example/page.html
    Allow:/example/allowed.gif

    User-Agent: barbot
    User-Agent: bazbot
    Disallow: /example/page.html

    User-Agent: quxbot

    EOF

### 5.2. Longest Match

The following example shows that in the case of two rules, the longest one is used for matching. In the following case, /example/page/disallowed.gif MUST be used for the URI example.com/example/page/disallow.gif.

    User-Agent: foobot
    Allow: /example/page/
    Disallow: /example/page/disallowed.gif

---

## Note on severity

RFC 9309 imposes duties on crawlers, not on site owners, so a robots.txt defect is not
itself a violation of this RFC. What the auditor reports is that a file **will not be
honoured the way its author intended**, citing the section that says so. Where that defect
also blocks Googlebot, the finding cites `GSE-TR-1` in
`reference/google/technical-requirements.md` and takes that provision's BLOCKING severity.
