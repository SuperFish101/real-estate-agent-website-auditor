# Audit: samples/live-agent-ca-2/ (a real California licensee, identity removed)

| | |
|---|---|
| Audited | 2026-09-06 |
| Artifact | `samples/live-agent-ca-2/` |
| Captured | 2026-09-06 by `curl`, **HTTP 200**, recorded in `NOTES.md` |
| Files read | `index.html` (976 lines), `robots.txt` (13), `sitemap_index.xml` (7), `page-sitemap.xml` (59), `style.css`, `manifest.md`, `NOTES.md` |
| Jurisdiction | **California**, settled by the eight digit CA DRE number on the page |
| Browser mode | **Run.** Chromium via Playwright, at 1280x900 and 320x800. Every number is in `03b-render.md` |
| Standards | Those registered in `reference/README.md`, at the retrieval dates in their provenance tables |

> **This run is against a real website, published with the identity removed.** The site is a
> real California real estate licensee's site, captured on the date above at the HTTP status
> shown. The domain, the licensee's name, both brokerage names, the licence number, the phone
> numbers, the email addresses and the street address have been replaced with placeholders of
> the same shape. The markup, the line numbers and every defect are exactly as they were found.
> **The redaction is deliberate.** The owner did not ask to be audited, and publishing a named
> criminal-liability finding against a business that never asked for one would be wrong, whether
> or not the finding is correct. The method is `method/anonymising-a-run.md`.
>
> **This run goes past that method in two places, and says so.** The city name and the
> achievement statistics were replaced as well, because the method's own check 4 search test
> failed without it. `NOTES.md` records both, and the state, which is the only fact the audit
> needs, is untouched.

---

## 1. Summary

| Severity | Findings |
|---|---|
| LEGAL | 1 |
| BLOCKING | 0 |
| ACCESS | 2 |
| ELIGIBILITY | 2 |
| ADVISORY | 0 |
| **Total** | **5** |

Plus 4 queries resolved as INSUFFICIENT EVIDENCE rather than issued as findings, and 1 that a
browser measurement cleared before it could become a finding.

**This page is indexable, fast to reach and honest about who it belongs to.** Its licence number
is present, at the right length, larger than the smallest type on the page, and the responsible
broker is named. Nothing was found that would keep it out of search results. Its problems are a
missing privacy policy, two structured data blocks that no parser can read, and two keyboard
defects. An audit that manufactured alarm here would be a worse document than this one.

### One thing that is not a finding, and why

The copy on this page repeats its market phrases hard: "real estate agent in Example City" seven
times, "realtors in Example City" and "sell my home in Example City" five times each, 46 mentions
of the city in 1,662 words. That is the pattern people mean when they say keyword stuffing.
**It is not issued as a finding**, because `rules.md` section 6 says a spam FAIL is only allowed
where the artifact matches one of Google's own listed examples almost word for word, and this
does not. Google's example is a block of text repeating a phrase with no other purpose. This is
ordinary local marketing copy written around a phrase list. The verdict is INSUFFICIENT EVIDENCE
and section 4 says what would settle it. A false spam accusation against a real business is the
worst output this auditor can produce, so the bar stays where it is.

---

## 2. Findings

### LEGAL

```
F-001   LEGAL
Provision : CALOPPA-22575(a)-POSTED
            (reference/state/ca/bpc-22575-caloppa.md:46)
Provision text
  "shall conspicuously post its privacy policy on its Web site"
Location  : samples/live-agent-ca-2/index.html:966 (the footer block)
Observed  : A case-insensitive search for "privacy" across the whole of
            index.html returns 0 hits. Not a link, not a heading, not a
            sentence. The footer carries the business name, the address, the
            licence number, the phone number, the email address and six social
            icons, and nothing else.
Verdict   : FAIL
Why       : `CALOPPA-22575(a)-COLLECTS` is met. The page presents two lead
            capture forms to the visitor, headed "Would You Like a
            Professional Estimate of Your Home Value? Please fill out the form
            below." and "Send me a message!". The obligation therefore
            applies. Nothing is posted. This is not a question of whether the
            link is prominent enough; there is no link.
Fix       : Publish a privacy policy and link to it from the footer of every
            page, with link text reading "Privacy Policy".
See also  : none. `CALOPPA-22575(a)-CONSPICUOUS` is not reached, because
            nothing is posted for the manner of posting to be judged.
Not legal advice. This reproduces a statute and reports whether the artifact
matches its text.
```

### ACCESS

```
F-002   ACCESS
Provision : WCAG-2.1.1  (reference/wcag/2-operable.md:24)
Provision text
  "All functionality of the content is operable through a keyboard interface
   without requiring specific timings for individual keystrokes."
Location  : samples/live-agent-ca-2/index.html:936, col 48647 and the three
            <summary> elements that follow it on the same line
Observed  : Four of the five FAQ <summary> elements carry tabindex="-1".
            Measured in the browser: element.tabIndex is -1 for Q2, Q3, Q4 and
            Q5, and 0 for Q1. Recorded in 03b-render.md, "Elements visible on
            the page but outside the tab order".
Verdict   : FAIL
Why       : A tabindex of -1 removes an element from the sequential keyboard
            navigation order. Each of these <summary> elements is the only
            control that opens its own answer, so a keyboard user can open the
            first FAQ answer and cannot reach the other four. The content
            behind them is not available by any other keyboard route on this
            page.
Fix       : Remove tabindex="-1" from the four <summary> elements. A <summary>
            is keyboard operable by default and needs no tabindex at all.
See also  : none.
```

```
F-003   ACCESS
Provision : WCAG-2.4.7  (reference/wcag/2-operable.md:223)
Provision text
  "Any keyboard operable user interface has a mode of operation where the
   keyboard focus indicator is visible."
Location  : samples/live-agent-ca-2/index.html:936, col 44060 ("Work With
            Agent", hero)
            samples/live-agent-ca-2/index.html:936, col 45993 ("Work With
            Agent", second)
            samples/live-agent-ca-2/index.html:936, col 46180 ("Visit Past
            Sales")
Observed  : All three carry class "button_medium border_b button_settings".
            Computed style read unfocused and then focused, on the same
            element, in the same page load:
              unfocused  outline-style: none, outline-width: 3px,
                         box-shadow: none, border: 2px solid rgb(68,127,135)
              focused    outline-style: none, outline-width: 3px,
                         box-shadow: none, border: 2px solid rgb(68,127,135)
            Identical. Recorded in 03b-render.md.
Verdict   : FAIL
Why       : outline-style is "none" in both states, so no outline is painted
            in either, and no other property changes. A keyboard user tabbing
            onto these three buttons gets no visual signal that they have
            arrived. Twenty-one of the twenty-four focusable elements on this
            page do show an indicator, so this is three specific buttons, not
            a site-wide defect.
Fix       : Delete the rule that sets outline: none on
            .button_settings:focus, or replace it with a visible
            :focus-visible style such as a 2px outline in the same teal.
See also  : none.
```

### ELIGIBILITY

```
F-004   ELIGIBILITY
Provision : SD-GEN-FORMAT-1
            (reference/google/structured-data-general-guidelines.md:156)
Provision text
  "In order to be eligible for rich results, mark up your site's pages using
   one of three supported formats: JSON-LD (recommended), Microdata, RDFa"
Location  : samples/live-agent-ca-2/index.html:849
Observed  : The RealEstateAgent block does not parse as JSON. A property is
            stranded outside the closing brace:
                }
              "hasMap": "https://www.google.com/maps?cid=1000..."
            json.loads reports: Extra data: line 39 column 1 (char 1047).
Verdict   : FAIL
Why       : A block that is not valid JSON is not JSON-LD, and none of the
            three supported formats is present for this item. Every property
            in it is lost, including the name and the address, so the item
            cannot be eligible for a Local Business rich result. This is the
            block carrying the business name, address, telephone, geo,
            opening hours and price range.
Fix       : Move the "hasMap" property inside the object, before the closing
            brace, and add the comma the previous property needs.
See also  : F-005, a second unparseable block on the same page.
```

```
F-005   ELIGIBILITY
Provision : SD-GEN-FORMAT-1
            (reference/google/structured-data-general-guidelines.md:156)
Provision text
  "In order to be eligible for rich results, mark up your site's pages using
   one of three supported formats: JSON-LD (recommended), Microdata, RDFa"
Location  : samples/live-agent-ca-2/index.html:870
Observed  : An HTML element is embedded inside the JSON:
              "@type": "FAQPage",<span data-mce-type="bookmark" style="display:
              inline-block; width: 0px; ..." class="mce_SELRES_start">...</span>
            json.loads reports: Expecting property name enclosed in double
            quotes: line 3 column 21 (char 58).
Verdict   : FAIL
Why       : Same provision, different cause, so it is reported separately
            rather than stacked onto F-004. A stray editor bookmark span was
            saved into the script block by the page editor. The block is not
            parseable JSON and so is not JSON-LD.
Fix       : Delete the <span data-mce-type="bookmark"> element from inside the
            script block. It is an artifact of the visual editor and has no
            purpose in the page.
See also  : F-004.
Note      : FAQPage is NOT COVERED by this auditor, because its required
            property table is not in reference/. This finding is about the
            block being unparseable, which SD-GEN-FORMAT-1 covers for any
            structured data of any type.
```

---

## 3. The full provision ledger

Every provision this auditor holds, with its verdict and the reason in the row.

### Stage 01, freshness of the reference set

| Standard | Verdict | Reason |
|---|---|---|
| 15 of 23 vendored standards | PASS | `./check-standards-freshness.sh` compared each against its live source on 2026-09-06 and found the canary text unchanged |
| The 5 WCAG files | PASS | w3.org returns HTTP 403 to `curl`, so the canaries were checked by hand in the browser. All five present. The page reads "W3C Recommendation 06 May 2025" and carries no superseded notice |
| `state/ca/bpc-22575-caloppa.md` | PASS | Justia returns HTTP 403 even to a browser. The canary "shall conspicuously post its privacy policy on its Web site" was confirmed instead against the official California Legislative Counsel text at leginfo.legislature.ca.gov, last amended Stats. 2013 Ch. 390 (AB 370) |
| `bing/bing-webmaster-guidelines.md` | PASS | A JavaScript application that returns nothing to `curl`. Opened in the browser: the "Webmaster Guidelines" heading and the abuse list are both present |
| `fair-housing/24-cfr-109-20-rescinded.md` | NOT APPLICABLE | Withdrawn from the CFR on 1 May 1996. Vendored as rescinded, for Tier B flags only. It can never produce a finding, and it produced none here |

Stale: 0. Withdrawn: 0. Unreachable: 0. **The audit was allowed to proceed.**

### Stage 02, jurisdiction

| Provision | Verdict | Reason |
|---|---|---|
| Which state pack | California | The page carries an eight digit number presented as "License #01885544", which is the CA DRE format, and the address gives a California region. No other state's rules are loaded, read or listed |

### Stage 04, can this page be indexed

| Provision | Verdict | Reason |
|---|---|---|
| `GSE-TR-1` | PASS | robots.txt blocks `/wp-admin/`, `/wp-includes/`, `/wp-content/plugins/`, `/wp-content/themes/`, `/wp-content/cache/`, `/wp-json/`, `/author/`, `/feed/` and `/category/*/feed/`. None of those match `/`, so Googlebot is not blocked from the page under audit |
| `GSE-TR-2` | PASS | The live capture returned HTTP 200, recorded in `NOTES.md`. A saved file carries no status code, so without that record this row would be INSUFFICIENT EVIDENCE |
| `GSE-TR-3` | PASS | 1,662 words of visible text, headings, links and a title. There is indexable content |
| `GSE-TR-INDEXABLE-A` | PASS | `text/html`, a file type Google Search supports |
| `GSE-TR-INDEXABLE-B` | INSUFFICIENT EVIDENCE | Depends on the spam pass in stage 08, which resolved to INSUFFICIENT EVIDENCE on `SPAM-KEYWORD-STUFFING`. Nothing else in the spam policies is engaged |
| `<meta name="robots">` | PASS | Reads `follow, index, max-snippet:-1, max-video-preview:-1, max-image-preview:large` at `index.html:676`. It asks to be indexed |
| `<link rel="canonical">` | PASS | Self-referencing, `index.html:676`. Consistent with `og:url` |

### Stage 05, crawler access

| Provision | Verdict | Reason |
|---|---|---|
| `RFC9309-2.2.1` | PASS | One group, `User-agent: *`. The product token contains only permitted characters |
| `RFC9309-2.2.2` | PASS | Nine `Disallow` lines and one `Allow` line, each with a path starting at the first octet. The `Allow: /wp-admin/admin-ajax.php` line sits after a blank line, which was checked deliberately: the RFC does not make a blank line terminate a group, and Section 2.2.4 forbids other records from doing so, so the Allow rule is inside the `*` group and works |
| `RFC9309-2.2.3` | PASS | One wildcard, `Disallow: /category/*/feed/`. `*` is a character crawlers MUST support |
| `RFC9309-2.2.4` | PASS | One `Sitemap:` record, which is an "other record" and correctly does not terminate the group |
| `RFC9309-2.3` | PASS | Served at `/robots.txt` on the same host |
| `SM-REQ-urlset` | PASS | `page-sitemap.xml` opens `<urlset>` with the 0.9 namespace and closes it |
| `SM-REQ-loc` | PASS | Every `<url>` carries a `<loc>` child |
| `SM-FILE-4` | PASS | Every `<loc>` in both sitemap files is on the one host |
| `SM-FILE-6` | PASS | Well under 50,000 URLs and 50MB |
| `SM-OPT-lastmod` | PASS | Present on every entry. Absence would never have been a failure |
| `SM-OPT-changefreq`, `SM-OPT-priority` | NOT APPLICABLE | Absent, and absence is never a failure for an optional tag |
| `INDEXNOW-VERIFY-2` | NOT APPLICABLE | No `{key}.txt` file in the artifact and none named in `NOTES.md`. IndexNow is optional and no publisher requires it. `BING-4` says adopting it would tell Bing about changes faster |
| `INDEXNOW-KEY-1` | NOT APPLICABLE | Not reached. There is no key file to be malformed |
| `AICRAWL-OPENAI-OAI-SearchBot`, `AICRAWL-ANTHROPIC-Claude-SearchBot`, `AICRAWL-PERPLEXITY-PerplexityBot` | PASS | robots.txt names no assistant, so the `*` group applies and none of the three search-and-answer bots is blocked from the page. The outcome was inherited rather than chosen, which is worth knowing and is not a defect |
| `AICRAWL-OPENAI-GPTBot`, `AICRAWL-ANTHROPIC-ClaudeBot` | PASS | Not blocked. These are training crawlers; blocking them costs nothing in visibility and is a preference either way, so this row reports and does not grade |
| `AICRAWL-OPENAI-ChatGPT-User`, `AICRAWL-ANTHROPIC-Claude-User`, `AICRAWL-PERPLEXITY-Perplexity-User` | PASS | Not blocked. Two of the three publishers state robots.txt may not apply to user-initiated fetches anyway, so a rule here would not be a reliable block |
| `BING-2`, `BING-3` | PASS | An XML sitemap exists, is declared in robots.txt, lists canonical URLs and carries `lastmod` |
| `BING-10` | PASS | robots.txt and the meta robots tag do not contradict each other |
| `HSTS-5.1` | Reported, not graded | The page was served over HTTPS and the captured response carried **no** `Strict-Transport-Security` header. RFC 6797 obliges no site to adopt HSTS, so this is an observation, not a failure |
| `HSTS-6.1.1`, `HSTS-6.1.2` | NOT APPLICABLE | Not reached. There is no header to inspect |

### Stage 06, structured data

| Provision | Verdict | Reason |
|---|---|---|
| `SD-GEN-FORMAT-1` | **FAIL** | Two of the three JSON-LD blocks on the page do not parse as JSON, so they are not JSON-LD. **F-004**, **F-005** |
| `SD-GEN-ACCESS-1` | PASS | Nothing blocks the structured data from Googlebot. No `noindex`, no robots.txt rule reaching this page |
| `SD-GEN-CONTENT-4` | PASS | The one block that does parse describes the person, the site and the page, all of which are visible |
| `SD-GEN-RELEVANCE-1` | PASS, with an observation | The parseable block is a true representation. Worth noting for a person: the unparseable `RealEstateAgent` block states one sales figure in its `description` and the page's own statistics block states a larger one. Both are visible on the page, so this is an internal inconsistency in the copy rather than a markup violation, and no provision covers it |
| `SD-GEN-COMPLETENESS-1` | Not reached | The `RealEstateAgent` block does not parse, so it has no properties for a parser to find missing. The root defect is F-004 and stacking a second finding on it would inflate the count |
| `SD-GEN-LOCATION-1` | PASS | The markup is on the page it describes |
| `SD-GEN-SPECIFICITY-1` | PASS | `RealEstateAgent` is the most specific applicable schema.org type |
| `SD-LB-SUBTYPE` | PASS | `RealEstateAgent` is a `LocalBusiness` sub-type, which is what this provision asks for |
| `SD-LB-REQ-name`, `SD-LB-REQ-address` | Not reached | Both strings are present in the block's text, but the block does not parse, so no parser sees either. Fixing F-004 makes this row checkable |
| `SD-LB-REC-telephone`, `-url`, `-geo`, `-openingHoursSpecification`, `-priceRange` | Not reached | Same reason. All five strings are present in the unparseable block |
| `SD-LB-REC-aggregateRating`, `SD-LB-REC-review` | NOT APPLICABLE | Recommended **only for sites that capture reviews about other local businesses**. This site publishes testimonials about itself, which is not that, and it does not mark them up as `aggregateRating`. That is the correct choice and it is worth saying so |
| `SD-LB-GUIDE-1` | Not reached | Depends on the general guidelines, which F-004 and F-005 break |
| FAQPage markup | NOT COVERED | Real, and outside the standards in `reference/`. The `FAQPage` required property table is deliberately absent. Google's FAQ rich result documentation would cover it |


### Stage 07, accessibility, WCAG 2.1 Level A and AA

Browser mode was run, so **34 of the 50 criteria are reachable** on this page rather than 20.

| Criterion | Verdict | Reason |
|---|---|---|
| `WCAG-1.1.1` Non-text Content | PASS | 5 rendered `<img>` elements. None is missing an `alt` attribute. Three carry `alt=""`: the header logo and two 1x1 base64 lazy-load placeholders, all correctly marked decorative. No link on the page has an image as its only content, and no link is without accessible text |
| `WCAG-1.2.1` to `WCAG-1.2.5` | NOT APPLICABLE | No audio and no video on the page. `document.querySelectorAll('video,audio')` returns none |
| `WCAG-1.3.1` Info and Relationships | REQUIRES HUMAN | Browser mode found one rendered `<h2>` with no text content, and a heading order that opens with three H3s holding contact details before any H2 appears. The empty heading is generated after parse, so it has no source line. A person has to decide whether these convey a structure that is not there |
| `WCAG-1.3.2` Meaningful Sequence | PASS | DOM order and visual order agree over the traversed part of the page. No CSS `order`, float or absolute positioning was found moving content away from its source position |
| `WCAG-1.3.3` Sensory Characteristics | REQUIRES HUMAN | Needs a person to read the copy for instructions that depend on shape, size or position |
| `WCAG-1.3.4` Orientation | PASS | Resized to 320x800 and back. No CSS transform and no message locks one orientation |
| `WCAG-1.3.5` Identify Input Purpose | REQUIRES HUMAN | The page's own search field collects no personal data, so the criterion does not reach it. The two fields that would be in scope are inside cross-origin iframes and were not read |
| `WCAG-1.4.1` Use of Color | REQUIRES HUMAN | Whether colour alone carries meaning is a judgement, not a measurement |
| `WCAG-1.4.2` Audio Control | NOT APPLICABLE | Nothing plays automatically. No audio or video element exists |
| `WCAG-1.4.3` Contrast (Minimum) | PASS | 82 text elements measured. **0 below the threshold, 32 above it, 50 could not be computed** because the text sits over a photograph. The lowest passing ratio is 4.53 against a required 4.5. Numbers in `03b-render.md` |
| `WCAG-1.4.4` Resize Text | PASS | Root font size set to 200 percent. `scrollWidth` stayed 1280 against a `clientWidth` of 1280, so no horizontal scrolling appeared |
| `WCAG-1.4.5` Images of Text | REQUIRES HUMAN | A person has to look at the images to say whether any is a picture of text |
| `WCAG-1.4.10` Reflow | PASS | At a 320 pixel viewport, `document.documentElement.scrollWidth` is 320. The elements that extend past it are carousel slides, which scroll inside their own container |
| `WCAG-1.4.11` Non-text Contrast | REQUIRES HUMAN | Which graphics are needed to understand the content is a judgement. The one form control on the page is the search field |
| `WCAG-1.4.12` Text Spacing | REQUIRES HUMAN | The criterion's four overrides were applied and produced no horizontal overflow. Eight boxes then clipped: seven are 1px visually hidden spans where clipping loses nothing, and the eighth is the hero, `scrollHeight` 1350 against `clientHeight` 900. Whether the hero loses content needs a person to look |
| `WCAG-1.4.13` Content on Hover or Focus | REQUIRES HUMAN | Dismissible, hoverable and persistent are three judgements, not three measurements |
| `WCAG-2.1.1` Keyboard | **FAIL** | Four of the five FAQ accordions carry `tabindex="-1"` and cannot be reached by keyboard, so four answers cannot be opened. **F-002** |
| `WCAG-2.1.2` No Keyboard Trap | PASS | Twelve Tab presses moved through twelve distinct elements in DOM order with no element repeating and no focus stuck |
| `WCAG-2.1.4` Character Key Shortcuts | REQUIRES HUMAN | Single character shortcuts are registered in ways no script can enumerate reliably |
| `WCAG-2.2.1` Timing Adjustable | NOT APPLICABLE | No time limit is set by the content. No meta refresh, no session timer in the markup |
| `WCAG-2.2.2` Pause, Stop, Hide | REQUIRES HUMAN | Eight animations run with `iterations: Infinity` at 1000ms each, and no pause, stop or hide control exists anywhere on the page. All eight target `div.line_title`, which is a decorative rule under a heading. Whether a decorative line is "information" within the meaning of this criterion is the judgement, and it is a person's to make. The numbers are recorded either way |
| `WCAG-2.3.1` Three Flashes | REQUIRES HUMAN | A person has to watch the page |
| `WCAG-2.4.1` Bypass Blocks | REQUIRES HUMAN | There is no skip link and no `<main>` landmark. There are two `<nav>` landmarks and thirty headings. Headings are a sufficient technique for this criterion, so the question is whether this page's heading structure is usable as a bypass mechanism given that it opens with three H3s and contains an empty H2. That is a person's call |
| `WCAG-2.4.2` Page Titled | PASS | `<title>` at `index.html:1` reads "Alex Agent Real Estate Agent \| Leading Realtor in Example City, CA". It describes both topic and purpose |
| `WCAG-2.4.3` Focus Order | PASS | Over twelve Tab presses, focus visited elements in DOM order. Recorded element by element in `03b-render.md` |
| `WCAG-2.4.4` Link Purpose (In Context) | PASS | Every link has accessible text. The three "Work With Agent" links all point at the same `#contact` target, so the repeated text is not ambiguous |
| `WCAG-2.4.5` Multiple Ways | PASS | A navigation menu, a search form and in-page anchor links. More than one way to locate a page |
| `WCAG-2.4.6` Headings and Labels | REQUIRES HUMAN | Thirty headings, one of them empty. Whether the rest describe their topic is a reading judgement |
| `WCAG-2.4.7` Focus Visible | **FAIL** | Three of the twenty-four visible focusable elements show no computed change of any kind when focused. **F-003** |
| `WCAG-2.5.1` Pointer Gestures | REQUIRES HUMAN | Handlers registered in ways no script can enumerate reliably |
| `WCAG-2.5.2` Pointer Cancellation | REQUIRES HUMAN | Same |
| `WCAG-2.5.3` Label in Name | REQUIRES HUMAN | The visible label and the accessible name must be compared by a person for the controls that have both |
| `WCAG-2.5.4` Motion Actuation | REQUIRES HUMAN | Same as 2.5.1 |
| `WCAG-3.1.1` Language of Page | PASS | `<html lang="en-US">`, read from the rendered document |
| `WCAG-3.1.2` Language of Parts | PASS | Exactly one element on the page carries a `lang` attribute, the `<html>` element, and no passage in another language was found |
| `WCAG-3.2.1` On Focus | PASS | Focus was moved onto every visible focusable element in turn. `location.href` and `window.length` did not change |
| `WCAG-3.2.2` On Input | INSUFFICIENT EVIDENCE | The only field on the page that can be typed into is the search box. The two lead forms are cross-origin and their inputs cannot be driven from here |
| `WCAG-3.2.3` Consistent Navigation | NOT APPLICABLE | One page was supplied. Consistency across pages needs more than one page |
| `WCAG-3.2.4` Consistent Identification | NOT APPLICABLE | Same reason |
| `WCAG-3.3.1` Error Identification | INSUFFICIENT EVIDENCE | The forms that would produce errors are inside cross-origin iframes. Submitting them was not possible and would not have been appropriate against a real business's lead inbox |
| `WCAG-3.3.2` Labels or Instructions | REQUIRES HUMAN | The search input at `index.html:867` is `<input type="search" placeholder="Search" value="" name="s">`. No `<label>`, no `aria-label`, no `title`. A placeholder is an instruction that disappears as soon as the user types, and whether that is sufficient here is a judgement rather than a measurement |
| `WCAG-3.3.3` Error Suggestion | INSUFFICIENT EVIDENCE | Same reason as 3.3.1 |
| `WCAG-3.3.4` Error Prevention (Legal, Financial, Data) | REQUIRES HUMAN | Needs a person to decide whether a home valuation enquiry is a legal or financial commitment |
| `WCAG-4.1.1` Parsing | PASS | The document parsed into a DOM with no fatal error. Note that this criterion was removed in WCAG 2.2; it is graded here because this auditor holds WCAG 2.1, and it is a PASS either way |
| `WCAG-4.1.2` Name, Role, Value | REQUIRES HUMAN | The accessibility snapshot gives a computed name for every custom control on the page. Whether each name is meaningful is a person's judgement, as it is from source |
| `WCAG-4.1.3` Status Messages | INSUFFICIENT EVIDENCE | The page has zero `[role=status]`, `[role=alert]` or `[aria-live]` regions. Whether a status message is ever produced cannot be established, because the forms that would produce one are cross-origin |
| `WCAG-CONFORMANCE-5.2.1` | **NOT MET** | Level AA conformance requires that the page satisfies all Level A and Level AA success criteria. Two do not: `WCAG-2.1.1` and `WCAG-2.4.7`. One failure is enough |

### Stage 07, spam policies

| Provision | Verdict | Reason |
|---|---|---|
| `SPAM-KEYWORD-STUFFING` | INSUFFICIENT EVIDENCE | The copy repeats its market phrases hard: 46 mentions of the city in 1,662 words, "real estate agent in Example City" seven times, "realtors in Example City" and "sell my home in Example City" five times each. It does **not** match Google's own listed example, which is a block of text repeating a phrase with no other purpose, and the policy is defined by intent, which cannot be read from a file. What would settle it: the page owner or their writer saying whether the phrases were placed to rank rather than to inform |
| `SPAM-CLOAKING` | PASS | The rendered text and the source text are the same. Nothing is served differently to a crawler |
| `SPAM-HIDDEN-TEXT` | PASS | The only visually hidden text is in `span.elementor-screen-only` elements that give social icons an accessible name, which is an accessibility technique and not a ranking one |
| `SPAM-DOORWAYS` | NOT APPLICABLE | One page was supplied. A doorway finding needs the set of near-duplicate pages it describes |
| `SPAM-SCALED-CONTENT` | INSUFFICIENT EVIDENCE | Whether the copy was generated at scale cannot be read from one page, and the policy turns on intent |
| `SPAM-LINK-SPAM` | PASS | Fourteen internal links and eight outbound, all to the licensee's own social profiles, Zillow profile and Google Maps listing. No link scheme pattern |
| `SPAM-SCRAPING` | PASS | The content is original to this site |
| `SPAM-THIN-AFFILIATION` | NOT APPLICABLE | No affiliate links |
| `SPAM-SNEAKY-REDIRECTS` | PASS | No redirect in the markup. The live capture followed no redirect to reach the page |
| `SPAM-MISLEADING-FUNCTIONALITY` | PASS | Every control does what its label says |
| `SPAM-SCAM-FRAUD` | PASS | Nothing on the page impersonates another party or solicits money under a false premise |
| `SPAM-EXPIRED-DOMAINS`, `SPAM-HACKED-CONTENT`, `SPAM-MACHINE-TRAFFIC`, `SPAM-MALICIOUS`, `SPAM-POLICY-CIRCUMVENTION`, `SPAM-SITE-REPUTATION`, `SPAM-USER-GENERATED` | NOT APPLICABLE | None is engaged by a single-page artifact with no third party content, no user submissions and no injected markup |

### Stage 08, licence and broker, California pack

| Provision | Verdict | Reason |
|---|---|---|
| `CA-2773(a)(3)` | Applies | This is the licensee's own site, which is what makes it solicitation material under the rule at all |
| `CA-2773(b)` | NOT APPLICABLE | The exception covers signs only. A website is never exempt under it |
| `CA-2773(a)-LICENSE` | PASS | "License #01885544" at `index.html:966`. Eight digits, presented as a licence number |
| `CA-2773(a)-BROKER` | PASS, with a note | A brokerage name appears in the body copy at `index.html:936`. Whether that name matches the responsible broker's currently licensed name is REQUIRES HUMAN and is settled at `www2.dre.ca.gov`. Worth a person's eye: the footer block that carries the licence number names the licensee's own business rather than the brokerage, and the brokerage is named only in a marketing paragraph further up the page |
| `CA-2773(a)-EACH` | PASS | One licensee is named on the page, and one licence number is disclosed. The counts match |
| `CA-2773(a)-TYPESIZE` | PASS | Measured in the browser. The licence number renders at **16px**. The smallest visible type anywhere on the page is **11px**, the copyright line. 16 is not smaller than 11. Recorded in `03b-render.md` |

### Stage 09, listing images, California pack

**Pass A, which needs no manifest and always runs.**

| Reading | Value |
|---|---|
| `<img>` elements on the page | **9** |
| Alteration disclosure wording anywhere in the visible text | **none** |
| A link to unaltered originals | **none** |

Searched for: "has been altered", "digitally altered", "virtually staged", "virtual staging",
"generative AI", "AI-generated", "computer generated", "rendering", "for illustrative purposes",
"added digitally" and eleven further variants. Zero hits.

**The result of pass A, in one sentence.** This page carries nine images, contains no alteration
disclosure of any kind, and links to no unaltered originals. **If any one of those nine images
was digitally altered, this page does not meet `CA-10140.8(a)(1)` today.** That is a finished
answer to the half of this stage the page can answer on its own.

**Pass B, which needs the manifest.**

| Provision | Verdict | Reason |
|---|---|---|
| `CA-10140.8(b)(1)`, `CA-10140.8(b)(2)` | INSUFFICIENT EVIDENCE | `manifest.md` is present and every row says UNKNOWN, because the owner was never asked how any image was made. Without that fact no image can be classified as altered or excluded. What would settle it: one sentence per image from whoever made the site |
| `CA-10140.8(a)(1)-STATEMENT`, `-CONSPICUOUS`, `-LINK`, `-POINTER`, `CA-10140.8(a)(2)` | Conditional, resolved by pass A | Each obligation bites only on an image classified as altered. None has been classified, so no finding is issued. **But pass A has already established that if any is altered, all five are unmet**, because there is no disclosure and no link anywhere on the page to satisfy them |
| Exposure, not a finding | | This page carries no photograph of a property. It carries a portrait, a logo, badges and decorative backgrounds. AB 723 is about images of real property, so the practical exposure here is small. That is worth knowing and it does not clear any image |

### Stage 10, fair housing

**This stage issues no verdict, ever. It flags and hands to a person.**

| Flag | What was found | What a person must do |
|---|---|---|
| `FHA-100.75(c)(1)` Tier A wording scan | One flag. The word "family" appears once in visible text, inside a client testimonial: "We've already recommended her to our friends and family and we'd work with her again in a heartbeat." | Read it in place. On its face this describes a referral, not a preference about who may buy a dwelling, and it is a quotation from a client rather than the licensee's own advertising copy. **This auditor does not say it is fine. A person decides** |
| `FHA-100.75(a)`, `FHA-100.75(b)`, `FHA-100.75(c)(3)` | No flags raised by the wording scan | These provisions reach oral statements and media selection as well as page text, neither of which is in this artifact |
| `FHA-109.20-RESCINDED` word list | Run as a Tier B flag only | 24 CFR Part 109 was withdrawn from the CFR on 1 May 1996. It cannot produce a finding and it produced none |

### Stage 11, privacy and consent

| Provision | Verdict | Reason |
|---|---|---|
| `CALOPPA-22575(a)-COLLECTS` | Met | The page presents two lead capture forms to the visitor, headed "Would You Like a Professional Estimate of Your Home Value?" and "Send me a message!", and both iframes carry titles naming them. The obligation applies |
| `CALOPPA-22575(a)-POSTED` | **FAIL** | A case-insensitive search for "privacy" across the whole page returns zero hits. Nothing is posted. **F-001** |
| `CALOPPA-22575(a)-CONSPICUOUS` | Not reached | The manner of posting cannot be judged when nothing is posted. Fixing F-001 makes this row checkable |
| `TCPA-64.1200(f)(9)-SCOPE` | INSUFFICIENT EVIDENCE | Both forms are `<iframe>` elements on `api.leadconnectorhq.com` at `index.html:936` and `index.html:951`. Their fields are cross-origin and were not captured, so whether either captures a telephone number cannot be established from this artifact. What would settle it: a screenshot of each form, or the field list from the form provider |
| `TCPA-64.1200(f)(9)-AGREEMENT` | INSUFFICIENT EVIDENCE | Same reason. Not reached until scope is settled |
| `TCPA-64.1200(f)(9)(i)(A)`, `(i)(B)`, `TCPA-64.1200(f)(3)` | INSUFFICIENT EVIDENCE | Same reason. **This is the most important gap in this run.** The equivalent checks on the other California run in `output/` produced two LEGAL findings, and they could only be made because that page's form markup was readable. Here it is not, so nothing is claimed either way |

### Stage 12, link integrity

| Provision | Verdict | Reason |
|---|---|---|
| `LINK-REL-sponsored` | NOT APPLICABLE | The artifact identifies no link as paid, sponsored or an advertisement |
| `LINK-REL-ugc` | NOT APPLICABLE | No comment or review block with links in it. The testimonials contain no links |
| `LINK-REL-nofollow` | Reported, never required | One link carries `nofollow`: the Zillow profile link, `rel="nofollow noopener"` |
| `LINK-REL-NONE` | Reported as a note | That Zillow link is an ordinary link to the licensee's own profile carrying `nofollow` for no stated reason. It is a choice, not a defect, and it is named here only so the owner knows it is there |
| `LINK-REL-MULTIPLE` | NOT APPLICABLE | No link carries a conflicting combination of rel values |
| `BING-5` | NOT APPLICABLE | Reachability is a property of a site, not of a page. This auditor audits one page, so the guideline has nothing here to apply to. Named rather than silently dropped, so a reader knows it was considered |
| `BING-7` | NOT APPLICABLE | Redirect handling is a property of a server, not of a saved page. Named rather than silently dropped |
| Dead links | INSUFFICIENT EVIDENCE | Twenty-two links were inventoried. Following them would mean requesting the real host, which this run does not do |

---

## 4. Scope and limits

**What this audit covered.** One page, its robots.txt, two sitemap files and its stylesheet, as
captured on 2026-09-06, against the standards registered in `reference/README.md`.

**Accessibility coverage.** Browser mode was run, so **34 of the 50** Level A and AA criteria
were reachable on this page, not 20. Of the remaining sixteen, ten need a person to watch, read
or listen, and the rest need a page state this run could not create. **A clean measurement on the
34 is not a conformance claim.** It means those criteria came out as recorded, at the sizes
tested, by a tool, on one page.

**The two iframed forms are the largest hole in this run.** Both lead capture forms are served
cross-origin by a third party, so nothing inside them can be read: not the fields, not the
consent text, not the error handling. Six provisions across two stages are INSUFFICIENT EVIDENCE
for that one reason. On the other live California run in `output/`, the same six provisions
produced two LEGAL findings, because that page's forms were in its own markup. **The difference
is what could be seen, not what is true.** Nobody should read the texting consent rows here as a
pass.

**Fifty of eighty-two contrast measurements could not be computed**, because this page puts most
of its text over photographs. A ratio against a photograph is not computable by this method and
guessing at it would be inventing evidence.

**What a person still has to do.** Open each of the two lead forms and read the consent text.
Look at the page and decide the six REQUIRES HUMAN judgements in stage 07. Read the one fair
housing flag in stage 11 in place. Check the brokerage name at `www2.dre.ca.gov`.

**What this audit did not do.** It did not predict rankings, did not give keyword advice, did not
judge writing quality, and did not give legal advice. It reproduced published rules and reported
whether one artifact matches them.
