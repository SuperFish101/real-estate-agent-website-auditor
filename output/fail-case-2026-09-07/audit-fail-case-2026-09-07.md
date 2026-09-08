# Audit: samples/fail-case/ (Marisol Vega Real Estate, fictional)

| | |
|---|---|
| Audited | 2026-09-07 |
| Artifact | `samples/fail-case/` |
| Files read | `index.html` (80 lines), `robots.txt` (9), `manifest.md`, `NOTES.md` |
| Jurisdiction | **California**, settled by the eight digit CA DRE number in the footer |
| Browser mode | **Run, and it hit its own guard.** The page links a stylesheet that is not in the folder, so it rendered unstyled. Every colour and type size row stays REQUIRES BROWSER. Details in `03b-render.md` |
| Standards | Those registered in `reference/README.md`, at the retrieval dates in their provenance tables |

This is a real run of this auditor against the shipped failing sample. It is committed as
evidence, so a reader can check the findings against the sample and the sample against the
standards without running anything.

**Nothing here is a real business.** `fail-case/` is hand-built fiction with a defect seeded
against every severity band, and `pass-case/` is the same site with each of them repaired. The
pair is a known-answer test: you cannot prove an auditor catches things unless you already know
what is there to catch. The real-website tests are the three `live-*` runs in this folder.

**Re-run 2026-09-07.** The first run of this fixture was on 2026-09-03, against six standards
and eight stages. The auditor now holds eighteen standards and fourteen stages, so the fixture
was audited again from the beginning. **Five findings are new**, and every one of them comes
from a standard that was not vendored in September's first week: the responsible broker rule,
the California privacy law, and three separate parts of the federal written-consent rule. The
original twenty-two all still stand, unchanged, renumbered only where the new ones sit ahead of
them in severity order.

---

## 1. Summary

| Severity | Findings |
|---|---|
| LEGAL | 10 |
| BLOCKING | 2 |
| ACCESS | 9 |
| ELIGIBILITY | 3 |
| ADVISORY | 3 |
| **Total** | **27** |

Plus 1 query resolved as INSUFFICIENT EVIDENCE rather than issued as a finding.

Verdict counts across all 141 provisions checked:

| Verdict | Count |
|---|---|
| PASS | 24 |
| FAIL | 27 |
| NOT APPLICABLE | 32 |
| INSUFFICIENT EVIDENCE | 12 |
| REQUIRES BROWSER | 16 |
| REQUIRES HUMAN | 22 |
| NOT COVERED | 8 |

---

## 2. Findings

### LEGAL

Three images on this page are digitally altered images under `CA-10140.8(b)(1)`
(`reference/state/ca/bpc-10140-8-ab-723.md:80`), on the evidence of `manifest.md`:

| Image | Line | Manifest says | Named in b(1) as |
|---|---|---|---|
| `img/kitchen-staged.jpg` | index.html:45 | "Furniture and a fruit bowl added with generative AI" | furniture |
| `img/living-staged.jpg` | index.html:46 | "Sofa, rug and wall art added with generative AI. Wall paint colour changed from beige to white" | furniture, paint color |
| `img/floorplan-render.png` | index.html:47 | "3D cutaway render generated from the property's floor plan" | floor plans |

`NOTES.md:3` states the brokerage and all listings are in California, so the statute applies.

```
F-001   LEGAL
Provision : CA-10140.8(a)(1)-STATEMENT
            (reference/state/ca/bpc-10140-8-ab-723.md:87)
Provision text
  "shall include in the advertisement or promotional material a statement
   disclosing that the image has been altered"
Location  : samples/fail-case/index.html:45, :46, :47
Observed  : <img src="img/kitchen-staged.jpg" width="800">
            <img src="img/living-staged.jpg" width="800">
            <img src="img/floorplan-render.png" width="800">
Verdict   : FAIL
Why       : No statement of alteration appears anywhere in the file. Searched
            the whole of index.html for "altered", "alter", "AI", "virtual",
            "staged", "digitally" and "render": the only matches are inside the
            image file names themselves, which are not a statement to the
            reader.
Fix       : Put a statement on or next to each of the three images saying it has
            been altered. samples/pass-case/index.html:77-82 shows the shape.
See also  : F-002, F-003, F-004. Same images, three further obligations.
Note      : Not legal advice. This reports that an artifact does not match a
            statute's text.

F-002   LEGAL
Provision : CA-10140.8(a)(1)-CONSPICUOUS
            (reference/state/ca/bpc-10140-8-ab-723.md:88)
Provision text
  "The statement shall be reasonably conspicuous and located on or adjacent to
   the image."
Location  : samples/fail-case/index.html:45, :46, :47
Observed  : Nothing adjacent to any of the three img elements. Line 44 is a
            heading, line 48 is a photograph, line 50 is the price paragraph.
Verdict   : FAIL
Why       : There is no statement at all, so it cannot be conspicuous or
            adjacent. This is a separate obligation from F-001 because a site
            can satisfy F-001 with a footer disclaimer and still fail this one.
Fix       : Place the statement in the same figure element as the image.
See also  : F-001.

F-003   LEGAL
Provision : CA-10140.8(a)(1)-LINK
            (reference/state/ca/bpc-10140-8-ab-723.md:89)
Provision text
  "a link to a publicly accessible internet website, URL, or QR code that
   includes, and clearly identifies, the original, unaltered image"
Location  : samples/fail-case/index.html:45, :46, :47
Observed  : The only links on the page are /contact.html, /docs/disclosures.pdf,
            /listings.html, / and /about.html. None of them holds unaltered
            images.
Verdict   : FAIL
Why       : No link, URL or QR code to the originals exists. manifest.md names
            img/kitchen-raw.jpg and img/living-raw.jpg as the originals, so they
            exist and are simply not published.
Fix       : Publish an originals page holding img/kitchen-raw.jpg and
            img/living-raw.jpg and the source floor plan, each clearly
            identified, and link to it from each statement.
See also  : F-001, F-005.

F-004   LEGAL
Provision : CA-10140.8(a)(1)-POINTER
            (reference/state/ca/bpc-10140-8-ab-723.md:90)
Provision text
  "shall include language indicating that the unaltered images can be accessed
   on the linked internet website, URL, or QR code"
Location  : samples/fail-case/index.html:45, :46, :47
Observed  : No statement, therefore no such language.
Verdict   : FAIL
Why       : The statute requires the statement itself to tell the reader where
            the originals are. This is a third distinct obligation: a site can
            have a statement and a link and still fail this if the statement
            does not say the link leads to the originals.
Fix       : Wording that satisfies all four at once is at
            samples/pass-case/index.html:77-82.
See also  : F-001, F-003.

F-005   LEGAL
Provision : CA-10140.8(a)(2)
            (reference/state/ca/bpc-10140-8-ab-723.md:91)
Provision text
  "If an advertisement or promotional material described in paragraph (1) is
   posted on an internet website over which the real estate broker or
   salesperson, or person acting on their behalf, has control, they shall
   include the unaltered version of the images from which the digitally altered
   images were created in the posting."
Location  : samples/fail-case/index.html:45, :46, :47
Observed  : The posting contains the altered images only.
Verdict   : FAIL
Why       : NOTES.md:4 states the site is the agent's own WordPress site, so it
            is a website she controls and this paragraph applies. Neither the
            unaltered versions nor a compliant link to them is in the posting.
Fix       : Include the unaltered images in the posting, or link out as F-003
            describes. The statute allows either.
See also  : F-003.
```

```
F-006   LEGAL
Provision : CA-2773(a)-BROKER
            (reference/state/ca/10-ccr-2773.md:57)
Provision text
  The responsible broker's name, as currently licensed, must appear.
Location  : samples/fail-case/index.html:76 (the footer, where it should have
            been and is not)
Observed  : "Marisol Vega, DRE #01234567. Copyright 2026."
            grep across the whole page for "broker", "brokerage", "Inc",
            "Realty", "Group" and "Associates" returns 0 hits.
Verdict   : FAIL
Why       : `CA-2773(a)(3)` is met: this is the licensee's own website, so it
            is solicitation material. NOTES.md:2 states she is a licensed
            salesperson. A salesperson advertises under their responsible
            broker, and the rule asks for that broker's name as currently
            licensed. The only business name on the page is "Marisol Vega Real
            Estate", which is the licensee's own name and not a brokerage.
Fix       : Add the responsible broker's licensed name to the footer, beside
            the licence number. `samples/pass-case/index.html:121` shows the
            shape.
See also  : none.
Not legal advice. This reproduces a regulation and reports whether the artifact
matches its text.
```

```
F-007   LEGAL
Provision : CALOPPA-22575(a)-POSTED
            (reference/state/ca/bpc-22575-caloppa.md:46)
Provision text
  "shall conspicuously post its privacy policy on its Web site"
Location  : samples/fail-case/index.html:76 (the footer)
Observed  : A case-insensitive grep for "privacy" across the whole page
            returns 0 hits. Not a link, not a heading, not a sentence.
Verdict   : FAIL
Why       : `CALOPPA-22575(a)-COLLECTS` is met: the enquiry form at
            index.html:58-64 captures a name, an email address and a telephone
            number. The obligation therefore applies. Nothing is posted.
Fix       : Publish a privacy policy and link to it from the footer with link
            text reading "Privacy Policy".
See also  : none. `CALOPPA-22575(a)-CONSPICUOUS` is not reached, because
            nothing is posted for the manner of posting to be judged.
Not legal advice. This reproduces a statute and reports whether the artifact
matches its text.
```

```
F-008   LEGAL
Provision : TCPA-64.1200(f)(9)-AGREEMENT
            (reference/fcc/47-cfr-64-1200-consent.md:50)
Provision text
  "An agreement in writing, bearing a signature, that clearly authorizes the
   seller"
Location  : samples/fail-case/index.html:61 (the telephone field)
Observed  : <input type="tel" name="phone" placeholder="Phone">
            The form contains no consent text, no checkbox and no reference to
            calls or texts. grep for "consent", "agree", "autodial" and "text
            message" across the form markup returns 0.
Verdict   : FAIL
Why       : `TCPA-64.1200(f)(9)-SCOPE` is met on its first limb: the form
            captures a telephone number. Whether this licensee then autodials
            is REQUIRES HUMAN and is NOT assumed here. What is established from
            the artifact is that if she does, the written consent this section
            requires is not being obtained at the point of capture, because
            there is nothing at that point to consent to.
Fix       : Add a consent sentence beside the phone field, tied to a deliberate
            act such as an unticked checkbox.
See also  : F-009, F-010.
Not legal advice. This reproduces a regulation and reports whether the artifact
matches its text.
```

```
F-009   LEGAL
Provision : TCPA-64.1200(f)(9)(i)(A)
            (reference/fcc/47-cfr-64-1200-consent.md:51)
Provision text
  "Disclosure that signing authorizes autodialed or prerecorded telemarketing"
Location  : samples/fail-case/index.html:58-64
Observed  : The disclosure is absent. grep for "autodial", "automatic
            telephone dialing", "prerecorded" and "artificial voice" across the
            whole page returns 0.
Verdict   : FAIL
Why       : This is a separate obligation from F-008 and is listed separately
            in the section, so it is cited separately here rather than stacked.
Fix       : Name automated contact in the consent sentence, for example
            "including autodialed or prerecorded calls and texts".
See also  : F-008, F-010.
Not legal advice. This reproduces a regulation and reports whether the artifact
matches its text.
```

```
F-010   LEGAL
Provision : TCPA-64.1200(f)(9)(i)(B)
            (reference/fcc/47-cfr-64-1200-consent.md:52)
Provision text
  "Disclosure that signing is not a condition of purchasing any property,
   goods or services"
Location  : samples/fail-case/index.html:58-64
Observed  : The sentence is absent, and so is every paraphrase of it. grep for
            "not a condition", "condition of purchase" and "condition of
            purchasing" returns 0.
Verdict   : FAIL
Why       : A third separate obligation, and the one most often missing in
            practice.
Fix       : The words "Consent is not a condition of purchase" beside the
            consent checkbox. `samples/pass-case/index.html:105-111` shows all
            three obligations met together.
See also  : F-008, F-009.
Not legal advice. This reproduces a regulation and reports whether the artifact
matches its text.
```

### BLOCKING

```
F-011   BLOCKING
Provision : GSE-TR-1  (reference/google/technical-requirements.md:74)
Provision text
  "Googlebot isn't blocked."
  The section beneath it: "if one of the several mechanisms are used to block
  Google from indexing, the page will not be indexed."
Location  : samples/fail-case/index.html:5
Observed  : <meta name="robots" content="noindex, follow">
Verdict   : FAIL
Why       : noindex instructs Google not to index the page. The page therefore
            cannot appear in search results at all, whatever else is done to it.
Fix       : Delete line 5.
See also  : F-012, a second and independent block on the same page.
Consequence, in the publisher's words
  The page is not eligible to be indexed by Google Search.

F-012   BLOCKING
Provision : GSE-TR-1  (reference/google/technical-requirements.md:74)
Provision text
  "Googlebot isn't blocked."
Location  : samples/fail-case/robots.txt:7-8
Observed  : User-agent: Googlebot
            Disallow: /
Verdict   : FAIL
Why       : RFC9309-2.2.1 requires a crawler to obey the group matching its own
            product token in preference to the "*" group. Googlebot matches the
            group at line 7, which disallows the whole site. The permissive "*"
            group at lines 3 to 5 does not apply to it.
Fix       : Delete the Googlebot group, or give it the same rules as the "*"
            group.
See also  : F-011. Two separate mechanisms, two separate findings, because
            fixing one leaves the other in place.
```

### ACCESS

Nine Level A and AA criteria are not satisfied. Under `WCAG-CONFORMANCE-5.2.1`
(`reference/wcag/conformance.md:17`), one unsatisfied criterion is enough
for the page not to conform at Level AA.

```
F-013   ACCESS
Provision : WCAG-2.4.2  (reference/wcag/2-operable.md:181)
Provision text
  "Web pages have titles that describe topic or purpose."
Location  : samples/fail-case/index.html:6
Observed  : <title></title>
Verdict   : FAIL
Why       : The element is present but empty, so it describes neither topic nor
            purpose.
Fix       : "2736 5th St, Davis CA | Marisol Vega Real Estate" or similar.

F-014   ACCESS
Provision : WCAG-1.1.1  (reference/wcag/1-perceivable.md:24)
Provision text
  "All non-text content that is presented to the user has a text alternative
   that serves the equivalent purpose"
Location  : samples/fail-case/index.html:29, :45, :46, :47
Observed  : <img src="img/logo.png" width="180">
            <img src="img/kitchen-staged.jpg" width="800">
            <img src="img/living-staged.jpg" width="800">
            <img src="img/floorplan-render.png" width="800">
Verdict   : FAIL
Why       : Four img elements carry no alt attribute at all. A screen reader
            announces the file name or nothing. The fifth image on the page,
            line 48, does carry alt and is not part of this finding.
Fix       : Add alt describing what each image shows. If the logo is decorative
            beside adjacent text, alt="" is correct for it.
Note      : Whether existing alt text is *equivalent* is REQUIRES HUMAN. This
            finding is only about absence, which is mechanical.

F-015   ACCESS
Provision : WCAG-4.1.1  (reference/wcag/4-robust.md:24)
Provision text
  "In content implemented using markup languages, elements have complete start
   and end tags, elements are nested according to their specifications,
   elements do not contain duplicate attributes, and any IDs are unique"
Location  : samples/fail-case/index.html:28, :68
Observed  : <header id="top">
            <footer id="top">
Verdict   : FAIL
Why       : id="top" appears twice. IDs must be unique.
Fix       : Rename one, for example id="site-footer".

F-016   ACCESS
Provision : WCAG-2.4.4  (reference/wcag/2-operable.md:198)
Provision text
  "The purpose of each link can be determined from the link text alone or from
   the link text together with its programmatically determined link context"
Location  : samples/fail-case/index.html:52, :53, :54
Observed  : <a href="/contact.html">click here</a>
            <a href="/docs/disclosures.pdf">click here</a>
            <a href="/listings.html">click here</a>
Verdict   : FAIL
Why       : Three links in one paragraph share the text "click here" and lead to
            three different places. A screen reader user listing the links hears
            the same phrase three times.
Fix       : "book a tour", "download the disclosure packet", "see more photos".

F-017   ACCESS
Provision : WCAG-1.3.1  (reference/wcag/1-perceivable.md:113)
Provision text
  "Information, structure, and relationships conveyed through presentation can
   be programmatically determined or are available in text."
Location  : samples/fail-case/index.html:38, :42
Observed  : <h3>Marisol Vega Real Estate</h3>
            ... <h1>Featured listing: 2736 5th St, Davis</h1>
Verdict   : FAIL
Why       : An h3 precedes the only h1, so the heading levels do not express the
            document's real structure. Nothing on the page is at level 2.
Fix       : Make the business name the h1 or a non-heading, and promote the
            listing heading so levels descend without gaps.

F-018   ACCESS
Provision : WCAG-3.3.2  (reference/wcag/3-understandable.md:83)
Provision text
  "Labels or instructions are provided when content requires user input."
Location  : samples/fail-case/index.html:59, :60, :61, :62
Observed  : <input type="text" name="fullname" placeholder="Your name">
            <input type="email" name="email" placeholder="Email">
            <input type="tel" name="phone" placeholder="Phone">
            <textarea name="message" rows="4" placeholder="Message"></textarea>
Verdict   : FAIL
Why       : All four controls rely on placeholder text alone. A placeholder is
            not a label: it disappears as soon as the field is typed into, so
            the user loses the only instruction they had.
Fix       : Add a label element bound with for and id to each control.
            samples/pass-case/index.html:93-103 shows all four done.

F-019   ACCESS
Provision : WCAG-1.3.5  (reference/wcag/1-perceivable.md:155)
Provision text
  "The purpose of each input field collecting information about the user can be
   programmatically determined when: The input field serves a purpose
   identified in the Input Purposes for User Interface Components section; and
   The content is implemented using technologies with support for identifying
   the expected meaning for form input data."
Location  : samples/fail-case/index.html:59, :60, :61
Observed  : No autocomplete attribute on the name, email or phone fields.
Verdict   : FAIL
Why       : Name, email and telephone are all listed input purposes, and HTML
            supports autocomplete, so both conditions of the criterion are met
            and the attribute is required.
Fix       : autocomplete="name", autocomplete="email", autocomplete="tel".

F-020   ACCESS
Provision : WCAG-4.1.2  (reference/wcag/4-robust.md:47)
Provision text
  "For all user interface components ... the name and role can be
   programmatically determined"
Location  : samples/fail-case/index.html:59, :60, :61, :62
Observed  : Four form controls with no label, no aria-label and no
            aria-labelledby.
Verdict   : FAIL
Why       : Each control has a role from its element type, but no accessible
            name. This is a different provision from F-018: 3.3.2 is about the
            user seeing an instruction, 4.1.2 is about assistive technology
            being able to name the control.
Fix       : The same fix as F-018 satisfies both.

F-021   ACCESS
Provision : WCAG-3.1.1  (reference/wcag/3-understandable.md:24)
Provision text
  "The default human language of each web page can be programmatically
   determined."
Location  : samples/fail-case/index.html:1
Observed  : <html>
Verdict   : FAIL
Why       : No lang attribute, so a screen reader falls back to its own default
            voice and may read English content with the wrong pronunciation
            rules.
Fix       : <html lang="en">
```

### ELIGIBILITY

```
F-022   ELIGIBILITY
Provision : SD-LB-REQ-address
            (reference/google/local-business-structured-data.md:96)
Provision text
  "address | PostalAddress. The physical location of the business."
  Listed under "Required properties".
Location  : samples/fail-case/index.html:9-21
Observed  : The LocalBusiness object declares name, telephone, url, award and
            aggregateRating. There is no address key.
Verdict   : FAIL
Why       : address is one of only two required properties. SD-GEN-COMPLETENESS-1
            (reference/google/structured-data-general-guidelines.md:165) states
            "Items that are missing required properties are not eligible for
            rich results."
Fix       : Add a PostalAddress with streetAddress, addressLocality,
            addressRegion, postalCode and addressCountry.
            samples/pass-case/index.html:13-20 shows the shape.

F-023   ELIGIBILITY
Provision : SD-GEN-CONTENT-4
            (reference/google/structured-data-general-guidelines.md:161)
Provision text
  "Don't mark up content that is not visible to readers of the page. For
   example, if the JSON-LD markup describes a performer, the HTML body must
   describe that same performer."
Location  : samples/fail-case/index.html:15
Observed  : "award": "Voted #1 Agent in Yolo County 2025"
Verdict   : FAIL
Why       : The award appears only inside the script block. Searching the body
            text for "award", "Voted", "#1" and "Yolo" returns no match outside
            the markup.
Fix       : Put the award in the visible page content, or remove it from the
            markup.

F-024   ELIGIBILITY
Provision : SD-GEN-CONTENT-5
            (reference/google/structured-data-general-guidelines.md:162)
Provision text
  "Don't mark up irrelevant or misleading content, such as fake reviews or
   content unrelated to the focus of a page."
Location  : samples/fail-case/index.html:16-20
Observed  : "aggregateRating": { "ratingValue": 5, "ratingCount": 214 }
Verdict   : FAIL
Why       : Google recommends aggregateRating on LocalBusiness "only for sites
            that capture reviews about other local businesses"
            (SD-LB-REC-aggregateRating,
            reference/google/local-business-structured-data.md:102). NOTES.md:5
            states this site rates its own service and hosts no reviews of any
            other business, so the qualifier is not met and the markup presents
            a self-assigned rating as review data.
Fix       : Remove the aggregateRating object. Star ratings for a business's own
            service belong in a review platform Google reads independently.
See also  : SD-LB-REC-aggregateRating.
```

### ADVISORY

```
F-025   ADVISORY
Provision : SD-GEN-SPECIFICITY-1
            (reference/google/structured-data-general-guidelines.md:168)
Provision text
  "Try to use the most specific applicable type and property names defined by
   schema.org for your markup."
Location  : samples/fail-case/index.html:11
Observed  : "@type": "LocalBusiness"
Verdict   : FAIL
Why       : schema.org defines RealEstateAgent as a subtype of LocalBusiness,
            and it applies exactly. SD-LB-SUBTYPE
            (reference/google/local-business-structured-data.md:105) repeats the
            instruction: "Use the most specific LocalBusiness sub-type possible."
Fix       : "@type": "RealEstateAgent"
Note      : ADVISORY, not ELIGIBILITY. LocalBusiness is valid and the item stays
            eligible. The publisher's word here is "Try to".

F-026   ADVISORY
Provision : SD-LB-REC-telephone
            (reference/google/local-business-structured-data.md:97)
Provision text
  "telephone | Text. A business phone number meant to be the primary contact
   method for customers. Be sure to include the country code and area code in
   the phone number."
Location  : samples/fail-case/index.html:13
Observed  : "telephone": "5305550142"
Verdict   : FAIL
Why       : Area code is present, country code is not.
Fix       : "+15305550142"

F-027   ADVISORY
Provision : RFC9309-2.2.2
            (reference/ietf/rfc-9309-robots-exclusion-protocol.md:49)
Provision text
  "The crawler SHOULD ignore 'disallow' and 'allow' rules that are not in any
   group (for example, any rule that precedes the first user-agent line)."
Location  : samples/fail-case/robots.txt:1
Observed  : Disallow: /wp-admin/
Verdict   : FAIL
Why       : This rule sits above the first user-agent line, so it is in no
            group and a conforming crawler ignores it. The author intended to
            block /wp-admin/ and it is not blocked.
Fix       : Move the line inside the "User-agent: *" group.
Note      : ADVISORY because RFC 9309 imposes duties on crawlers, not on site
            owners. Nothing is penalised. The file simply does not do what its
            author intended.
```

### Queried, not issued

```
Q-001   INSUFFICIENT EVIDENCE
Provision : SPAM-KEYWORD-STUFFING  (reference/google/spam-policies.md:125)
Provision text
  "Keyword stuffing refers to the practice of filling a web page with keywords
   or numbers in an attempt to manipulate rankings in Google Search results."
  Listed example: "Blocks of text that list cities and regions that a web page
  is trying to rank for".
Location  : samples/fail-case/index.html:69-74
Observed  : One paragraph naming 47 cities and neighbourhoods, with no other
            content in it, ranging from Davis to Placerville and Elk Grove.
Verdict   : INSUFFICIENT EVIDENCE
Why       : The provision turns on intent, "in an attempt to manipulate
            rankings", and intent is not visible in a file. A genuine
            service-area list and a stuffed footer are identical in source.
What would settle it
  Whether the agent in fact serves all 47 areas, and whether each name links to
  a page with its own content. NOTES.md:2 says the brokerage and all listings
  are in Yolo County, which covers Davis, Woodland, Winters, Esparto, Madison,
  Capay, Yolo, Knights Landing and Clarksburg. It does not cover Placerville,
  Folsom, Roseville, Rocklin, Auburn or Granite Bay, which are 40 to 70 miles
  away in other counties. That is a reason to ask, not a finding.
Severity if confirmed : BLOCKING
```

---

---

## 3. The full provision ledger

Every provision this auditor holds, with its verdict and the reason in the row.

### Stage 01, freshness of the reference set

| Standard | Verdict | Reason |
|---|---|---|
| 15 of 23 vendored standards | PASS | `./check-standards-freshness.sh` compared each against its live source and found the canary text unchanged |
| The 5 WCAG files, CalOPPA, the Bing guidelines | PASS | Blocked to `curl` with HTTP 403 or JavaScript-only. All seven canaries confirmed by hand in a browser. WCAG reads "W3C Recommendation 06 May 2025" with no superseded notice; CalOPPA was confirmed against the official California Legislative Counsel text, last amended Stats. 2013 Ch. 390 |
| `fair-housing/24-cfr-109-20-rescinded.md` | NOT APPLICABLE | Withdrawn from the CFR on 1 May 1996. Flags only, never a finding, and it produced none |

Stale: 0. Withdrawn: 0. Unreachable: 0. **The audit was allowed to proceed.**

### Stage 02, jurisdiction

| Provision | Verdict | Reason |
|---|---|---|
| Which state pack | California | `index.html:76` carries "DRE #01234567", the CA DRE format, and `NOTES.md:2` says all listings are in Yolo County. No other state's rules are loaded, read or listed |

### Stage 04, can this page be indexed

| Provision | Verdict | Reason |
|---|---|---|
| `GSE-TR-1` | **FAIL** | Two separate blocks. `index.html:5` carries `<meta name="robots" content="noindex, follow">`, and `robots.txt:7-8` carries a `Googlebot` group with `Disallow: /`. **F-011**, **F-012** |
| `GSE-TR-2` | INSUFFICIENT EVIDENCE | A saved file carries no HTTP status code, and `NOTES.md` does not record one. What would settle it: a `curl -I` against the live host |
| `GSE-TR-3` | PASS | Headings, body copy, a listing description and a form. There is indexable content, even though the page asks not to be indexed |
| `GSE-TR-INDEXABLE-A` | PASS | `text/html`, a file type Google Search supports |
| `GSE-TR-INDEXABLE-B` | INSUFFICIENT EVIDENCE | Depends on the spam pass, which resolved to INSUFFICIENT EVIDENCE on `SPAM-KEYWORD-STUFFING`. See **Q-001** |
| `<link rel="canonical">` | Reported | Absent. No provision in `reference/` requires one on a single page, so this is an observation and not a finding |

### Stage 05, crawler access

| Provision | Verdict | Reason |
|---|---|---|
| `RFC9309-2.2.1` | PASS | Two groups, `*` and `Googlebot`. Both product tokens use only permitted characters |
| `RFC9309-2.2.2` | **FAIL** | `robots.txt:1` carries `Disallow: /wp-admin/` before any user-agent line. The RFC says a crawler SHOULD ignore allow and disallow rules that are not in any group, naming this exact case. The rule does nothing. **F-027** |
| `RFC9309-2.2.3` | NOT APPLICABLE | No special characters used, so there is nothing to support |
| `RFC9309-2.2.4` | PASS | One `Sitemap:` record, correctly not terminating a group |
| `RFC9309-2.3` | PASS | Named `robots.txt` and supplied as the host's own |
| `SM-REQ-urlset`, `SM-REQ-url`, `SM-REQ-loc` | INSUFFICIENT EVIDENCE | `robots.txt:10` declares `https://example-agent-site.test/sitemap.xml`, and **that file was not supplied with the artifact**. What would settle it: include the sitemap in the folder |
| `SM-FILE-1` to `SM-FILE-6` | INSUFFICIENT EVIDENCE | Same reason. Nothing to parse, count or measure |
| `SM-OPT-lastmod`, `SM-OPT-changefreq`, `SM-OPT-priority` | NOT APPLICABLE | Optional tags in a file that was not supplied. Absence is never a failure |
| `INDEXNOW-VERIFY-2` | NOT APPLICABLE | No `{key}.txt` file and none named in `NOTES.md`. IndexNow is optional and no publisher requires it. `BING-4` says adopting it would tell Bing about changes faster |
| `INDEXNOW-KEY-1` | NOT APPLICABLE | Not reached. There is no key file to be malformed |
| `AICRAWL-OPENAI-OAI-SearchBot`, `AICRAWL-ANTHROPIC-Claude-SearchBot`, `AICRAWL-PERPLEXITY-PerplexityBot` | PASS | robots.txt names no assistant, so the `*` group applies and its `Allow: /` reaches all three. The outcome was inherited rather than chosen, which is not a defect |
| `AICRAWL-OPENAI-GPTBot`, `AICRAWL-ANTHROPIC-ClaudeBot` | PASS | Not blocked. Training crawlers, so this row reports rather than grades |
| `AICRAWL-OPENAI-ChatGPT-User`, `AICRAWL-ANTHROPIC-Claude-User`, `AICRAWL-PERPLEXITY-Perplexity-User` | PASS | Not blocked, and two of the three publishers state robots.txt may not apply to user-initiated fetches anyway |
| `BING-2`, `BING-3` | INSUFFICIENT EVIDENCE | A sitemap is declared and was not supplied, so whether it lists canonical URLs cannot be checked |
| `BING-10` | **Contradiction, reported under F-011 and F-012** | robots.txt allows the page for `*` and blocks it for `Googlebot`, while the page itself carries `noindex`. The guideline asks for robots.txt and meta directives to be used correctly, and these three disagree with each other |
| `HSTS-5.1`, `HSTS-6.1.1`, `HSTS-6.1.2` | INSUFFICIENT EVIDENCE | A saved HTML file carries no response headers and the capture recorded none. What would settle it: `curl -I` against the live host |

### Stage 06, structured data

| Provision | Verdict | Reason |
|---|---|---|
| `SD-GEN-FORMAT-1` | PASS | One `application/ld+json` block at `index.html:9-21`. It parses as valid JSON |
| `SD-GEN-ACCESS-1` | **Broken, and reported under F-011** | The structured data is on a page carrying `noindex`, so Google is being told not to index the page the markup describes |
| `SD-GEN-CONTENT-4` | **FAIL** | The `award` property claims "Voted #1 Agent in Yolo County 2025" and that text appears nowhere on the page. **F-023** |
| `SD-GEN-CONTENT-5` | **FAIL** | `aggregateRating` carries a 5.0 from 214 ratings and no rating appears on the page. `NOTES.md:4` says the site does not host reviews of other businesses, which is the only case where the property is recommended. **F-024** |
| `SD-GEN-CONTENT-1`, `SD-GEN-CONTENT-2`, `SD-GEN-CONTENT-6` | PASS | The markup follows the spam policies, states nothing out of date, and impersonates nobody |
| `SD-GEN-RELEVANCE-1` | **Broken, and reported under F-023 and F-024** | Two properties do not represent the page content. The root findings are cited separately rather than stacked here |
| `SD-GEN-COMPLETENESS-1` | **FAIL** | `address` is a required property of `LocalBusiness` and it is absent. **F-022** |
| `SD-GEN-LOCATION-1` | PASS | The markup is on the page it describes |
| `SD-GEN-SPECIFICITY-1` | **FAIL** | `LocalBusiness` is used where `RealEstateAgent`, a more specific schema.org sub-type, applies. **F-025** |
| `SD-GEN-IMAGES-1`, `SD-GEN-IMAGES-2` | NOT APPLICABLE | The markup declares no image |
| `SD-LB-REQ-name` | PASS | `"name": "Marisol Vega Real Estate"` |
| `SD-LB-REQ-address` | **FAIL** | Absent. **F-022** |
| `SD-LB-REC-telephone` | **FAIL** | Present but as `"5305550142"`, with no country code and no separators. **F-026** |
| `SD-LB-REC-url` | PASS | Present and well formed. Whether the link works is INSUFFICIENT EVIDENCE, because this run does not make network requests |
| `SD-LB-REC-geo` | Reported | Absent. Recommended only, so absence is never a failure |
| `SD-LB-REC-openingHoursSpecification` | Reported | Absent. Recommended only |
| `SD-LB-REC-priceRange` | Reported | Absent. Recommended only |
| `SD-LB-REC-aggregateRating` | **Misused, and reported under F-024** | Recommended **only for sites that capture reviews about other local businesses**. This is a self-rating |
| `SD-LB-REC-review` | NOT APPLICABLE | No `review` property present, which is correct for this site |
| `SD-LB-GUIDE-1` | **Not met** | Depends on the general guidelines, which F-022, F-023 and F-024 break |
| `SD-LB-SUBTYPE` | **FAIL** | Reported under F-025, the same defect from the general guidelines' side |


### Stage 07, accessibility, WCAG 2.1 Level A and AA

**Browser mode was run and hit the guard in `method/browser-mode.md`.** The page links
`style.css`, that file is not in the folder, and the served stylesheet came back with **0 CSS
rules**. The page therefore rendered unstyled. Structure was measured and is reported below;
**every colour, contrast and type size row stays REQUIRES BROWSER**, because a measurement taken
off an unstyled page is worthless and passing a check you did not perform is the worst thing
this tool can do. That leaves **26 of 50** criteria reachable on this artifact.

| Criterion | Verdict | Reason |
|---|---|---|
| `WCAG-1.1.1` Non-text Content | **FAIL** | Four of the five images carry no `alt` attribute at all: the logo and the three staged images. Measured in the browser. **F-014** |
| `WCAG-1.2.1` to `WCAG-1.2.5` | NOT APPLICABLE | No audio and no video on the page |
| `WCAG-1.3.1` Info and Relationships | **FAIL** | The business name is marked `<h3>` at `index.html:38` and the listing address `<h1>` at `index.html:42`, so the first heading on the page is a level three and the level one comes after it. **F-017** |
| `WCAG-1.3.2` Meaningful Sequence | PASS | DOM order and reading order agree. Nothing repositions content |
| `WCAG-1.3.3` Sensory Characteristics | REQUIRES HUMAN | Needs a person to read the copy for instructions depending on shape, size or position |
| `WCAG-1.3.4` Orientation | REQUIRES BROWSER | The page rendered unstyled, so there is no layout to lock. Needs the stylesheet |
| `WCAG-1.3.5` Identify Input Purpose | **FAIL** | Four form controls collect the user's own name, email, telephone and message, and none carries an `autocomplete` attribute. **F-019** |
| `WCAG-1.4.1` Use of Color | REQUIRES HUMAN | Whether colour alone carries meaning is a judgement, and there is no colour on the rendered page to judge |
| `WCAG-1.4.2` Audio Control | NOT APPLICABLE | Nothing plays automatically. No audio or video element exists |
| `WCAG-1.4.3` Contrast (Minimum) | REQUIRES BROWSER | **The stylesheet is missing from the folder**, so the page rendered with browser default colours. Any ratio measured here would describe a page nobody will ever see. What would settle it: add `style.css` to the artifact and re-run |
| `WCAG-1.4.4` Resize Text | REQUIRES BROWSER | Same reason |
| `WCAG-1.4.5` Images of Text | REQUIRES HUMAN | A person has to look at the images |
| `WCAG-1.4.10` Reflow | REQUIRES BROWSER | Same reason. An unstyled page reflows trivially and that tells nobody anything |
| `WCAG-1.4.11` Non-text Contrast | REQUIRES BROWSER | Same reason |
| `WCAG-1.4.12` Text Spacing | REQUIRES BROWSER | Same reason |
| `WCAG-1.4.13` Content on Hover or Focus | REQUIRES HUMAN | Dismissible, hoverable and persistent are three judgements, not three measurements |
| `WCAG-2.1.1` Keyboard | PASS | Twelve focusable elements, none carrying a negative `tabindex`, all reachable. Whether a custom widget can be operated once focused is REQUIRES HUMAN, and there are no custom widgets here |
| `WCAG-2.1.2` No Keyboard Trap | PASS | Focus was moved onto each of the twelve in turn and released each time |
| `WCAG-2.1.4` Character Key Shortcuts | REQUIRES HUMAN | Single character shortcuts are registered in ways no script can enumerate reliably |
| `WCAG-2.2.1` Timing Adjustable | NOT APPLICABLE | No time limit is set by the content |
| `WCAG-2.2.2` Pause, Stop, Hide | PASS | `document.getAnimations()` returns 0 and there is no marquee, blink or auto-advancing element in the markup |
| `WCAG-2.3.1` Three Flashes | REQUIRES HUMAN | A person has to watch the page |
| `WCAG-2.4.1` Bypass Blocks | PASS | A skip link at `index.html:24` reading "Skip to content", pointing at `#main`, and `main` exists. Confirmed in the browser: the target resolves |
| `WCAG-2.4.2` Page Titled | **FAIL** | `<title></title>` at `index.html:6`. Present and empty, so it describes neither topic nor purpose. **F-013** |
| `WCAG-2.4.3` Focus Order | PASS | Focus visited the twelve focusable elements in DOM order |
| `WCAG-2.4.4` Link Purpose (In Context) | **FAIL** | Three links read "click here" and point at three different destinations. **F-016** |
| `WCAG-2.4.5` Multiple Ways | NOT APPLICABLE | One page was supplied. Multiple ways to reach a page needs the site |
| `WCAG-2.4.6` Headings and Labels | **Broken, reported under F-017 and F-018** | The heading structure is wrong and the form controls have no labels. Both are cited to their own criteria rather than stacked here |
| `WCAG-2.4.7` Focus Visible | REQUIRES BROWSER | Measured on the unstyled page, every control shows the browser's own default focus ring, which tells you nothing about the real site. **The missing stylesheet is exactly what would suppress it.** What would settle it: add `style.css` and re-run |
| `WCAG-2.5.1`, `WCAG-2.5.2`, `WCAG-2.5.4` | REQUIRES HUMAN | Pointer gestures, pointer cancellation and motion actuation are registered in ways no script can enumerate reliably |
| `WCAG-2.5.3` Label in Name | NOT APPLICABLE | No control has both a visible label and a separate accessible name, because no control has a visible label at all. That defect is F-018 |
| `WCAG-3.1.1` Language of Page | **FAIL** | `<html>` at `index.html:1` carries no `lang` attribute. Confirmed in the browser: `document.documentElement.lang` is empty. **F-021** |
| `WCAG-3.1.2` Language of Parts | PASS | No passage in another language, so nothing needs marking |
| `WCAG-3.2.1` On Focus | PASS | Focus was moved onto every focusable element in turn. `location.href` and `window.length` did not change |
| `WCAG-3.2.2` On Input | REQUIRES BROWSER | Changing each control needs the page in its real styled state to see what the change does |
| `WCAG-3.2.3` Consistent Navigation | NOT APPLICABLE | One page was supplied |
| `WCAG-3.2.4` Consistent Identification | NOT APPLICABLE | Same reason |
| `WCAG-3.3.1` Error Identification | REQUIRES BROWSER | The form posts to `/enquiry`, which does not exist in the artifact, so no error can be produced |
| `WCAG-3.3.2` Labels or Instructions | **FAIL** | All four form controls rely on placeholder text alone. No `<label>` element exists on the page. **F-018** |
| `WCAG-3.3.3` Error Suggestion | REQUIRES BROWSER | Same reason as 3.3.1 |
| `WCAG-3.3.4` Error Prevention (Legal, Financial, Data) | REQUIRES HUMAN | Needs a person to decide whether a listing enquiry is a legal or financial commitment |
| `WCAG-4.1.1` Parsing | **FAIL** | `id="top"` appears twice, on `<header>` at `index.html:27` and on `<footer>` at `index.html:68`. Confirmed in the browser: the duplicate id list returns `["top"]`. **F-015** |
| `WCAG-4.1.2` Name, Role, Value | **FAIL** | The four form controls have no programmatically determined name. **F-020** |
| `WCAG-4.1.3` Status Messages | NOT APPLICABLE | The page has no `[role=status]`, `[role=alert]` or `[aria-live]` region, and no status message is produced, because the form's target does not exist in the artifact |
| `WCAG-CONFORMANCE-5.2.1` | **NOT MET** | Level AA conformance requires that the page satisfies all Level A and Level AA success criteria. Nine do not. One failure is enough |

### Stage 07, spam policies

| Provision | Verdict | Reason |
|---|---|---|
| `SPAM-KEYWORD-STUFFING` | INSUFFICIENT EVIDENCE | One paragraph at `index.html:69-74` names 47 cities and neighbourhoods and contains nothing else, which matches Google's own listed example closely. **It is still not issued as a finding**, because the policy turns on intent and a genuine service-area list is identical in source to a stuffed one. See **Q-001**, which sets out exactly what would settle it |
| `SPAM-CLOAKING` | PASS | The rendered text and the source text are the same |
| `SPAM-HIDDEN-TEXT` | PASS | Nothing is hidden. There is no off-screen text and no text coloured to match its background |
| `SPAM-DOORWAYS` | NOT APPLICABLE | One page was supplied. A doorway finding needs the set of near-duplicate pages it describes |
| `SPAM-SCALED-CONTENT` | INSUFFICIENT EVIDENCE | Whether the copy was generated at scale cannot be read from one page, and the policy turns on intent |
| `SPAM-LINK-SPAM` | PASS | Six links, every one of them internal. No link scheme pattern |
| `SPAM-SCRAPING` | PASS | The content is original to this artifact |
| `SPAM-THIN-AFFILIATION` | NOT APPLICABLE | No affiliate links |
| `SPAM-SNEAKY-REDIRECTS` | PASS | No redirect in the markup |
| `SPAM-MISLEADING-FUNCTIONALITY` | PASS | Every control does what its label says, where it has one |
| `SPAM-SCAM-FRAUD` | PASS | Nothing impersonates another party or solicits money under a false premise |
| `SPAM-EXPIRED-DOMAINS`, `SPAM-HACKED-CONTENT`, `SPAM-MACHINE-TRAFFIC`, `SPAM-MALICIOUS`, `SPAM-POLICY-CIRCUMVENTION`, `SPAM-SITE-REPUTATION`, `SPAM-USER-GENERATED` | NOT APPLICABLE | None is engaged by a single-page artifact with no third party content, no user submissions and no injected markup |

### Stage 08, licence and broker, California pack

| Provision | Verdict | Reason |
|---|---|---|
| `CA-2773(a)(3)` | Applies | `NOTES.md` describes this as the licensee's own site, which is what makes it solicitation material |
| `CA-2773(b)` | NOT APPLICABLE | The exception covers signs only. A website is never exempt under it |
| `CA-2773(a)-LICENSE` | PASS | "DRE #01234567" at `index.html:76`. Eight digits, presented as a licence number |
| `CA-2773(a)-BROKER` | **FAIL** | No brokerage name appears anywhere on the page. `NOTES.md:2` says the licensee is a salesperson, who must advertise under a responsible broker. **F-006** |
| `CA-2773(a)-EACH` | PASS | One licensee is named and one licence number is disclosed. The counts match |
| `CA-2773(a)-TYPESIZE` | REQUIRES BROWSER | **The stylesheet is missing from the folder.** On the unstyled page every text node computes to the browser default, so the licence number and the smallest type are the same size by accident, not by design. Reporting that as a PASS would be passing a check nobody performed. What would settle it: add `style.css` to the artifact and re-run |

### Stage 09, listing images, California pack

**Pass A, which needs no manifest and always runs.**

| Reading | Value |
|---|---|
| `<img>` elements on the page | **5** |
| Alteration disclosure wording anywhere in the visible text | **none** |
| A link to unaltered originals | **none** |

**The result of pass A, in one sentence.** This page carries five images, contains no alteration
disclosure of any kind, and links to no unaltered originals. So if any image on it is altered,
`CA-10140.8(a)(1)` is unmet. **Pass B then shows that three of them are.**

**Pass B, which needs the manifest.**

| Provision | Verdict | Reason |
|---|---|---|
| `CA-10140.8(b)(1)` | Met for three images | `manifest.md` states that furniture and a fruit bowl were added to the kitchen photograph with generative AI, that a sofa, rug and wall art were added to the living room and the wall colour changed, and that the floor plan render was generated. Each names an element added or changed, which is what the subdivision covers |
| `CA-10140.8(b)(2)` | Excludes one image | `img/exterior.jpg` had its exposure lifted, was straightened and cropped. Those are the adjustments the subdivision names as **not** covered, so it is correctly out of scope |
| `CA-10140.8(a)(1)-STATEMENT` | **FAIL** | No statement disclosing alteration appears anywhere on the page, for any of the three covered images. **F-001** |
| `CA-10140.8(a)(1)-CONSPICUOUS` | **FAIL** | Not reached in the ordinary sense, because there is no statement to place. Reported separately because the statute lists placement as its own obligation. **F-002** |
| `CA-10140.8(a)(1)-LINK` | **FAIL** | No link, URL or QR code to the unaltered images appears on the page. **F-003** |
| `CA-10140.8(a)(1)-POINTER` | **FAIL** | No language indicating that unaltered images can be accessed. **F-004** |
| `CA-10140.8(a)(2)` | **FAIL** | The unaltered versions are neither included in the posting nor reached by a compliant link. **F-005** |

**This is the one section of this audit where the evidence bar was fully met.** `LEGAL` findings
require that `manifest.md` states the image was altered, and here it does, in the owner's own
words. Nothing was inferred from looking at a picture.

### Stage 10, fair housing

**This stage issues no verdict, ever. It flags and hands to a person.**

| Flag | What was found | What a person must do |
|---|---|---|
| `FHA-100.75(c)(1)` Tier A wording scan | **No flags.** The scan looked for words and phrases conveying a preference or limitation based on a protected characteristic, and the page's visible text raised none | Nothing, on the wording. This is a pass on the scan and not a clearance |
| `FHA-100.75(a)`, `FHA-100.75(b)` | No flags raised | These provisions reach oral statements as well as page text, and no oral statement is in this artifact |
| `FHA-100.75(c)(3)` | **Worth a person's eye, and not a flag** | The provision reaches "selecting advertising media or locations that deny segments of the market information about housing opportunities". The footer at `index.html:69-74` names 47 areas. Whether a service-area list can ever engage this provision is a judgement about targeting, not about wording, and this auditor does not make it. Named here so a person can decide rather than assume the scan covered it |
| `FHA-109.20-RESCINDED` word list | Run as a Tier B flag only | 24 CFR Part 109 was withdrawn from the CFR on 1 May 1996. It cannot produce a finding and it produced none. **The Equal Housing Opportunity logo is absent from this page and that is not a federal violation**, because the logo requirement lived in Part 109. A brokerage, an MLS or state law may still require it |

### Stage 11, privacy and consent

| Provision | Verdict | Reason |
|---|---|---|
| `CALOPPA-22575(a)-COLLECTS` | Met | The enquiry form at `index.html:58-64` captures a name, an email address and a telephone number |
| `CALOPPA-22575(a)-POSTED` | **FAIL** | A case-insensitive search for "privacy" across the whole page returns zero hits. Nothing is posted. **F-007** |
| `CALOPPA-22575(a)-CONSPICUOUS` | Not reached | The manner of posting cannot be judged when nothing is posted. Fixing F-007 makes this row checkable |
| `TCPA-64.1200(f)(9)-SCOPE` | Met on its first limb | `index.html:61` is an `<input type="tel">`. Whether the licensee then autodials is REQUIRES HUMAN and is not assumed |
| `TCPA-64.1200(f)(9)-AGREEMENT` | **FAIL** | No consent text, no checkbox and no reference to calls or texts anywhere in the form. **F-008** |
| `TCPA-64.1200(f)(9)(i)(A)` | **FAIL** | The disclosure that signing authorises autodialed or prerecorded marketing is absent. **F-009** |
| `TCPA-64.1200(f)(9)(i)(B)` | **FAIL** | The sentence saying consent is not a condition of purchase is absent, and so is every paraphrase. **F-010** |
| `TCPA-64.1200(f)(3)` | Not reached | There is no disclosure to judge for conspicuousness |

### Stage 12, link integrity

| Provision | Verdict | Reason |
|---|---|---|
| `LINK-REL-sponsored` | NOT APPLICABLE | The artifact identifies no link as paid, sponsored or an advertisement |
| `LINK-REL-ugc` | NOT APPLICABLE | No comment or review block with links in it |
| `LINK-REL-nofollow` | Reported, never required | No link carries `nofollow` |
| `LINK-REL-NONE` | NOT APPLICABLE | Not reached. Nothing carries an unexplained `nofollow` |
| `LINK-REL-MULTIPLE` | NOT APPLICABLE | No link carries any `rel` attribute at all |
| Outbound link inventory | Reported | Six `<a>` tags, every one of them internal: a skip link, three navigation links and three "click here" links. **This page has no outbound links**, which is why most of this stage is NOT APPLICABLE. The "click here" text is a finding under stage 07, not here |
| `BING-5` | NOT APPLICABLE | Reachability is a property of a site, not of a page. This auditor audits one page, so the guideline has nothing here to apply to. Named rather than silently dropped, so a reader knows it was considered |
| `BING-7` | NOT APPLICABLE | Redirect handling is a property of a server, not of a saved page. Named rather than silently dropped |
| Dead links | INSUFFICIENT EVIDENCE | Five of the six links point at pages not supplied with the artifact. Following them would mean requesting a host that does not exist |

### Not covered

| Thing | Why |
|---|---|
| `BreadcrumbList`, `FAQPage`, `Article`, `Product` and every other rich result type | Their required-property tables are deliberately absent from `reference/`. Google's own documentation for each would cover them |
| The NAR Code of Ethics | Not a published standard this auditor holds. Article 12, on advertising presenting a true picture, is the closest in subject |
| MLS rules, and the brokerage's own advertising policy | Private documents. They apply to this licensee and this tool cannot read them |
| Whether the licence number is genuine | Settled at `www2.dre.ca.gov`, not from an artifact |
| Whether the agent serves all 47 named areas | A question of fact about the business, named in Q-001 |
| Page speed as experienced by real visitors | Needs field data. A fictional page has no visitors |
| Whether the site is hosted over HTTPS with HSTS | Needs response headers, which a saved file does not carry |
| Whether the linked sitemap is valid | The file was not supplied |

---

## 4. Scope and limits

**What this audit covered.** One page and its robots.txt, plus the image manifest and the
owner's notes, against the standards registered in `reference/README.md`.

**Accessibility coverage.** Browser mode ran and hit its own guard. The artifact links a
stylesheet that is not in the folder, the served file came back with zero CSS rules, and the
page rendered unstyled. Structure was measured, so **26 of 50** criteria are answered here.
Contrast, focus visibility, reflow, resize, orientation, text spacing and the licence type size
all stay REQUIRES BROWSER. **They did not become passes.** Adding `style.css` to the fixture and
re-running would move them, and that is a change to the fixture, which is a decision for
whoever maintains it rather than something this run should make on its own.

**The one thing worth taking from that.** This is a fixture, so a missing stylesheet costs
nothing. On a real site it would mean seven accessibility criteria and one California legal
obligation reported as unanswered when the site owner assumed they were checked. The capture
step in `README.md` brings the stylesheet down with the page for exactly this reason.

**What a person still has to do.** Answer Q-001 by saying whether the licensee serves all 47
named areas. Decide the eleven REQUIRES HUMAN judgements above. Check the licence number at
`www2.dre.ca.gov`.

**What this audit did not do.** It did not predict rankings, did not give keyword advice, did
not judge writing quality, and did not give legal advice. It reproduced published rules and
reported whether one artifact matches them.
