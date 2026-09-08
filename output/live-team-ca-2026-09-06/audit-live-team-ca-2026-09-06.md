# Audit: samples/live-team-ca/ (a real California two-agent team, identity removed)

| | |
|---|---|
| Audited | 2026-09-06 |
| Artifact | `samples/live-team-ca/` |
| Captured | 2026-09-06 by `curl`, **HTTP 200**, recorded in `NOTES.md` |
| Files read | `index.html` (9,014 lines), `robots.txt` (25), `sitemap.xml` (1), `manifest.md`, `NOTES.md` |
| Jurisdiction | **California**, settled by three `CA DRE#` numbers on the page |
| Browser mode | **Run.** Chromium via Playwright, at 1280x900 and 320x800. Every number is in `03b-render.md` |
| Standards | Those registered in `reference/README.md`, at the retrieval dates in their provenance tables |

> **This run is against a real website, published with the identity removed.** The site is a
> real California real estate team's site, captured on the date above at the HTTP status shown.
> The domain, both licensees' names, the team name, the brokerage names, all three licence
> numbers, the phone number, the street address, six sold property addresses and their prices,
> and seven clients' names have been replaced with placeholders of the same shape. The markup,
> the line numbers and every defect are exactly as they were found. **The redaction is
> deliberate.** The owners did not ask to be audited, and publishing a named criminal-liability
> finding against a business that never asked for one would be wrong, whether or not the
> finding is correct. The method is `method/anonymising-a-run.md`.
>
> **This run goes past that method in two places, and says so.** The city name and the
> achievement statistics were replaced as well, because the method's own check 4 search test
> failed without it. `NOTES.md` records both, and the state, which is the only fact the audit
> needs, is untouched.

---

## 1. Summary

| Severity | Findings |
|---|---|
| LEGAL | 4 |
| BLOCKING | 0 |
| ACCESS | 3 |
| ELIGIBILITY | 0 |
| ADVISORY | 0 |
| **Total** | **7** |

Plus 3 queries resolved as INSUFFICIENT EVIDENCE rather than issued as findings, and **6
sub-threshold contrast readings that were measured and then deliberately not issued**, because
every one of them is inside a modal that is closed when the page loads.

**This is the first run in this folder where a page passes the texting consent checks it is most
often failed on.** The contact form carries real consent text at the point of capture, tied to an
unticked required checkbox, with opt-out instructions. That is better than most agent sites and
the audit says so before it says anything else. What it is missing is two specific sentences the
regulation names, and a privacy policy link that uses the word privacy.

### Why this run exists alongside the other California one

It is the **two-licensee case**. `CA-2773(a)-EACH` says that where more than one licensee is
named, each one's licence number must be disclosed. Until this run, that provision had never been
exercised against a real artifact, because every other live run is a single agent. This page
names two licensees and a third licensed entity, and it passes.

---

## 2. Findings

### LEGAL

```
F-001   LEGAL
Provision : TCPA-64.1200(f)(9)(i)(A)
            (reference/fcc/47-cfr-64-1200-consent.md:51)
Provision text
  "Disclosure that signing authorizes autodialed or prerecorded telemarketing"
Location  : samples/live-team-ca/index.html:278
Observed  : The consent sentence reads in full: "I agree to be contacted by
            Blake Agent via call, email, and text for real estate services. To
            opt out, you can reply 'stop' at any time or reply 'help' for
            assistance. You can also click the unsubscribe link in the emails.
            Message and data rates may apply. Message frequency may vary."
            grep for "autodial", "automatic telephone dialing", "prerecorded"
            and "artificial voice" across the whole page returns 0.
Verdict   : FAIL
Why       : `TCPA-64.1200(f)(9)-SCOPE` is met: the form captures a telephone
            number in an <input type="tel"> at index.html:265, and the consent
            text names calls and texts. Whether this team then uses an
            autodialer or a prerecorded voice is REQUIRES HUMAN and is NOT
            assumed here. What is established from the artifact is that if
            they do, the consent obtained does not disclose it, because the
            sentence the regulation names is not present.
Fix       : Add the disclosure to the consent sentence, for example "...by
            automated means, including autodialed or prerecorded calls and
            texts."
See also  : F-002.
Not legal advice. This reproduces a regulation and reports whether the
artifact matches its text.
```

```
F-002   LEGAL
Provision : TCPA-64.1200(f)(9)(i)(B)
            (reference/fcc/47-cfr-64-1200-consent.md:52)
Provision text
  "Disclosure that signing is not a condition of purchasing any property,
   goods or services"
Location  : samples/live-team-ca/index.html:278
Observed  : The sentence is absent. So is every paraphrase of it. grep for
            "not a condition", "condition of purchase" and "condition of
            purchasing" across the whole page returns 0.
Verdict   : FAIL
Why       : This is a separate obligation from F-001 and is the one most often
            missing. It is listed separately in the section, so it is cited
            separately here rather than stacked onto F-001. It matters more
            than usual on this page, because the consent checkbox carries the
            HTML `required` attribute: the form cannot be submitted without
            ticking it, which is exactly the arrangement this disclosure
            exists to be honest about.
Fix       : Add the words "Consent is not a condition of purchase" to the
            consent sentence.
See also  : F-001.
Not legal advice. This reproduces a regulation and reports whether the
artifact matches its text.
```

```
F-003   LEGAL
Provision : CALOPPA-22575(a)-POSTED
            (reference/state/ca/bpc-22575-caloppa.md:46)
Provision text
  "shall conspicuously post its privacy policy on its Web site"
Location  : samples/live-team-ca/index.html:1141 (footer)
Observed  : Four links on the page point at /terms-and-conditions. Three read
            "Privacy Policy" and all three are inside closed modals, measured
            in the browser at 0 by 0 pixels with a display:none ancestor. The
            one that a visitor can actually see reads:
              <span>Copyright © 2026 | <a href="/terms-and-conditions"
                class="hvr_animation ">Policy</a></span>
            Its link text is the single word "Policy". There is also a visible
            "Your Privacy Choices" link, whose href is "#": a consent manager
            trigger, not a link to a document.
Verdict   : FAIL
Why       : The check is whether there is a link whose text names a privacy
            policy. The only such links on this page are hidden inside forms
            the visitor has not opened. What is visible names no policy of any
            kind, and points at a terms and conditions page. Whether the target
            document contains a conforming privacy policy cannot be
            established from this artifact, because that page was not captured.
            What can be established is that nothing a visitor can see names a
            privacy policy as its own document.
Fix       : Add a footer link reading "Privacy Policy" pointing at a privacy
            policy, alongside the terms link.
See also  : F-004.
Not legal advice. This reproduces a statute and reports whether the artifact
matches its text.
```

```
F-004   LEGAL
Provision : CALOPPA-22575(a)-CONSPICUOUS
            (reference/state/ca/bpc-22575-caloppa.md:47)
Provision text
  Section 22577(b) defines conspicuous posting, including a link on the
  homepage using the word "privacy"
Location  : samples/live-team-ca/index.html:1141
Observed  : The visible footer link to the policy document reads "Policy". The
            word "privacy" does not appear in it. The only visible element on
            the page whose text contains the word is "Your Privacy Choices",
            and its href is "#".
Verdict   : FAIL
Why       : This is a separate provision from F-003 with its own test, so it
            is cited separately rather than stacked. 22577(b) names a link
            using the word "privacy" as a way of satisfying conspicuous
            posting, and the one visible link to the document does not use it.
            Whether a reader would notice the link at all is REQUIRES HUMAN
            and is not claimed here.
Fix       : Use the word "Privacy" in the visible link text. Changing "Policy"
            to "Privacy Policy" in the footer would settle both this and F-003.
See also  : F-003.
Not legal advice. This reproduces a statute and reports whether the artifact
matches its text.
```

### ACCESS

```
F-005   ACCESS
Provision : WCAG-2.4.7  (reference/wcag/2-operable.md:223)
Provision text
  "Any keyboard operable user interface has a mode of operation where the
   keyboard focus indicator is visible."
Location  : samples/live-team-ca/index.html:95 onwards (the primary navigation)
            and 17 other visible focusable elements across the page
Observed  : Each visible focusable element's computed outline-style,
            outline-width, outline-color, box-shadow, border,
            background-color, color and text-decoration-line was read
            unfocused, then focused, then compared. 19 of 37 changed nothing
            at all. The navigation links read, in both states:
              outline-style: none, box-shadow: none,
              border: 0px none rgb(0,0,0), background: rgba(0,0,0,0)
            The set includes every item in the primary navigation (About Us,
            Sell With Us, Buy With Us, Properties, Home Search, Testimonials),
            the menu button, and the property search input. Full list in
            03b-render.md.
Verdict   : FAIL
Why       : outline-style is "none" in both states, so no outline is painted
            in either, and no other property changes. A keyboard user tabbing
            through this site's main navigation and into its search field gets
            no visual signal of where they are, for more than half the
            controls on the page.
Fix       : Delete the rule setting outline: none on .navigation__link and
            .search-input, or replace it with a :focus-visible style carrying
            a visible outline.
See also  : F-006.
```

```
F-006   ACCESS
Provision : WCAG-2.1.1  (reference/wcag/2-operable.md:24)
Provision text
  "All functionality of the content is operable through a keyboard interface
   without requiring specific timings for individual keystrokes."
Location  : samples/live-team-ca/index.html:930, and 14 further instances of
            the same element on the same page
Observed  : Fifteen visible links carry tabindex="-1". All fifteen are the
            same control, repeated once per testimonial card:
              <a href="/testimonials" class="btn btn--primary-dark
                card-button button-style-1" tabindex="-1">Read More</a>
            Measured in the browser: element.tabIndex is -1, and the element's
            bounding box is non-zero with no hidden ancestor, so each one is on
            screen and out of the tab order at the same time.
Verdict   : FAIL
Why       : A tabindex of -1 removes an element from the sequential keyboard
            navigation order. These are the only controls on the page that
            lead to the full testimonials, and a keyboard user can see all
            fifteen and reach none of them.
Fix       : Remove tabindex="-1" from the card button. If it exists to stop
            the carousel's off-screen slides collecting focus, set it only on
            the slides that are actually hidden, and clear it as each slide
            becomes visible.
See also  : F-005.
```

```
F-007   ACCESS
Provision : WCAG-1.1.1  (reference/wcag/1-perceivable.md:24)
Provision text
  "All non-text content that is presented to the user has a text alternative
   that serves the equivalent purpose, except for the situations listed
   below."
Location  : samples/live-team-ca/index.html:95
Observed  : One <img> element on the page carries no alt attribute at all.
            Measured in the browser: of 19 images, 1 returns false for
            hasAttribute('alt'). It renders 16 pixels wide. The other 18 all
            carry the attribute.
Verdict   : FAIL
Why       : A missing alt attribute is not the same as alt="". An empty alt
            declares an image decorative, which is a decision a screen reader
            respects by skipping it. A missing attribute makes no declaration
            at all, so assistive technology commonly falls back to announcing
            the file name, which here is a 32 character hexadecimal id.
Fix       : If the icon carries meaning, give it an alt attribute describing
            that meaning. If it is decoration, give it alt="". Either is
            correct; having neither is not.
See also  : none. The nine larger images carrying alt="" are a separate
            question, and it is not answered here. See stage 07.
```

---

## 3. The full provision ledger

Every provision this auditor holds, with its verdict and the reason in the row.

### Stage 01, freshness of the reference set

Identical to the run in `output/live-agent-ca-2-2026-09-06/`, run the same day against the same
reference set. 15 standards confirmed current by script; 7 blocked to `curl` and confirmed by
hand in the browser (the five WCAG canaries, CalOPPA against the official California Legislative
Counsel text after Justia returned 403 to the browser as well, and the Bing guidelines); 1
rescinded by design. **Stale: 0. Withdrawn: 0. The audit was allowed to proceed.**

### Stage 02, jurisdiction

| Provision | Verdict | Reason |
|---|---|---|
| Which state pack | California | The page carries three eight digit numbers explicitly labelled `CA DRE#` at `index.html:341` and `index.html:1141`. No other state's rules are loaded, read or listed |

### Stage 04, can this page be indexed

| Provision | Verdict | Reason |
|---|---|---|
| `GSE-TR-1` | PASS | robots.txt blocks `/thankyou`, `/modules/`, `/internal/`, `/thank-you`, `/home-search/account`, `/home-search/auth/`, `/api/`, `/cdn-cgi/` and `/modals.html` for the `*` group. None matches `/`, so Googlebot is not blocked from the page under audit |
| `GSE-TR-2` | PASS | The live capture returned HTTP 200, recorded in `NOTES.md` |
| `GSE-TR-3` | PASS | Headings, body copy, six sold listings, seven testimonials and a title. There is indexable content |
| `GSE-TR-INDEXABLE-A` | PASS | `text/html`, a file type Google Search supports |
| `GSE-TR-INDEXABLE-B` | PASS | The spam pass in stage 08 raised nothing |
| `<meta name="robots">` | PASS | Absent, which means the default: indexable and followable. Absence here is not a defect |
| `<link rel="canonical">` | PASS | Self-referencing at `index.html:18`, consistent with `og:url` |

### Stage 05, crawler access

| Provision | Verdict | Reason |
|---|---|---|
| `RFC9309-2.2.1` | PASS | Six groups: `AdsBot-Google`, `SemrushBot`, `SiteAuditBot`, `PetalBot`, `dotbot` and `*`. Every product token uses only permitted characters |
| `RFC9309-2.2.2` | PASS | Every `Disallow` line carries a path starting at the first octet |
| `RFC9309-2.2.3` | PASS | No wildcards used. Nothing to support |
| `RFC9309-2.2.4` | PASS | One `Sitemap:` record. It sits on line 1, **before** the first user-agent line, which was checked deliberately: Section 2.2.4 says an other record MUST NOT terminate a group and MAY be interpreted, and Section 2.2.2's rule about rules outside a group applies to `allow` and `disallow` lines, not to a Sitemap record. It is valid where it is |
| `RFC9309-2.3` | PASS | Served at `/robots.txt` on the same host |
| Crawl-delay directives | Reported, not graded | Four crawlers are given `Crawl-delay: 10`. `Crawl-delay` is not in RFC 9309 at all, so this auditor holds no provision about it. Google ignores it, Bing honours it. Named here because the owner should know it is there |
| `SM-REQ-urlset` | NOT APPLICABLE | The file at `/sitemap.xml` is a `<sitemapindex>`, not a `<urlset>`. That is the correct structure for an index and this provision governs the other kind |
| `SM-REQ-loc` | PASS | Each of the four `<sitemap>` entries carries a `<loc>` |
| `SM-FILE-4` | PASS | All four `<loc>` values are on the one host |
| `SM-FILE-6` | PASS | Four child sitemaps, far under the limits |
| `SM-OPT-lastmod` | Reported | Absent from every entry in the index. Absence of an optional tag is never a failure |
| `SM-OPT-changefreq`, `SM-OPT-priority` | NOT APPLICABLE | Absent, and never required |
| `INDEXNOW-VERIFY-2` | NOT APPLICABLE | No `{key}.txt` file in the artifact and none named in `NOTES.md`. IndexNow is optional. `BING-4` says adopting it would tell Bing about changes faster |
| `INDEXNOW-KEY-1` | NOT APPLICABLE | Not reached. There is no key file to be malformed |
| `AICRAWL-OPENAI-OAI-SearchBot`, `AICRAWL-ANTHROPIC-Claude-SearchBot`, `AICRAWL-PERPLEXITY-PerplexityBot` | PASS | robots.txt names five crawlers and none of them is an AI assistant, so the `*` group applies and none of the three search-and-answer bots is blocked. **This one is worth the owner's attention**: this robots.txt shows someone thought about crawler control, named `SemrushBot`, `SiteAuditBot`, `PetalBot` and `dotbot`, and did not consider the assistants either way. The outcome is good and it was inherited, not chosen |
| `AICRAWL-OPENAI-GPTBot`, `AICRAWL-ANTHROPIC-ClaudeBot` | PASS | Not blocked. Training crawlers, so blocking or allowing is a preference and this row reports rather than grades |
| `AICRAWL-OPENAI-ChatGPT-User`, `AICRAWL-ANTHROPIC-Claude-User`, `AICRAWL-PERPLEXITY-Perplexity-User` | PASS | Not blocked. Two of the three publishers state robots.txt may not apply to user-initiated fetches anyway |
| `BING-2`, `BING-3` | PASS | An XML sitemap index exists and is declared on the first line of robots.txt |
| `BING-10` | PASS | robots.txt and the absent meta robots tag do not contradict each other |
| `HSTS-5.1` | Reported, not graded | Served over HTTPS. The captured response carried **no** `Strict-Transport-Security` header. RFC 6797 obliges no site to adopt HSTS, so this is an observation, not a failure |
| `HSTS-6.1.1`, `HSTS-6.1.2` | NOT APPLICABLE | Not reached. There is no header to inspect |

### Stage 06, structured data

**This page carries no structured data of any kind.** Zero `application/ld+json` blocks, zero
microdata, zero RDFa, confirmed both in source and in the rendered DOM.

| Provision | Verdict | Reason |
|---|---|---|
| `SD-GEN-FORMAT-1` | NOT APPLICABLE | The provision is conditional: "in order to be eligible for rich results, mark up your pages". Nothing here is marked up, so nothing can be invalid. **The consequence, stated plainly and without a finding attached: this page is not eligible for a Local Business rich result, because there is nothing for Google to read.** No publisher says a page must carry structured data, so this auditor does not issue one |
| `SD-GEN-ACCESS-1`, `SD-GEN-CONTENT-4`, `SD-GEN-RELEVANCE-1`, `SD-GEN-COMPLETENESS-1`, `SD-GEN-LOCATION-1`, `SD-GEN-SPECIFICITY-1` | NOT APPLICABLE | No structured data to access, hide, misrepresent, complete, place or type |
| `SD-LB-REQ-name`, `SD-LB-REQ-address` | NOT APPLICABLE | No `LocalBusiness` item exists. Both facts are present in the page's visible text and neither is marked up |
| `SD-LB-REC-telephone`, `-url`, `-geo`, `-openingHoursSpecification`, `-priceRange` | NOT APPLICABLE | Same reason |
| `SD-LB-REC-aggregateRating`, `SD-LB-REC-review` | NOT APPLICABLE | Recommended **only for sites that capture reviews about other local businesses**. This site publishes fourteen testimonial cards about itself, which is not that, and marks none of them up. That is the correct choice and it is worth saying so, because self-serving review markup is the commonest structured data mistake on agent sites |
| `SD-LB-SUBTYPE`, `SD-LB-GUIDE-1` | NOT APPLICABLE | Not reached |


### Stage 07, accessibility, WCAG 2.1 Level A and AA

Browser mode was run, so **34 of the 50** Level A and AA criteria are reachable on this page.

| Criterion | Verdict | Reason |
|---|---|---|
| `WCAG-1.1.1` Non-text Content | **FAIL** | One of 19 images carries no `alt` attribute at all. **F-007**. Separately: nine images that carry `alt=""` render between 367 and 427 pixels wide and include agent photography and three MLS listing photographs. Whether a 400px photograph of a sold house is decorative is a judgement, so it is not part of the finding and is named in the scope section for a person |
| `WCAG-1.2.1` to `WCAG-1.2.5` | NOT APPLICABLE | No audio and no video elements on the page |
| `WCAG-1.3.1` Info and Relationships | REQUIRES HUMAN | Browser mode recorded three readings a person should judge: the three "Our Proven Success" statistics are each marked as an `<h3>`; the testimonial avatar initials ("CO", "CTAP", "CFAP") are each marked as an `<h3>`; and heading level jumps from H2 to H4 in the sales and testimonial blocks. Each may be a structure that is announced but not real |
| `WCAG-1.3.2` Meaningful Sequence | PASS | DOM order and visual order agree across the page. No CSS `order`, float or absolute positioning was found moving content away from its source position |
| `WCAG-1.3.3` Sensory Characteristics | REQUIRES HUMAN | Needs a person to read the copy for instructions depending on shape, size or position |
| `WCAG-1.3.4` Orientation | PASS | Resized to 320x800 and back. No CSS transform and no message locks one orientation |
| `WCAG-1.3.5` Identify Input Purpose | REQUIRES HUMAN | The fields in scope (name, email, telephone) are inside closed modals. Their `autocomplete` attributes could be read from source but not confirmed in the state a user meets them |
| `WCAG-1.4.1` Use of Color | REQUIRES HUMAN | Whether colour alone carries meaning is a judgement, not a measurement |
| `WCAG-1.4.2` Audio Control | NOT APPLICABLE | Nothing plays automatically. No audio or video element exists |
| `WCAG-1.4.3` Contrast (Minimum) | REQUIRES HUMAN | **Read this row carefully.** On rendered text only, 135 elements were measured: 14 above the threshold, 121 not computable because the text sits over a photograph, **0 below**. Six readings did fall below, and every one of them is inside a modal that is closed on load, measured at 0 by 0 pixels with a `display: none` ancestor: a submit button at ratio 1.14, and the consent disclaimer, its `Privacy Policy` link and a `Read more` button at 3.74 against a required 4.5. **Those six are not issued as findings, because nobody has seen them.** What a person must do: open each modal and take the reading again. If it holds, the disclaimer that F-001 and F-002 are about is also hard to read, which would make it worse, not better |
| `WCAG-1.4.4` Resize Text | PASS | Root font size set to 200 percent. `scrollWidth` stayed 1280 against a `clientWidth` of 1280 |
| `WCAG-1.4.5` Images of Text | REQUIRES HUMAN | A person has to look at the images to say whether any is a picture of text |
| `WCAG-1.4.10` Reflow | PASS | At a 320 pixel viewport, `document.documentElement.scrollWidth` is 320. The elements extending past it are testimonial carousel slides, which scroll inside their own container |
| `WCAG-1.4.11` Non-text Contrast | REQUIRES HUMAN | Which graphics are needed to understand the content is a judgement, and the form control borders are inside closed modals |
| `WCAG-1.4.12` Text Spacing | PASS | The criterion's four overrides were applied. No horizontal overflow appeared and `scrollWidth` stayed 1280 |
| `WCAG-1.4.13` Content on Hover or Focus | REQUIRES HUMAN | Dismissible, hoverable and persistent are three judgements, not three measurements |
| `WCAG-2.1.1` Keyboard | **FAIL** | Fifteen visible "Read More" links carry `tabindex="-1"` and cannot be reached by keyboard. **F-006** |
| `WCAG-2.1.2` No Keyboard Trap | PASS | Focus was moved onto all 37 visible focusable elements in turn and released each time. No element held focus |
| `WCAG-2.1.4` Character Key Shortcuts | REQUIRES HUMAN | Single character shortcuts are registered in ways no script can enumerate reliably |
| `WCAG-2.2.1` Timing Adjustable | NOT APPLICABLE | No time limit is set by the content. No meta refresh, no session timer in the markup |
| `WCAG-2.2.2` Pause, Stop, Hide | REQUIRES HUMAN | `document.getAnimations()` returns **0**, so nothing is moving through the Web Animations API. The two carousels on this page advance on a script timer, which that call cannot see. A person has to load the page and watch whether either auto-advances |
| `WCAG-2.3.1` Three Flashes | REQUIRES HUMAN | A person has to watch the page |
| `WCAG-2.4.1` Bypass Blocks | REQUIRES HUMAN | No skip link and no `<main>` landmark. One `<nav>` landmark and 51 headings, with an H1 present and unique. Headings are a sufficient technique for this criterion, so the question is whether this heading structure works as a bypass mechanism given the level jumps recorded under 1.3.1 |
| `WCAG-2.4.2` Page Titled | PASS | `<title>` at `index.html:9` reads "Example City CA Real Estate Agent \| Blake & Casey Agent". It describes both topic and purpose |
| `WCAG-2.4.3` Focus Order | PASS | Programmatic focus visited the 37 visible focusable elements in DOM order |
| `WCAG-2.4.4` Link Purpose (In Context) | REQUIRES HUMAN | Fifteen links read "Read More" and all fifteen point at the same `/testimonials` target, so the repetition is not ambiguous. Thirty links open in a new tab with no warning in their text, which the criterion does not require but a person may want to look at |
| `WCAG-2.4.5` Multiple Ways | PASS | A navigation menu, a property search and a sitemap. More than one way to locate a page |
| `WCAG-2.4.6` Headings and Labels | REQUIRES HUMAN | 51 rendered headings, several of which are statistics or two-letter initials. Whether they describe their topic is a reading judgement |
| `WCAG-2.4.7` Focus Visible | **FAIL** | 19 of the 37 visible focusable elements show no computed change of any kind when focused, including the entire primary navigation. **F-005** |
| `WCAG-2.5.1` Pointer Gestures | REQUIRES HUMAN | The carousels are the obvious candidate, and handlers cannot be enumerated reliably by script |
| `WCAG-2.5.2` Pointer Cancellation | REQUIRES HUMAN | Same |
| `WCAG-2.5.3` Label in Name | REQUIRES HUMAN | Visible label and accessible name must be compared by a person for the controls that have both |
| `WCAG-2.5.4` Motion Actuation | REQUIRES HUMAN | Same as 2.5.1 |
| `WCAG-3.1.1` Language of Page | PASS | `<html class="no-js" lang="en">`, read from the rendered document |
| `WCAG-3.1.2` Language of Parts | PASS | Exactly one element carries a `lang` attribute, the `<html>` element, and no passage in another language was found |
| `WCAG-3.2.1` On Focus | PASS | Focus was moved onto every visible focusable element in turn. `location.href` and `window.length` did not change |
| `WCAG-3.2.2` On Input | INSUFFICIENT EVIDENCE | The only field a visitor can type into without opening a modal is the property search box. Driving the others would mean opening each modal, which this run did not do |
| `WCAG-3.2.3` Consistent Navigation | NOT APPLICABLE | One page was supplied. Consistency across pages needs more than one page |
| `WCAG-3.2.4` Consistent Identification | NOT APPLICABLE | Same reason |
| `WCAG-3.3.1` Error Identification | INSUFFICIENT EVIDENCE | The forms are closed on load and submitting them would send a real enquiry to a real business's inbox, which this run will not do |
| `WCAG-3.3.2` Labels or Instructions | PASS, in part | The contact form's fields carry `<label for>` associations, including a visually hidden one on the interest select and one on the consent checkbox. The exception is the visible property search input, which has a placeholder and no label |
| `WCAG-3.3.3` Error Suggestion | INSUFFICIENT EVIDENCE | Same reason as 3.3.1. Note that the consent checkbox does carry a custom validity message, "Please accept the terms and conditions", set in `oninvalid` |
| `WCAG-3.3.4` Error Prevention (Legal, Financial, Data) | REQUIRES HUMAN | Needs a person to decide whether a property enquiry is a legal or financial commitment |
| `WCAG-4.1.1` Parsing | PASS | The document parsed into a DOM with no fatal error. Removed in WCAG 2.2; graded here because this auditor holds WCAG 2.1, and it passes either way |
| `WCAG-4.1.2` Name, Role, Value | REQUIRES HUMAN | The accessibility snapshot gives a computed name for every custom control. Whether each name is meaningful is a person's judgement |
| `WCAG-4.1.3` Status Messages | PASS, in part | One `aria-live` region exists on the page, and the contact form has a success message, "Thank you for your message. We will be in touch with you shortly." Whether it lands in that region needs a real submission, which this run did not make |
| `WCAG-CONFORMANCE-5.2.1` | **NOT MET** | Level AA conformance requires that the page satisfies all Level A and Level AA success criteria. Three do not: `WCAG-1.1.1`, `WCAG-2.1.1` and `WCAG-2.4.7`. One failure is enough |

### Stage 07, spam policies

| Provision | Verdict | Reason |
|---|---|---|
| `SPAM-KEYWORD-STUFFING` | PASS | The copy names its market where a reader would expect it and nowhere else. There is no repeated phrase list and no locality block |
| `SPAM-CLOAKING` | PASS | The rendered text and the source text are the same |
| `SPAM-HIDDEN-TEXT` | PASS | Text is hidden on this page, and all of it is either inside closed modals or in `sr-only` labels that exist to name form fields. Neither is a ranking technique |
| `SPAM-DOORWAYS` | NOT APPLICABLE | One page was supplied. A doorway finding needs the set of near-duplicate pages it describes. Worth noting for a person: the sitemap index names a `sitemap-neighborhoods-dpages.xml`, which is where that question would be answered |
| `SPAM-SCALED-CONTENT` | INSUFFICIENT EVIDENCE | Whether any content was generated at scale cannot be read from one page, and the policy turns on intent |
| `SPAM-LINK-SPAM` | PASS | Thirty outbound links, all of them either social share buttons for the site's own listings, the licensees' own profiles, or the platform vendor. No link scheme pattern |
| `SPAM-SCRAPING` | PASS | The content is original to this site |
| `SPAM-THIN-AFFILIATION` | NOT APPLICABLE | No affiliate links |
| `SPAM-SNEAKY-REDIRECTS` | PASS | No redirect in the markup. The live capture followed no redirect |
| `SPAM-MISLEADING-FUNCTIONALITY` | PASS | Every control does what its label says |
| `SPAM-SCAM-FRAUD` | PASS | Nothing impersonates another party or solicits money under a false premise |
| `SPAM-EXPIRED-DOMAINS`, `SPAM-HACKED-CONTENT`, `SPAM-MACHINE-TRAFFIC`, `SPAM-MALICIOUS`, `SPAM-POLICY-CIRCUMVENTION`, `SPAM-SITE-REPUTATION`, `SPAM-USER-GENERATED` | NOT APPLICABLE | None is engaged by a single-page artifact with no third party content, no user submissions and no injected markup |

### Stage 08, licence and broker, California pack

**This is the stage this run exists for.**

| Provision | Verdict | Reason |
|---|---|---|
| `CA-2773(a)(3)` | Applies | This is the licensees' own site, which is what makes it solicitation material under the rule at all |
| `CA-2773(b)` | NOT APPLICABLE | The exception covers signs only. A website is never exempt under it |
| `CA-2773(a)-LICENSE` | PASS | Three numbers, each eight digits, each presented as a licence number and labelled `CA DRE#`: two at `index.html:341` directly under the H1, and a third at `index.html:1141` in the footer |
| `CA-2773(a)-BROKER` | PASS, with a note | A brokerage name appears at `index.html:341`, in the same block as the licence numbers and directly under the licensees' names, which is where a reader would look for it. Whether that name matches the responsible broker's currently licensed name is REQUIRES HUMAN and is settled at `www2.dre.ca.gov`. The footer additionally names a second licensed entity with its own DRE number, which a person should reconcile against the DRE record |
| `CA-2773(a)-EACH` | **PASS** | Two licensees are named on this page, in the H1 and in the footer. Two licence numbers are disclosed alongside them, plus a third for the entity named in the footer. The counts match, and the numbers sit next to the names rather than on a separate page. This is the provision most likely to be missed by a team site and this one gets it right |
| `CA-2773(a)-TYPESIZE` | PASS | Measured in the browser. The licence numbers render at **14px**. The smallest visible type anywhere on the page is **10px**, a "Let's Connect" button. 14 is not smaller than 10. Recorded in `03b-render.md` |

### Stage 09, listing images, California pack

**Pass A, which needs no manifest and always runs.**

| Reading | Value |
|---|---|
| `<img>` elements on the page | **16** |
| Of those, photographs of real property in the "Recent Sales" block | **3** |
| Alteration disclosure wording anywhere in the visible text | **none** |
| A link to unaltered originals | **none** |

Searched for: "has been altered", "digitally altered", "virtually staged", "virtual staging",
"generative AI", "AI-generated", "computer generated", "rendering", "for illustrative purposes",
"added digitally" and eleven further variants. Zero hits.

**The result of pass A, in one sentence.** This page carries sixteen images, three of them
photographs of real property, contains no alteration disclosure of any kind, and links to no
unaltered originals. **If any one of those three property photographs was digitally altered,
this page does not meet `CA-10140.8(a)(1)` today.** That is a finished answer, and it is the
sharpest AB 723 result in this folder against a real site, because this is the only live run
that advertises property photography at all.

**Pass B, which needs the manifest.**

| Provision | Verdict | Reason |
|---|---|---|
| `CA-10140.8(b)(1)`, `CA-10140.8(b)(2)` | INSUFFICIENT EVIDENCE | `manifest.md` is present and every row says UNKNOWN, because the owners were never asked how any image was made. Without that fact no image can be classified as altered or excluded |
| `CA-10140.8(a)(1)-STATEMENT`, `-CONSPICUOUS`, `-LINK`, `-POINTER`, `CA-10140.8(a)(2)` | Conditional, resolved by pass A | Each obligation bites only on an image classified as altered. None has been classified, so no finding is issued. **But pass A has already established that if any is altered, all five are unmet**, because there is no disclosure and no link anywhere on the page to satisfy them |
| Why this matters more here than on the other run | | **This page carries three MLS listing photographs**, rendered at 367 pixels wide, in a "Recent Sales" block. The other live California run carries no property photography at all. AB 723 is about images of real property, so this is the case the statute was written for and the value of an answer is higher. `manifest.md` also names a question this auditor will not answer: whether AB 723 reaches an image of a property no longer being advertised for sale. That is a question of law and it goes to a lawyer, not to this tool |

### Stage 10, fair housing

**This stage issues no verdict, ever. It flags and hands to a person.**

| Flag | What was found | What a person must do |
|---|---|---|
| `FHA-100.75(c)(1)` Tier A wording scan | One flag. The word "exclusive" appears once in visible text: "Subscribe to receive exclusive news & updates", the newsletter signup label | Read it in place. On its face this describes email content, not a dwelling, and 24 CFR 100.75 reaches notices "about the sale or rental of a dwelling". **This auditor does not say it is fine. A person decides** |
| `FHA-100.75(a)`, `FHA-100.75(b)`, `FHA-100.75(c)(3)` | No flags raised by the wording scan | These provisions reach oral statements and media selection as well as page text, neither of which is in this artifact |
| Worth a person's eye, and not a flag | Seven testimonials name the clients who wrote them, and one describes the writers as first-time buyers. Nothing in that indicates a preference about who may buy | Named only so a reviewer knows the scan saw it and passed over it |
| `FHA-109.20-RESCINDED` word list | Run as a Tier B flag only | 24 CFR Part 109 was withdrawn from the CFR on 1 May 1996. It cannot produce a finding and it produced none |

### Stage 11, privacy and consent

| Provision | Verdict | Reason |
|---|---|---|
| `CALOPPA-22575(a)-COLLECTS` | Met | Four forms capture name, email, telephone and message. The obligation applies |
| `CALOPPA-22575(a)-POSTED` | **FAIL** | The only link to the policy document a visitor can see reads "Policy" and points at a terms and conditions page. The three links that read "Privacy Policy" are inside closed modals. **F-003** |
| `CALOPPA-22575(a)-CONSPICUOUS` | **FAIL** | The visible footer link does not use the word "privacy". The one visible element that does, "Your Privacy Choices", has `href="#"`. **F-004** |
| `TCPA-64.1200(f)(9)-SCOPE` | Met | The contact form captures a telephone number in an `<input type="tel">` at `index.html:265`, and the consent text names calls and texts. Whether this team uses an autodialer or a prerecorded voice is REQUIRES HUMAN and is not assumed |
| `TCPA-64.1200(f)(9)-AGREEMENT` | **PASS** | Consent text sits at the point of capture, inside a `<label>` wrapping an `<input type="checkbox" name="termsAccepted" required>`. The box is **not** pre-ticked, so ticking it is a deliberate act, and the form cannot be submitted without it. This is the arrangement the provision asks for and most agent sites do not have it |
| `TCPA-64.1200(f)(9)(i)(A)` | **FAIL** | The consent text does not disclose that signing authorizes autodialed or prerecorded telemarketing. **F-001** |
| `TCPA-64.1200(f)(9)(i)(B)` | **FAIL** | The consent text does not say that signing is not a condition of purchase. **F-002** |
| `TCPA-64.1200(f)(3)` | REQUIRES HUMAN | The disclosure is its own element, `span.lp-tcr-message`, separate and distinguishable from the surrounding copy, which is what the structural half of "clear and conspicuous" asks for. Whether a reasonable consumer would notice it is a person's judgement, and that person should know that browser mode measured this text at a contrast ratio of **3.74 against a required 4.5**, in the closed state |

### Stage 12, link integrity

| Provision | Verdict | Reason |
|---|---|---|
| `LINK-REL-sponsored` | NOT APPLICABLE | The artifact identifies no link as paid, sponsored or an advertisement |
| `LINK-REL-ugc` | NOT APPLICABLE | The testimonial cards contain no links other than the site's own "Read More" |
| `LINK-REL-nofollow` | Reported, never required | No link on the page carries `nofollow` |
| `LINK-REL-NONE` | NOT APPLICABLE | Not reached. Nothing carries an unexplained `nofollow` |
| `LINK-REL-MULTIPLE` | NOT APPLICABLE | The only `rel` value used anywhere on the page is `noopener noreferrer`, and no link carries a conflicting combination |
| Reported, not graded | | 30 links carry `target="_blank"` and **29 of them carry no `rel` attribute at all**. No provision in `reference/` requires one, so this produces no finding. It is named because the owner may want to know, and because a reviewer who expected a finding here should see that the auditor considered it and declined |
| `BING-5` | NOT APPLICABLE | Reachability is a property of a site, not of a page. This auditor audits one page, so the guideline has nothing here to apply to. Named rather than silently dropped, so a reader knows it was considered |
| `BING-7` | NOT APPLICABLE | Redirect handling is a property of a server, not of a saved page. Named rather than silently dropped |
| Dead links | INSUFFICIENT EVIDENCE | Thirty outbound links were inventoried. Following them would mean requesting the real hosts, which this run does not do |

---

## 4. Scope and limits

**What this audit covered.** One page, its robots.txt and its sitemap index, as captured on
2026-09-06, against the standards registered in `reference/README.md`.

**Accessibility coverage.** Browser mode was run, so **34 of the 50** Level A and AA criteria
were reachable, not 20. Of the remaining sixteen, ten need a person to watch, read or listen.
**A clean measurement on the 34 is not a conformance claim.**

**The closed modals are the largest hole in this run, and they are also its most useful result.**
Four of this page's forms and every disclaimer attached to them are inside pop-ups that are shut
when the page loads. The contrast routine in `method/browser-mode.md` does not check ancestors,
so it measured them anyway and returned six failures. **All six were withdrawn** once each
element was confirmed to be 0 by 0 pixels inside a `display: none` ancestor. Both counts are in
`03b-render.md`, labelled. A person opening those modals and re-measuring is the single highest
value thing anyone can do with this report, because if those readings hold, the consent
disclaimer that F-001 and F-002 concern is also hard to read.

**Nine images carrying `alt=""` render at 367 to 427 pixels wide**, including three MLS listing
photographs. That is not part of F-007 and it is not a finding, because whether a photograph is
decorative is a judgement rather than a measurement. It is the second thing a person should look
at.

**What a person still has to do.** Open each modal and re-measure the four contrast readings.
Decide the nine `alt=""` images. Read the one fair housing flag in place. Check both brokerage
names and all three licence numbers at `www2.dre.ca.gov`. Load the page and watch whether the
carousels auto-advance.

**What this audit did not do.** It did not predict rankings, did not give keyword advice, did not
judge writing quality, and did not give legal advice. It reproduced published rules and reported
whether one artifact matches them.
