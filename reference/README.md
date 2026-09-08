# reference/: the standards themselves

Everything in this folder is a published standard written by somebody else. None of it is
this project's opinion. Each file opens with a provenance table naming the publisher, the
source URL, the version, the date it was retrieved and the licence.

**Open any finding, open the provision it cites, read the two side by side.** That is what
this folder is for. If a finding cites something you cannot find here, the finding is wrong
and you should say so.

## What is here

| File | Standard | Publisher | Provision IDs |
|---|---|---|---|
| `google/technical-requirements.md` | Google Search technical requirements | Google | `GSE-TR-*` |
| `google/spam-policies.md` | Spam policies for Google web search | Google | `SPAM-*` |
| `google/structured-data-general-guidelines.md` | General structured data guidelines | Google | `SD-GEN-*` |
| `google/local-business-structured-data.md` | Local business (`LocalBusiness`) structured data | Google | `SD-LB-*` |
| `wcag/` (5 files, see `wcag/CONTEXT.md`) | WCAG 2.1, all 50 Level A and AA success criteria, plus Conformance Requirement 1 | W3C | `WCAG-*` |
| `state/ca/bpc-10140-8-ab-723.md` | Cal. Business and Professions Code section 10140.8 (AB 723, Chapter 497) | California Legislative Counsel | `CA-10140.8*` |
| `state/ca/10-ccr-2773.md` | 10 CCR 2773, licence identification in advertising | California Office of Administrative Law | `CA-2773*` |
| `state/ca/bpc-22575-caloppa.md` | Cal. B&P Code section 22575, CalOPPA | California Legislative Counsel | `CALOPPA-22575*` |
| `fair-housing/24-cfr-100-75.md` | 24 CFR 100.75, discriminatory advertising | US Dept of Housing and Urban Development | `FHA-100.75*` |
| `fcc/47-cfr-64-1200-consent.md` | 47 CFR 64.1200(f)(9), prior express written consent | US Federal Communications Commission | `TCPA-64.1200*` |
| `google/qualify-outbound-links.md` | Qualify your outbound links to Google | Google | `LINK-REL-*` |
| `bing/bing-webmaster-guidelines.md` | Bing Webmaster Guidelines | Microsoft | `BING-*` |
| `ai-crawlers/ai-crawler-docs.md` | The OpenAI, Anthropic and Perplexity crawler documentation | OpenAI, Anthropic, Perplexity | `AICRAWL-*` |
| `sitemaps/sitemaps-protocol-0-9.md` | Sitemaps XML protocol 0.9 | sitemaps.org | `SM-*` |
| `indexnow/indexnow-protocol.md` | IndexNow protocol | IndexNow | `INDEXNOW-*` |
| `fair-housing/24-cfr-109-20-rescinded.md` | **24 CFR 109.20, WITHDRAWN 1996.** Flags only, never a finding | HUD | `FHA-109.20-RESCINDED-*` |
| `ietf/rfc-9309-robots-exclusion-protocol.md` | RFC 9309, Robots Exclusion Protocol | IETF | `RFC9309-*` |
| `ietf/rfc-6797-hsts.md` | RFC 6797, HTTP Strict Transport Security | IETF | `HSTS-*` |

## How faithful these copies are

- **Nothing is paraphrased.** Every provision is the publisher's own wording.
- **Hyperlinks are flattened to plain text.** `[alt text](https://example.com)` becomes
  `alt text`. The words are untouched; only the link target is dropped, so the file reads
  offline.
- **Where a page is reproduced in part, the provenance table says exactly what was left out
  and why.** Three files are partial: the spam policies (the site reputation FAQ and worked
  examples, which only concern publishers hosting third-party content), the local business
  page (the Restaurant carousel, which is limited to a small set of restaurant providers),
  and RFC 9309 (Security Considerations, IANA Considerations, References and the ABNF
  grammar). Nothing any finding can cite was cut.
- **Four files are complete.** The technical requirements, the general structured data
  guidelines, AB 723 and the WCAG A/AA criteria are whole.
- **These copies are pinned in time.** Standards change. Each provenance table carries a
  retrieval date and, where the publisher gives one, the publisher's own last-updated date.
  Re-check against the source URL before relying on a finding in a dispute.

## Licences

- **Google Search Central documentation** is licensed under the
  [Creative Commons Attribution 4.0 License](https://creativecommons.org/licenses/by/4.0/).
  Source: https://developers.google.com/search. Content reproduced here under that licence.
  Not endorsed by Google.
- **WCAG 2.1** is a W3C Recommendation, copyright W3C, reproduced under the
  [W3C Software and Document Licence](https://www.w3.org/copyright/software-license-2023/).
  Source: https://www.w3.org/TR/WCAG21/. Not endorsed by W3C.
- **RFC 9309** is copyright (c) 2022 IETF Trust and the persons identified as the document
  authors, subject to BCP 78 and the IETF Trust's Legal Provisions
  (https://trustee.ietf.org/license-info). Not endorsed by the IETF.
- **California statutes and regulations** are public records and are not subject to copyright.
- **United States federal regulations** in the Code of Federal Regulations are public records
  and are not subject to copyright.

## What is not here, on purpose

This auditor does not check every rich result type. It covers `LocalBusiness` and nothing
else, so `BreadcrumbList`, `FAQPage`, `Article`, `Product` and the rest are out of scope and
their required-property tables are deliberately absent. If a page carries markup this folder
does not cover, the auditor reports NOT COVERED rather than guessing.
