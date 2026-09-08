# Stage 05: Is the robots.txt valid

Standard this stage enforces: ``reference/ietf/rfc-9309-robots-exclusion-protocol.md``

## Inputs

| Source | File/Location | Section/Scope | Why |
|---|---|---|---|
| Standard | `../../reference/ai-crawlers/ai-crawler-docs.md` | Full file | The bot names and each publisher's stated consequence for blocking one |
| Standard | `../../reference/bing/bing-webmaster-guidelines.md` | `BING-8` and `BING-10` only | Bingbot crawl access and the meta directives |
| Standard | `../../reference/sitemaps/sitemaps-protocol-0-9.md` | Full file | The sitemap declared in robots.txt |
| Standard | `../../reference/indexnow/indexnow-protocol.md` | Full file | Whether a key file is hosted. Absence is never a failure |
| Standard | `../../reference/ietf/rfc-9309-robots-exclusion-protocol.md` | Sections 2.1 to 2.5 | What a valid robots.txt is |
| Standard | `../../reference/google/technical-requirements.md` | `GSE-TR-1` row only | When a robots defect becomes a blocking defect |

## Process

1. Parse the file into groups. A group is one or more user-agent lines followed by rules.
2. Flag any rule that precedes the first user-agent line. Cite `RFC9309-2.2.2`.
3. Find the group that applies to Googlebot. Remember `RFC9309-2.2.1`: a named group beats the `*` group, it does not add to it. A permissive `*` group does not rescue a restrictive `Googlebot` group.
4. If the applicable group disallows a page you were given, that is a `GSE-TR-1` finding at BLOCKING, not an RFC finding.
5. Cross-check any `Sitemap:` record against the files supplied. A sitemap named but not supplied is INSUFFICIENT EVIDENCE.

## Outputs

| Artifact | Location | Format |
|---|---|---|
| robots findings | `output/<run>/05-crawler-access.md` | Findings plus a nine row ledger |

## Audit

Run before writing to `output/`. If a check fails, revise first.

| Check | Pass Condition |
|---|---|
| RFC findings are ADVISORY | RFC 9309 binds crawlers, not site owners. A malformed file is reported as not doing what its author intended, never as a penalty |
