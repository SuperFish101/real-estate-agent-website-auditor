# Audit: samples/live-agent-ca/ (a real California licensee, identity removed)

| | |
|---|---|
| Audited | 2026-09-05 |
| Artifact | `samples/live-agent-ca/` |
| Captured | 2026-09-05 by `curl`, **HTTP 200**, recorded in `NOTES.md` |
| Files read | `index.html` (723 lines), `robots.txt` (5), `sitemap.xml` (3), `style.css`, `manifest.md`, `NOTES.md` |
| Jurisdiction | **California**, settled by the CA DRE number on the page and the markets named in the copy |
| Browser mode | **Run.** Chromium via Playwright, at 1280x900, 375x812 and 320x800. Every number is in `03b-render.md` |
| Standards | Those registered in `reference/README.md`, at the retrieval dates in their provenance tables |

> **This run is against a real website, published with the identity removed.** The site is a
> real California real estate licensee's site, captured on the date above at the HTTP status
> shown. The domain, the licensee's name, both brokerage names, both licence numbers, the
> phone numbers and the email address have been replaced with placeholders of the same shape.
> The markup, the line numbers and every defect are exactly as they were found. **The
> redaction is deliberate.** The owner did not ask to be audited, and publishing a named
> criminal-liability finding against a business that never asked for one would be wrong,
> whether or not the finding is correct. The method is `method/anonymising-a-run.md`.

---

## 1. Summary

| Severity | Findings |
|---|---|
| LEGAL | 3 |
| BLOCKING | 0 |
| ACCESS | 5 |
| ELIGIBILITY | 1 |
| ADVISORY | 3 |
| **Total** | **12** |

Plus 2 queries resolved as INSUFFICIENT EVIDENCE rather than issued as findings, and 1 that
the browser measurement cleared before it could become a finding.

**This site is in better shape than most.** It is indexable, its robots.txt is valid, it
carries structured data of the correct type, and its licence number and broker are both on the
page. The findings below are real, and none of them is a catastrophe. An audit that manufactured
alarm here would be a worse document than this one.

---

## 2. Findings

### LEGAL

```
F-001   LEGAL
Provision : TCPA-64.1200(f)(9)-AGREEMENT
            (reference/fcc/47-cfr-64-1200-consent.md:50)
Provision text
  "An agreement in writing, bearing a signature, that clearly authorizes the seller"
Location  : samples/live-agent-ca/index.html:451 (home valuation form)
            samples/live-agent-ca/index.html:617 (contact form)
Observed  : Both forms capture a telephone number in an <input type="tel">.
            Neither form contains any consent text, any checkbox, or any
            reference to calls or texts. grep for "consent", "agree",
            "autodial", "text message" across the form markup returns 0.
Verdict   : FAIL
Why       : The rule bites where marketing calls or texts are sent with an
            autodialer or prerecorded voice. `TCPA-64.1200(f)(9)-SCOPE` is met
            on its first limb: the forms capture a phone number. Whether this
            licensee then autodials is REQUIRES HUMAN and is NOT assumed here.
            What is established from the artifact is that if they do, the
            written consent this section requires is not being obtained at the
            point of capture, because there is nothing at that point to consent
            to.
Fix       : Add a consent sentence beside the phone field, tied to a deliberate
            act such as an unticked checkbox.
See also  : F-002.
```

```
F-002   LEGAL
Provision : TCPA-64.1200(f)(9)(i)(B)
            (reference/fcc/47-cfr-64-1200-consent.md:52)
Provision text
  "Disclosure that signing is not a condition of purchasing any property,
   goods or services"
Location  : samples/live-agent-ca/index.html:451, index.html:617
Observed  : The sentence is absent from both forms. So is every paraphrase of
            it.
Verdict   : FAIL
Why       : This is a separate obligation from F-001 and is the one most often
            missing. It is listed separately in the section, so it is cited
            separately here rather than stacked onto F-001.
Fix       : The words "consent is not a condition of purchase" beside the
            consent checkbox.
See also  : F-001.
```

```
F-003   LEGAL
Provision : CALOPPA-22575(a)-POSTED
            (reference/state/ca/bpc-22575-caloppa.md:46)
Provision text
  "shall conspicuously post its privacy policy on its Web site"
Location  : samples/live-agent-ca/index.html:692
Observed  : One footer link, text "Terms & Privacy", pointing at
            /terms-and-conditions/. There is no link whose text is "Privacy
            Policy" and no separate privacy document linked from this page.
Verdict   : FAIL
Why       : `CALOPPA-22575(a)-COLLECTS` is met: three forms on this page
            capture name, email and telephone. The obligation therefore
            applies. What is posted is a combined link naming terms first and
            privacy second, pointing at a page titled terms and conditions.
            Whether the target document contains a conforming privacy policy
            cannot be established from this artifact, because that page was not
            captured. What can be established is that the link on this page
            does not name a privacy policy as its own document.
Fix       : A distinct link reading "Privacy Policy" pointing at a privacy
            policy, alongside the terms link.
Not legal advice. This reproduces a statute and reports whether the artifact
matches its text.
```

### ACCESS

```
F-004   ACCESS
Provision : WCAG-1.3.5
            (reference/wcag/1-perceivable.md:155)
Provision text
  "Identify Input Purpose: The purpose of each input field collecting
   information about the user can be programmatically determined."
Location  : samples/live-agent-ca/index.html:443 (name)
            samples/live-agent-ca/index.html:447 (email)
            samples/live-agent-ca/index.html:451 (tel)
            samples/live-agent-ca/index.html:609 (name)
            samples/live-agent-ca/index.html:613 (email)
            samples/live-agent-ca/index.html:617 (tel)
Observed  : No `autocomplete` attribute on any of the six fields. The only
            `autocomplete` on the page is `one-time-code`, on the hidden
            honeypot field at index.html:399.
Verdict   : FAIL
Why       : All six collect information about the user and all six map to
            tokens in the criterion's own list: `name`, `email`, `tel`. The
            mechanical half is decidable from source and it fails.
Fix       : `autocomplete="name"`, `autocomplete="email"`, `autocomplete="tel"`.
```

```
F-005   ACCESS
Provision : WCAG-3.3.2
            (reference/wcag/3-understandable.md:83)
Provision text
  "Labels or Instructions: Labels or instructions are provided when content
   requires user input."
Location  : samples/live-agent-ca/index.html:175
Observed  : <input type="text" name="q" placeholder="Search address or city">
            No <label>, no aria-label, no aria-labelledby, no adjacent text.
            The placeholder is the only description, and it disappears on
            input.
Verdict   : FAIL
Why       : Presence of a label or instruction is the mechanical half and is
            decidable from source. Whether a label that exists is *sufficient*
            needs a person, and that half is REQUIRES HUMAN. Here nothing
            exists to judge.
Fix       : A visible label, or an `aria-label` on the input.
See also  : F-006.
```

```
F-006   ACCESS
Provision : WCAG-4.1.2
            (reference/wcag/4-robust.md:47)
Provision text
  "Name, Role, Value: For all user interface components ... the name and role
   can be programmatically determined."
Location  : samples/live-agent-ca/index.html:175
Observed  : The same search input has no programmatic name from any source.
Verdict   : FAIL
Why       : One defect, two provisions, so two findings rather than one finding
            with stacked citations. `rules.md` section 3.
Fix       : The same fix closes both.
See also  : F-005.
```

```
F-007   ACCESS
Provision : WCAG-1.1.1
            (reference/wcag/1-perceivable.md:24)
Provision text
  "Non-text Content: All non-text content ... has a text alternative that
   serves the equivalent purpose, except for ... Decoration, Formatting,
   Invisible."
Location  : samples/live-agent-ca/index.html, the aerial photograph in the hero
Observed  : One <img> of the 22 on the page carries `alt=""`. One further
            <img> carries no `src` attribute at all and an `alt` describing a
            blog post.
Verdict   : FAIL, on the mechanical half only
Why       : An empty `alt` is correct for a decorative image and wrong for an
            informative one. This image is a named local landmark used as the
            page's hero, which is not obviously decoration. **Whether it is
            decorative is REQUIRES HUMAN and this finding does not decide it.**
            What is decided: the `<img>` with no `src` cannot present anything
            to anyone, and its `alt` therefore describes nothing.
Fix       : Restore the missing `src`. For the aerial, decide whether it is
            decorative and either keep `alt=""` deliberately or describe it.
```

```
F-012   ACCESS
Provision : WCAG-1.4.3
            (reference/wcag/1-perceivable.md:194)
Provision text
  "Contrast (Minimum): The visual presentation of text and images of text has
   a contrast ratio of at least 4.5:1"
Location  : Four places, measured at 1280x900. Numbers in 03b-render.md section 2.
Observed  : "License #01998877"   rgb(129,129,129) on rgb(255,255,255)  3.88:1
            Step number "2"       rgb(122,121,119) on rgb(238,237,233)  3.71:1
            Step number "3"       rgb(122,121,119) on rgb(238,237,233)  3.71:1
            "Terms & Privacy"     rgb(123,123,161) on rgb(14,14,84)     4.28:1
            All four are normal-size text, so the threshold is 4.5:1. None of
            the four reaches it.
Verdict   : FAIL
Why       : Four distinct colour pairs, so four locations under one finding
            rather than four findings, per the grouping rule in rules.md
            section 3. The fix for each is the same shape: darken the
            foreground until the ratio reaches 4.5.
            **138 of the 170 text elements on this page PASS.** This is a near
            miss on four items, not a page with a contrast problem, and the
            report says so rather than implying otherwise.
Fix       : "License" grey to rgb(117,117,117) or darker. The step numbers to
            rgb(110,109,107) or darker. "Terms & Privacy" to a lighter violet.
Not settled: 28 further elements sit over photographs. A ratio against a
            picture is not computable this way and is not guessed. Those are
            REQUIRES HUMAN and are listed in 03b-render.md.
```

### ELIGIBILITY

```
F-008   ELIGIBILITY
Provision : SD-GEN-RELEVANCE-1
            (reference/google/structured-data-general-guidelines.md:164)
Provision text
  "Your structured data must be a true representation of the page content."
Location  : samples/live-agent-ca/index.html:26 (the ld+json block)
            samples/live-agent-ca/index.html:231 (visible heading)
            samples/live-agent-ca/index.html:673 (footer)
Observed  : The JSON-LD `memberOf` names one brokerage. The visible body copy
            and one testimonial name a different brokerage. The footer names
            the first one again, with its own licence number.
Verdict   : FAIL
Why       : Two different brokerages are named on one page as the licensee's
            affiliation. Whichever is current, the markup and the visible
            content do not agree, and the provision requires that they do.
            This auditor does not decide which is correct; it reports that they
            differ and that a reader cannot tell.
Fix       : Make the markup and the visible copy name the same brokerage.
See also  : Q-001, which is the same fact declined as a licensing finding.
```

### ADVISORY

```
F-009   ADVISORY
Provision : SD-LB-REC-geo
            (reference/google/local-business-structured-data.md:99)
Provision text
  "geo, geo.latitude and geo.longitude are recommended. Precision must be at
   least 5 decimal places."
Location  : samples/live-agent-ca/index.html:26
Observed  : `address` is present as a PostalAddress with locality, region,
            postal code and country. `geo` is absent.
Verdict   : FAIL
Why       : Recommended, not required. The publisher's own word is
            "recommended", so nothing is lost by ignoring it and the band is
            ADVISORY. `SD-LB-REQ-address` and `SD-LB-REQ-name` both PASS.
Fix       : Add `geo` with five decimal places.
```

```
F-010   ADVISORY
Provision : SD-LB-REC-openingHoursSpecification
            (reference/google/local-business-structured-data.md:100)
Provision text
  "openingHoursSpecification is a recommended property."
Location  : samples/live-agent-ca/index.html:26
Observed  : Absent.
Verdict   : FAIL
Why       : Recommended. See F-009.
Fix       : Add it, or accept the gap deliberately.
```

```
F-011   ADVISORY
Provision : SD-LB-REC-priceRange
            (reference/google/local-business-structured-data.md:101)
Provision text
  "priceRange is recommended and must be shorter than 100 characters."
Location  : samples/live-agent-ca/index.html:26
Observed  : Absent.
Verdict   : FAIL
Why       : Recommended. See F-009.
Fix       : Add it, or accept the gap deliberately.
```

---

## 3. Queries the auditor refused to turn into findings

This section is the point of the tool. Both of these look like findings and neither is one.

```
Q-001   NOT ISSUED
Candidate : "The page names two different brokerages, so the responsible
            broker is not identified as 10 CCR 2773 requires."
Provision : CA-2773(a)-BROKER
            (reference/state/ca/10-ccr-2773.md:57)
Why not   : The provision requires that the responsible broker's name, as
            currently licensed, appear. **A brokerage name does appear**, in
            the footer, beside its own eight digit licence number. The
            provision is satisfied on its face. That a second brokerage is also
            named elsewhere is a real problem, but it is a problem with the
            markup matching the content, which is F-008, not a failure to
            disclose a broker. Grading it LEGAL would be promoting a finding
            for effect, which `rules.md` section 4 forbids.
Verdict   : `CA-2773(a)-BROKER` PASS, with the DRE record check left to a
            person at www2.dre.ca.gov.
```

```
Q-002   NOT ISSUED
Candidate : "The structured data lists ten localities in `areaServed`, which
            is the city list Google's spam policy names."
Provision : SPAM-KEYWORD-STUFFING
            (reference/google/spam-policies.md:125)
Why not   : Google's own example is "blocks of text that list cities and
            regions that a web page is trying to rank for". The artifact here
            is a structured data property whose documented purpose is to name
            the areas a business serves, not a block of text in the page body.
            The visible page does not carry a city list. Every spam policy also
            turns on intent, and intent is not in a file.
Verdict   : INSUFFICIENT EVIDENCE. What would settle it: whether these ten
            localities are places this licensee actually works, which is a
            question for the licensee and not for this auditor.
```

---

## 4. The provision ledger

Every provision checked, and how it came out. Long on purpose. An audit that lists only
problems is a complaint.

### Stage 01, freshness of the reference set

| Standard | Verdict | Reason |
|---|---|---|
| Every vendored standard | PASS | `./check-standards-freshness.sh` was run before this audit and reported no standard stale, withdrawn or unreachable. The standards that return HTTP 403 to `curl` were confirmed by hand in a browser: the five WCAG canaries, the CalOPPA canary and the Bing guidelines heading |
| `fair-housing/24-cfr-109-20-rescinded.md` | NOT APPLICABLE | Withdrawn from the CFR on 1 May 1996. Vendored as rescinded, for Tier B flags only. It can never produce a finding and it produced none here |

Stale: 0. Withdrawn: 0. Unreachable: 0. **The audit was allowed to proceed.**

### Stage 02, jurisdiction

| Provision | Verdict | Reason |
|---|---|---|
| Which state pack | California | The page carries an eight digit CA DRE licence number and the copy names California markets. No other state's rules are loaded, read or listed |

### Stage 04, indexability. Google Search technical requirements

| Provision | Verdict | Note |
|---|---|---|
| `GSE-TR-1` | PASS | robots.txt disallows only `/wp-admin/`. Googlebot is not blocked from the page under audit. |
| `GSE-TR-2` | PASS | HTTP 200, recorded in `NOTES.md` at capture. Without that record this would be INSUFFICIENT EVIDENCE. |
| `GSE-TR-3` | PASS | The page has indexable text content. |
| `GSE-TR-INDEXABLE-A` | PASS | HTML. |
| `GSE-TR-INDEXABLE-B` | PASS | See Q-002. No spam finding issued. |

`<meta name='robots' content='max-image-preview:large'>` at index.html:8 carries no `noindex`
and no `nofollow`.

### Stage 05, crawler access. RFC 9309 and the published crawler docs

| Provision | Verdict | Note |
|---|---|---|
| `RFC9309-2.1` | PASS | Served at `/robots.txt`, all lowercase. |
| `RFC9309-2.2.1` | PASS | `User-agent: *` is a valid product token. |
| `RFC9309-2.2.2` | PASS | `Allow` and `Disallow` lines are well formed. |
| `RFC9309-2.2.3` | PASS | The `Sitemap:` line resolves to a sitemap index that returned 200. |
| Google | PASS | Not blocked. |
| Bing | PASS | Not blocked. No Bing-specific group is present, so the `*` group applies. |
| GPTBot | PASS | Not blocked. The `*` group allows everything but `/wp-admin/`. |
| ClaudeBot | PASS | Not blocked. |
| PerplexityBot | PASS | Not blocked. |

**This site is readable by the AI assistants.** That is a deliberate default rather than a
decision, since no crawler is named in the file at all, but the outcome is that the licensee
is not invisible to them.

### Stage 06, structured data

| Provision | Verdict | Note |
|---|---|---|
| `SD-GEN-FORMAT-1` | PASS | JSON-LD, the recommended format. |
| `SD-GEN-ACCESS-1` | PASS | Not blocked. |
| `SD-GEN-CONTENT-4` | PASS | Every marked-up value appears in the visible page. |
| `SD-GEN-RELEVANCE-1` | **FAIL** | The markup's `memberOf` names one brokerage, the visible copy names a different one. The markup is not a true representation of the page. **F-008**. |
| `SD-GEN-COMPLETENESS-1` | PASS | Both required properties present. |
| `SD-GEN-COMPLETENESS-2` | PASS | Six recommended properties present. |
| `SD-GEN-LOCATION-1` | PASS | On the page it describes. |
| `SD-GEN-SPECIFICITY-1` | PASS | `RealEstateAgent` is more specific than `LocalBusiness`. |
| `SD-LB-SUBTYPE` | PASS | Same. |
| `SD-LB-REQ-name` | PASS | Present. |
| `SD-LB-REQ-address` | PASS | PostalAddress with locality, region, postal code, country. |
| `SD-LB-REC-telephone` | PASS | Present. |
| `SD-LB-REC-url` | PASS | Present. |
| `SD-LB-REC-geo` | **FAIL** | `geo` is absent from the ld+json block. Recommended, not required, so nothing is lost by leaving it out. **F-009**. |
| `SD-LB-REC-openingHoursSpecification` | **FAIL** | `openingHoursSpecification` is absent. Recommended, not required. **F-010**. |
| `SD-LB-REC-priceRange` | **FAIL** | `priceRange` is absent. Recommended, not required. **F-011**. |
| `SD-LB-REC-aggregateRating` | NOT APPLICABLE | Recommended only for sites reviewing *other* businesses. Absent, correctly. |
| `SD-LB-REC-review` | NOT APPLICABLE | Same. |
| Breadcrumb, FAQ, Article markup | NOT COVERED | Their property tables are not in `reference/`. |

**The self-serving rating trap was avoided here.** The page carries visible testimonials with
star ratings and does **not** mark them up as `aggregateRating`. That is the correct choice
and it is worth saying so.


### Stage 07, accessibility. WCAG 2.1 Level A and AA

Browser mode was run, so 34 of the 50 criteria were reached and 16 are honest gaps. **A clean
result on the 34 still does not mean this site is accessible**, because six criteria a browser
cannot settle and ten a machine cannot settle are all untested, and one page was supplied.

| Provision | Verdict | Note |
|---|---|---|
| `WCAG-1.1.1` | **FAIL** | One `<img>` carries no `src` at all, so its `alt` describes nothing to anyone. A second carries `alt=""` on the hero photograph, and whether that image is decorative is REQUIRES HUMAN and is not decided here. Mechanical half only. **F-007**. |
| `WCAG-1.3.1` | PASS | Headings are in order, `<label>` elements are associated, landmarks present. |
| `WCAG-1.3.2` | PASS | DOM order matches document order. CSS reordering is REQUIRES BROWSER. |
| `WCAG-1.3.5` | **FAIL** | Six fields collect the user's own name, email and phone, and not one carries an `autocomplete` attribute. All three map to tokens in the criterion's own list. **F-004**. |
| `WCAG-1.4.2` | NOT APPLICABLE | No `<audio>` or `<video>` on the page. |
| `WCAG-2.2.1` | PASS | No `<meta http-equiv="refresh">`. Script timers REQUIRES BROWSER. |
| `WCAG-2.2.2` | PASS | No `<marquee>`, no `<blink>`, no declared auto-advancing carousel. |
| `WCAG-2.4.1` | PASS | Landmark elements present. Whether a skip link works is REQUIRES BROWSER. |
| `WCAG-2.4.2` | PASS | `<title>` present and non-empty at index.html:7. |
| `WCAG-2.4.4` | PASS | No "click here" or bare "read more" link text on this page. |
| `WCAG-2.4.5` | PASS | Navigation, a search form and a sitemap are all reachable. |
| `WCAG-2.4.6` | PASS | Headings and labels are present and non-empty. Whether they are descriptive is REQUIRES HUMAN. |
| `WCAG-2.5.3` | PASS | No control carries an `aria-label` that contradicts its visible label. |
| `WCAG-3.1.1` | PASS | `lang="en-US"` at index.html:2. |
| `WCAG-3.1.2` | PASS | No other-language passages. |
| `WCAG-3.2.3` | NOT APPLICABLE | One page supplied. |
| `WCAG-3.2.4` | NOT APPLICABLE | One page supplied. |
| `WCAG-3.3.2` | **FAIL** | The site search input at index.html:175 has a placeholder and nothing else. No `<label>`, no `aria-label`, and a placeholder disappears the moment someone types. **F-005**. |
| `WCAG-4.1.1` | PASS | No duplicate `id` values. Tags are balanced. |
| `WCAG-4.1.2` | **FAIL** | The same search input has no programmatic name from any source, so a screen reader announces an unnamed text field. One defect, two provisions, two findings. **F-006**. |
| **Measured with the browser** | | |
| `WCAG-1.4.3` | **FAIL** | Four elements fall below 4.5:1: 3.88, 3.71, 3.71 and 4.28. 138 of 170 pass. 28 sit over photographs and are REQUIRES HUMAN. **F-012**, numbers in `03b-render.md` section 2. |
| `WCAG-2.4.7` | PASS | All 73 focusable elements change computed style on focus. |
| `WCAG-2.1.1` | PASS, reachability half | No element responds to click while being unreachable by Tab. Whether a custom widget can be *operated* by keyboard once focused is REQUIRES HUMAN. |
| `WCAG-2.1.2` | PASS | No focus trap found in the traversal. |
| `WCAG-1.4.10` | PASS | At 320px the page's `scrollWidth` is 320. No horizontal scrolling. |
| `WCAG-1.4.12` | PASS | The criterion's four spacing overrides applied cleanly. The two elements that appeared clipped are 1px screen reader labels, not visible text. |
| `WCAG-1.3.4` | PASS | Nothing locks the page to one orientation at either viewport. |
| `WCAG-1.3.2` | PASS | Visual order matched DOM order at every viewport measured. |
| `WCAG-2.4.1` | PASS | Landmarks present, and the skip link moves focus when activated. |
| `WCAG-1.4.4`, `1.4.11`, `2.4.3`, `3.2.1`, `3.2.2`, `3.3.1`, `4.1.3` | REQUIRES BROWSER | Reachable with a browser and not measured in this run. Named here rather than quietly counted as passes. |
| `WCAG-1.4.13`, `2.1.4`, `2.5.1`, `2.5.2`, `2.5.4`, `3.3.3` | REQUIRES HUMAN | A browser does not settle these either. Hover behaviour, single-key shortcuts, pointer gestures and error suggestion all need a person. |
| `WCAG-1.2.1` to `1.2.5`, `1.3.3`, `1.4.1`, `1.4.5`, `2.3.1`, `3.3.4` | REQUIRES HUMAN | Ten criteria. No tool settles these. |

**Coverage for this run: 34 of the 50 criteria reached, 16 not.** Sixteen honest gaps, named
above rather than hidden in a total.

### Stage 07, spam policies

| Provision | Verdict | Note |
|---|---|---|
| `SPAM-KEYWORD-STUFFING` | INSUFFICIENT EVIDENCE | Q-002. |
| `SPAM-DOORWAYS` | PASS | The neighbourhood pages were not captured, so only the page under audit is judged, and it is not a doorway. |
| `SPAM-SCRAPING` | PASS | The copy is original to this site as far as the artifact shows. |
| `SPAM-CLOAKING` | PASS | Nothing served differently to a crawler in the captured HTML. |
| `SPAM-HIDDEN-TEXT` | PASS | One hidden field exists at index.html:399 and it is an `aria-hidden` spam honeypot, which is an anti-spam measure, not hidden text for ranking. Saying so plainly matters: a lazier auditor would flag it. |
| The other 13 spam policies | NOT APPLICABLE | Nothing in the artifact engages them. |

### Stage 08, licence and broker. 10 CCR 2773

| Provision | Verdict | Note |
|---|---|---|
| `CA-2773(a)(3)` | PASS, scope met | This is the licensee's own site, per `NOTES.md`. The regulation applies. |
| `CA-2773(a)-LICENSE` | PASS | An eight digit number presented as a DRE licence number appears three times: index.html:150, index.html:236 and index.html:673. |
| `CA-2773(a)-BROKER` | PASS | A brokerage name and its own eight digit number appear at index.html:673. Whether it matches the current DRE record is REQUIRES HUMAN, settled at www2.dre.ca.gov. See Q-001. |
| `CA-2773(a)-EACH` | PASS | One licensee named, one licence number. The brokerage is named with its own. |
| `CA-2773(a)-TYPESIZE` | **PASS** | Measured, and it passes at both viewports. At 375px the header licence renders at **9px** and the smallest type anywhere on the page is also **9px**, which is that same element. At 1280px the smallest licence instance is **12px** and the smallest type on the page is **12px**. The rule is a relative floor, "no smaller than the smallest size type used in the solicitation material", so equal satisfies it. See `03b-render.md` section 1. |
| `CA-2773(b)` | NOT APPLICABLE | The exception covers signs, never websites. |

**A note on what this PASS does and does not mean, because it would be easy to misread.** The
licence number renders at **9 CSS pixels** on a phone. That is very small type. The regulation
does not set a minimum size; it sets a floor relative to the smallest type on the page, and
this page has no type smaller than its licence number. **So the rule is satisfied and this
auditor reports it satisfied.** Whether 9px is readable is not in the regulation, and turning
that opinion into a finding is exactly what this tool refuses to do. It is noted here, in
words, for the person who has to decide.

### Stage 09, listing images. AB 723

**Pass A, which needs no manifest and always runs. Added 2026-09-07.**

| Reading | Value |
|---|---|
| `<img>` elements on the page | **22** |
| Alteration disclosure wording anywhere in the visible text | **none** |
| A link to unaltered originals | **none** |

Searched for: "has been altered", "digitally altered", "virtually staged", "virtual staging",
"generative AI", "AI-generated", "computer generated", "rendering", "for illustrative purposes",
"added digitally" and eleven further variants. Zero hits.

**The result of pass A, in one sentence.** This page carries twenty-two images, contains no
alteration disclosure of any kind, and links to no unaltered originals. **If any one of those
twenty-two images was digitally altered, this page does not meet `CA-10140.8(a)(1)` today.**

**Pass B, which needs the manifest.**

| Provision | Verdict | Note |
|---|---|---|
| `CA-10140.8(b)(1)` | INSUFFICIENT EVIDENCE | `manifest.md` records every image as UNKNOWN, because the owner was never asked. |
| `CA-10140.8(b)(2)` | INSUFFICIENT EVIDENCE | Same. |
| `CA-10140.8(a)(1)-STATEMENT`, `-CONSPICUOUS`, `-LINK`, `-POINTER` | Conditional, resolved by pass A | Each bites only on an image classified as altered. None has been classified, so no finding is issued. Pass A has already established that if any is altered, none of the four is met. |
| `CA-10140.8(a)(2)` | Conditional, resolved by pass A | Same. There is no link to originals on the page for it to be satisfied by. |

**No image on this page has been cleared.** An absent fact is not a passing fact. What would
settle pass B: one sentence per image from whoever made the site, saying what was done to it.
This auditor does not look at images and will not guess.

### Stage 10, fair housing. 24 CFR 100.75

**This stage issues no verdict. It flags and hands over.** Every row below is REQUIRES HUMAN.
Not one is a finding, and none of them is called discrimination by this tool.

| Line | The phrase, in its sentence | Why it is listed | Verdict |
|---|---|---|---|
| index.html:368 | "Modern, connected, and central. UC blends innovation hubs with **family-friendly** streets." | A **proxy**, not a direct reference. `FHA-100.75(c)(1)` reaches wording that "indicates any preference, limitation or discrimination". Familial status is a protected class, and "family-friendly" is the most common phrase in real estate copy that touches it | REQUIRES HUMAN |
| index.html:366 | "Bohemian, **walkable**, and unmistakably original." | A proxy on the handicap limb. Listed because walkability is sometimes read as a comment on who the area suits | REQUIRES HUMAN |
| index.html:519 | Blog title: "What It's Like to Live in **Walkable** La Jolla Village" | Same proxy, same reasoning | REQUIRES HUMAN |
| index.html:371 | "Tree-lined streets, Spanish-revival architecture, and one of San Diego's most **storied** addresses." | Listed only because prestige language sometimes carries an implied audience. This is the weakest item here and is listed rather than dropped so a person, not this tool, decides | REQUIRES HUMAN |

**Direct references to a protected class: none found.** No race, colour, religion, sex,
handicap or national origin term appears in the visible copy. That is **not** a finding of
compliance and this auditor does not make one, because an absent obvious phrase is not
evidence. Fair housing turns on what a phrase indicates in context, and a person decides.

`FHA-100.75(c)(1)` also reaches "photographs, illustrations, symbols". Nine `alt` attributes
describe images of people. **The images themselves were not seen.** Alt text is not the
picture, and this stage does not pretend otherwise.

Note for the reader: the Equal Housing Opportunity logo is absent from this page and **that is
not a federal violation**. The logo requirement lived in 24 CFR Part 109, which was removed
from the eCFR on 26 October 2020. A brokerage, an MLS or state law may still require it.

### Stage 11, privacy and consent

| Provision | Verdict | Note |
|---|---|---|
| `CALOPPA-22575(a)-COLLECTS` | PASS, scope met | Three forms capture name, email and telephone. |
| `CALOPPA-22575(a)-POSTED` | **FAIL** | The only policy link on the page reads "Terms & Privacy" and points at `/terms-and-conditions/`. No link names a privacy policy as its own document. **F-003**. |
| `CALOPPA-22575(a)-CONSPICUOUS` | REQUIRES HUMAN | Whether a reader notices a combined "Terms & Privacy" link is not a machine question. |
| `TCPA-64.1200(f)(9)-SCOPE` | PASS, scope met on its first limb | Both lead forms capture a telephone number. Whether the licensee autodials is REQUIRES HUMAN and is not assumed. |
| `TCPA-64.1200(f)(9)-AGREEMENT` | **FAIL** | Both lead forms capture a phone number and neither carries any consent text, checkbox, or mention of calls or texts. There is nothing at the point of capture to consent to. **F-001**. |
| `TCPA-64.1200(f)(9)(i)(A)` | **FAIL** | The disclosure that signing authorises autodialed or prerecorded marketing is absent from both forms. Reported inside F-001 rather than as its own finding, because one added sentence closes both. |
| `TCPA-64.1200(f)(9)(i)(B)` | **FAIL** | The sentence saying consent is not a condition of purchase is absent from both forms, and so is every paraphrase of it. This is the one most often missing. **F-002**. |
| `TCPA-64.1200(f)(3)` | REQUIRES HUMAN | There is no disclosure to judge for conspicuousness. |

### Stage 12, link integrity

| Provision | Verdict | Reason |
|---|---|---|
| `LINK-REL-sponsored` | NOT APPLICABLE | The artifact identifies no link as paid, sponsored or an advertisement. A `grep` for `rel="sponsored"` across the page returns 0 |
| `LINK-REL-ugc` | NOT APPLICABLE | The testimonials on this page carry no links, so there is no user generated block for the provision to reach |
| `LINK-REL-nofollow` | Reported, never required | No link on this page carries `nofollow` |
| `LINK-REL-NONE` | NOT APPLICABLE | Not reached. Nothing carries an unexplained `nofollow` |
| `LINK-REL-MULTIPLE` | PASS | Five outbound links, every one of them carrying exactly `rel="noopener noreferrer"`. No conflicting combination |
| Outbound link inventory | Reported | 61 `<a>` tags, of which 5 leave the host: Facebook, Instagram, LinkedIn, a Google search result and a Zillow profile. All five are the licensee's own profiles, all five open in a new tab, all five carry `noopener noreferrer` |
| `BING-5` | NOT APPLICABLE | Reachability is a property of a site, not of a page. This auditor audits one page, so the guideline has nothing here to apply to. Named rather than silently dropped, so a reader knows it was considered |
| `BING-7` | NOT APPLICABLE | Redirect handling is a property of a server, not of a saved page. Named rather than silently dropped |
| Dead links | INSUFFICIENT EVIDENCE | Following the 61 links would mean requesting the real host, which this run does not do |

**Added 2026-09-07.** This stage did not exist when the run was first written on 2026-09-05.
The check was performed against the same committed artifact, which has not changed, so the
result stands with the rest of the run.

---

## 5. Not checked, and worth checking yourself

This audit covers the standards in `reference/`. It did not check the NAR Code of Ethics, this
licensee's MLS rules, or their brokerage's own advertising policy. Those apply to them and this
tool cannot read them. Article 12 of the NAR Code, on advertising presenting a true picture, is
the closest in subject to what this audit does cover, and is worth reading next to F-008.

## 6. What would make this audit better

Named honestly rather than buried.

1. **Run Lighthouse against the live domain.** Speed is the only stage a saved copy cannot
   answer, and it is the only one still empty.
2. **Ask the owner how the photographs were made.** That turns four INSUFFICIENT EVIDENCE rows
   into real verdicts.
3. **Capture the terms and conditions page.** That settles whether F-003 is a missing link or a
   missing document.
4. **Capture more than one page.** Two WCAG criteria are NOT APPLICABLE purely because one page
   was supplied.
