# Audit: samples/pass-case/ (Marisol Vega Real Estate, fictional, repaired)

| | |
|---|---|
| Audited | 2026-09-07 |
| Artifact | `samples/pass-case/` |
| Files read | `index.html` (125 lines), `robots.txt` (4), `manifest.md`, `NOTES.md` |
| Jurisdiction | **California**, settled by the eight digit CA DRE numbers in the footer |
| Browser mode | **Run, and it hit its own guard.** The page links a stylesheet that is not in the folder, so it rendered unstyled. Every colour and type size row stays REQUIRES BROWSER. Details in `03b-render.md` |
| Standards | Those registered in `reference/README.md`, at the retrieval dates in their provenance tables |

**This is `fail-case/` with every defect repaired, and it is the harder of the two tests.** An
auditor that finds problems in markup built to be clean is broken, and the only way to prove
that is to run it against the same artifact with the defects taken out. Nobody named here
exists. Neither folder was taken from a real website.

**Re-run 2026-09-07, and the fixture was repaired again in the same change.** The first run was
on 2026-09-03, against six standards. The auditor now holds eighteen. **A fixture that was clean
against six is not automatically clean against eighteen**, and this one was not: re-running it
found no responsible broker named, no privacy policy posted, and three separate parts of the
federal written-consent rule missing from the enquiry form. All five were repaired in the
fixture rather than reported, because a control that is no longer clean has stopped doing its
job. `fail-case/` was left alone, and now fails all five by omission. `samples/pass-case/NOTES.md`
records the repair.

---

## 1. Summary

| Severity | Findings |
|---|---|
| LEGAL | 0 |
| BLOCKING | 0 |
| ACCESS | 0 |
| ELIGIBILITY | 0 |
| ADVISORY | 0 |
| **Total** | **0** |

Verdict counts across all 141 provisions checked:

| Verdict | Count |
|---|---|
| PASS | 46 |
| FAIL | 0 |
| NOT APPLICABLE | 33 |
| INSUFFICIENT EVIDENCE | 12 |
| REQUIRES BROWSER | 16 |
| REQUIRES HUMAN | 22 |
| NOT COVERED | 12 |

---

## 2. Findings

**None.**

That sentence is the whole point of this run, and it is worth being careful about what it does
and does not mean.

**What it means.** Of the 141 provisions this auditor holds, 46 were checked against this
artifact and matched it. Not one produced a FAIL. Every defect seeded into `fail-case/` is gone,
and taking each one out did not break anything else.

**What it does not mean.** It does not mean this page is compliant. Fifty of the 141 rows below
are REQUIRES BROWSER, REQUIRES HUMAN or INSUFFICIENT EVIDENCE, and **those are not passes.** A
zero on the findings table with fifty unanswered rows underneath it is an honest result, and an
auditor that let the zero stand for the whole page would be lying by omission. The unanswered
rows are listed with everything else, and section 4 says what each of them needs.

---

## 3. The full provision ledger

Every provision this auditor holds, with its verdict and the reason in the row.

### Stage 01, freshness of the reference set

| Standard | Verdict | Reason |
|---|---|---|
| 15 of 23 vendored standards | PASS | `./check-standards-freshness.sh` compared each against its live source and found the canary text unchanged |
| The 5 WCAG files, CalOPPA, the Bing guidelines | PASS | Blocked to `curl`. All seven canaries confirmed by hand in a browser on 2026-09-06 |
| `fair-housing/24-cfr-109-20-rescinded.md` | NOT APPLICABLE | Withdrawn from the CFR on 1 May 1996. Flags only, never a finding |

Stale: 0. Withdrawn: 0. **The audit was allowed to proceed.**

### Stage 02, jurisdiction

| Provision | Verdict | Reason |
|---|---|---|
| Which state pack | California | `index.html:120` and `index.html:121` carry two CA DRE numbers, and the structured data gives a California address. No other state's rules are loaded, read or listed |

### Stage 04, can this page be indexed

| Provision | Verdict | Reason |
|---|---|---|
| `GSE-TR-1` | PASS | `robots.txt` has one group, `User-agent: *`, with `Allow: /` and `Disallow: /wp-admin/`. Nothing blocks this page, and there is no `Googlebot` group and no `noindex` anywhere in the document |
| `GSE-TR-2` | INSUFFICIENT EVIDENCE | A saved file carries no HTTP status code and `NOTES.md` records none. What would settle it: a `curl -I` against a live host |
| `GSE-TR-3` | PASS | A heading structure, a listing description, five described images and a labelled form. There is indexable content |
| `GSE-TR-INDEXABLE-A` | PASS | `text/html`, a file type Google Search supports |
| `GSE-TR-INDEXABLE-B` | PASS | The spam pass raised nothing |
| `<link rel="canonical">` | Reported | Absent. No provision in `reference/` requires one, so this is an observation and not a finding |

### Stage 05, crawler access

| Provision | Verdict | Reason |
|---|---|---|
| `RFC9309-2.2.1` | PASS | One group, `User-agent: *`. The product token uses only permitted characters |
| `RFC9309-2.2.2` | PASS | Both rules sit inside the group, after the user-agent line. This is the defect that `fail-case` has and this one does not |
| `RFC9309-2.2.3` | NOT APPLICABLE | No special characters used |
| `RFC9309-2.2.4` | PASS | One `Sitemap:` record, correctly not terminating a group |
| `RFC9309-2.3` | PASS | Named `robots.txt` and supplied as the host's own |
| `SM-REQ-urlset`, `SM-REQ-url`, `SM-REQ-loc` | INSUFFICIENT EVIDENCE | `robots.txt:4` declares a sitemap and that file was not supplied with the artifact. What would settle it: include it in the folder |
| `SM-FILE-1` to `SM-FILE-6` | INSUFFICIENT EVIDENCE | Same reason |
| `SM-OPT-*` | NOT APPLICABLE | Optional tags in a file that was not supplied |
| `INDEXNOW-VERIFY-2`, `INDEXNOW-KEY-1` | NOT APPLICABLE | No key file, and IndexNow is optional. `BING-4` says adopting it would tell Bing about changes faster |
| The nine `AICRAWL-*` provisions | PASS | robots.txt names no assistant, so the `*` group applies and its `Allow: /` reaches all nine bots. None of the three search-and-answer crawlers is blocked. The outcome was inherited rather than chosen, which is not a defect |
| `BING-2`, `BING-3` | INSUFFICIENT EVIDENCE | A sitemap is declared and was not supplied |
| `BING-10` | PASS | robots.txt and the page's meta directives agree with each other. There are no meta directives to disagree |
| `HSTS-5.1`, `HSTS-6.1.1`, `HSTS-6.1.2` | INSUFFICIENT EVIDENCE | A saved HTML file carries no response headers |

### Stage 06, structured data

| Provision | Verdict | Reason |
|---|---|---|
| `SD-GEN-FORMAT-1` | PASS | One `application/ld+json` block at `index.html:8-49`. It parses as valid JSON |
| `SD-GEN-ACCESS-1` | PASS | Nothing blocks the structured data from Googlebot |
| `SD-GEN-CONTENT-1`, `-2`, `-6` | PASS | It follows the spam policies, states nothing out of date, and impersonates nobody |
| `SD-GEN-CONTENT-4` | PASS | Every property describes something visible: the business name in the title and footer, the address in the footer, the phone, the price range. **There is no `award` property and no invented claim.** This is the repair of `fail-case` F-023 |
| `SD-GEN-CONTENT-5` | PASS | **No `aggregateRating` and no `review` property.** `NOTES.md` says the site does not host reviews of other businesses, which is the only case where those are recommended. This is the repair of `fail-case` F-024 |
| `SD-GEN-RELEVANCE-1` | PASS | The markup is a true representation of the page |
| `SD-GEN-COMPLETENESS-1` | PASS | Both required properties are present |
| `SD-GEN-LOCATION-1` | PASS | The markup is on the page it describes |
| `SD-GEN-SPECIFICITY-1` | PASS | `RealEstateAgent`, the most specific applicable schema.org type. This is the repair of `fail-case` F-025 |
| `SD-GEN-IMAGES-1`, `SD-GEN-IMAGES-2` | NOT APPLICABLE | The markup declares no image |
| `SD-LB-REQ-name` | PASS | `"name": "Marisol Vega Real Estate"` at `index.html:12` |
| `SD-LB-REQ-address` | PASS | A complete `PostalAddress` at `index.html:13-20`, with street, locality, region, postcode and country |
| `SD-LB-REC-telephone` | PASS | `"+15305550142"` at `index.html:21`, in E.164 form with a country code. This is the repair of `fail-case` F-026 |
| `SD-LB-REC-url` | PASS | Present and well formed. Whether the link resolves is INSUFFICIENT EVIDENCE, because this run makes no network requests |
| `SD-LB-REC-geo` | PASS | `latitude` 38.54491 and `longitude` -121.74052, both to five decimal places, which is the precision the property's documentation requires |
| `SD-LB-REC-openingHoursSpecification` | PASS | Monday to Friday, 09:00 to 18:00, using schema.org day URLs |
| `SD-LB-REC-priceRange` | PASS | `"$$"`, well under the 100 character limit |
| `SD-LB-REC-aggregateRating`, `SD-LB-REC-review` | NOT APPLICABLE | Recommended **only for sites that capture reviews about other local businesses**. Correctly absent |
| `SD-LB-GUIDE-1` | PASS | The general guidelines and Search Essentials are both met |
| `SD-LB-SUBTYPE` | PASS | `RealEstateAgent` is the most specific `LocalBusiness` sub-type available |


### Stage 07, accessibility, WCAG 2.1 Level A and AA

**Browser mode was run and hit the same guard as `fail-case`.** The page links `style.css`,
that file is not in the folder, and the served stylesheet came back with **0 CSS rules**.
Structure was measured and is reported below; **every colour, contrast and type size row stays
REQUIRES BROWSER.** That leaves **26 of 50** criteria reachable on this artifact.

| Criterion | Verdict | Reason |
|---|---|---|
| `WCAG-1.1.1` Non-text Content | PASS | Five images, every one carrying a descriptive `alt` attribute. Measured in the browser: 0 missing the attribute, 0 with an empty one |
| `WCAG-1.2.1` to `WCAG-1.2.5` | NOT APPLICABLE | No audio and no video |
| `WCAG-1.3.1` Info and Relationships | PASS | One `<h1>` followed by three `<h2>`s in order, a `<main>` landmark, a labelled `<nav>`, and each altered image wrapped in a `<figure>` with its `<figcaption>` |
| `WCAG-1.3.2` Meaningful Sequence | PASS | DOM order and reading order agree |
| `WCAG-1.3.3` Sensory Characteristics | REQUIRES HUMAN | Needs a person to read the copy |
| `WCAG-1.3.4` Orientation | REQUIRES BROWSER | The page rendered unstyled, so there is no layout to lock |
| `WCAG-1.3.5` Identify Input Purpose | PASS | `autocomplete="name"`, `"email"` and `"tel"` on the three fields that collect the user's own information |
| `WCAG-1.4.1` Use of Color | REQUIRES HUMAN | A judgement, and there is no colour on the rendered page to judge |
| `WCAG-1.4.2` Audio Control | NOT APPLICABLE | Nothing plays automatically |
| `WCAG-1.4.3` Contrast (Minimum) | REQUIRES BROWSER | **The stylesheet is missing from the folder.** Any ratio measured here would describe a page nobody will see |
| `WCAG-1.4.4` Resize Text | REQUIRES BROWSER | Same reason |
| `WCAG-1.4.5` Images of Text | REQUIRES HUMAN | A person has to look at the images |
| `WCAG-1.4.10` Reflow | REQUIRES BROWSER | Same reason |
| `WCAG-1.4.11` Non-text Contrast | REQUIRES BROWSER | Same reason |
| `WCAG-1.4.12` Text Spacing | REQUIRES BROWSER | Same reason |
| `WCAG-1.4.13` Content on Hover or Focus | REQUIRES HUMAN | Three judgements, not three measurements |
| `WCAG-2.1.1` Keyboard | PASS | Sixteen focusable elements, none with a negative `tabindex`, all reachable |
| `WCAG-2.1.2` No Keyboard Trap | PASS | Focus was moved onto each of the sixteen in turn and released each time |
| `WCAG-2.1.4` Character Key Shortcuts | REQUIRES HUMAN | Cannot be enumerated reliably by script |
| `WCAG-2.2.1` Timing Adjustable | NOT APPLICABLE | No time limit is set by the content |
| `WCAG-2.2.2` Pause, Stop, Hide | PASS | `document.getAnimations()` returns 0 and nothing moves |
| `WCAG-2.3.1` Three Flashes | REQUIRES HUMAN | A person has to watch the page |
| `WCAG-2.4.1` Bypass Blocks | PASS | A skip link at `index.html:53` reading "Skip to main content", pointing at `#main`. Confirmed in the browser: the target resolves. There is also a `<main>` landmark |
| `WCAG-2.4.2` Page Titled | PASS | "2736 5th St, Davis CA \| Marisol Vega Real Estate". It names both the listing and the business |
| `WCAG-2.4.3` Focus Order | PASS | Focus visited the sixteen focusable elements in DOM order |
| `WCAG-2.4.4` Link Purpose (In Context) | PASS | Every link says where it goes. Three read "the unaltered images page" and all three point at the same `/originals.html`, so the repetition is not ambiguous. **No "click here" anywhere**, which is the repair of `fail-case` F-016 |
| `WCAG-2.4.5` Multiple Ways | NOT APPLICABLE | One page was supplied. A site map link is present at `index.html:119` and its target was not supplied |
| `WCAG-2.4.6` Headings and Labels | PASS | Four headings that name their sections, and a bound `<label>` on every one of the five form controls |
| `WCAG-2.4.7` Focus Visible | REQUIRES BROWSER | On the unstyled page every control shows Chromium's default focus ring, which says only that Chromium has a default. The real stylesheet is what would suppress it, and it is not here |
| `WCAG-2.5.1`, `WCAG-2.5.2`, `WCAG-2.5.4` | REQUIRES HUMAN | Cannot be enumerated reliably by script |
| `WCAG-2.5.3` Label in Name | PASS | Each control's visible label text is its accessible name. Measured in the browser: all five bound by `for` and `id` |
| `WCAG-3.1.1` Language of Page | PASS | `<html lang="en">` at `index.html:2`. Confirmed in the browser |
| `WCAG-3.1.2` Language of Parts | PASS | No passage in another language |
| `WCAG-3.2.1` On Focus | PASS | Focus was moved onto every focusable element in turn. `location.href` and `window.length` did not change |
| `WCAG-3.2.2` On Input | REQUIRES BROWSER | Needs the page in its real styled state to see what a change does |
| `WCAG-3.2.3` Consistent Navigation | NOT APPLICABLE | One page was supplied |
| `WCAG-3.2.4` Consistent Identification | NOT APPLICABLE | Same reason |
| `WCAG-3.3.1` Error Identification | REQUIRES BROWSER | The form posts to `/enquiry`, which does not exist in the artifact. Worth recording: four of the five controls carry the HTML `required` attribute, so the browser will produce its own error, and whether that error is described in text needs the styled page |
| `WCAG-3.3.2` Labels or Instructions | PASS | A `<label>` element bound by `for` and `id` on all five controls, including the consent checkbox. This is the repair of `fail-case` F-018 |
| `WCAG-3.3.3` Error Suggestion | REQUIRES BROWSER | Same reason as 3.3.1 |
| `WCAG-3.3.4` Error Prevention (Legal, Financial, Data) | REQUIRES HUMAN | Needs a person to decide whether a listing enquiry is a legal or financial commitment |
| `WCAG-4.1.1` Parsing | PASS | The document parsed with no fatal error. Measured in the browser: **no duplicate `id` values**, which is the repair of `fail-case` F-015 |
| `WCAG-4.1.2` Name, Role, Value | PASS | Every form control has a programmatically determined name from its bound label |
| `WCAG-4.1.3` Status Messages | NOT APPLICABLE | No status message is produced, because the form's target does not exist in the artifact |
| `WCAG-CONFORMANCE-5.2.1` | **Not claimed** | Level AA conformance requires that the page satisfies **all** Level A and Level AA success criteria. Twenty-six were checked and passed. Twenty-four were not reached, so **this page cannot be said to conform**, and no zero on a findings table changes that. This row is the reason section 2 says what it says |

### Stage 07, spam policies

| Provision | Verdict | Reason |
|---|---|---|
| `SPAM-KEYWORD-STUFFING` | PASS | The footer at `index.html:118` names three towns and one county, which is a service area and not a block of text listing regions. This is the repair of the `fail-case` Q-001 query, and the reason the query existed: with a plausible list, the question does not arise |
| `SPAM-CLOAKING` | PASS | The rendered text and the source text are the same |
| `SPAM-HIDDEN-TEXT` | PASS | Nothing is hidden |
| `SPAM-DOORWAYS` | NOT APPLICABLE | One page was supplied |
| `SPAM-SCALED-CONTENT` | INSUFFICIENT EVIDENCE | Cannot be read from one page, and the policy turns on intent |
| `SPAM-LINK-SPAM` | PASS | Ten links, every one internal. No link scheme pattern |
| `SPAM-SCRAPING` | PASS | The content is original to this artifact |
| `SPAM-THIN-AFFILIATION` | NOT APPLICABLE | No affiliate links |
| `SPAM-SNEAKY-REDIRECTS` | PASS | No redirect in the markup |
| `SPAM-MISLEADING-FUNCTIONALITY` | PASS | Every control does what its label says |
| `SPAM-SCAM-FRAUD` | PASS | Nothing impersonates another party or solicits money under a false premise |
| The remaining seven `SPAM-*` provisions | NOT APPLICABLE | None is engaged by a single-page artifact with no third party content, no user submissions and no injected markup |

### Stage 08, licence and broker, California pack

| Provision | Verdict | Reason |
|---|---|---|
| `CA-2773(a)(3)` | Applies | `NOTES.md` describes this as the licensee's own site |
| `CA-2773(b)` | NOT APPLICABLE | The exception covers signs only |
| `CA-2773(a)-LICENSE` | PASS | "California DRE #01234567" at `index.html:120`. Eight digits, presented as a licence number |
| `CA-2773(a)-BROKER` | PASS | "Responsible broker: Yolo Valley Realty Inc, California DRE #01987654" at `index.html:121`. Whether that name matches the DRE record is REQUIRES HUMAN and is settled at `www2.dre.ca.gov`. This is one of the five repairs made on 2026-09-07 |
| `CA-2773(a)-EACH` | PASS | Two licensees are named, the salesperson at `index.html:120` and the corporate broker at `index.html:121`, and each has its own eight digit number beside it. The counts match |
| `CA-2773(a)-TYPESIZE` | REQUIRES BROWSER | **The stylesheet is missing from the folder.** On the unstyled page every text node computes to the same default size, so a PASS here would be an accident rather than a measurement. What would settle it: add `style.css` and re-run |

### Stage 09, listing images, California pack

**Pass A, which needs no manifest and always runs.**

| Reading | Value |
|---|---|
| `<img>` elements on the page | **5** |
| Alteration disclosure wording found in the visible text | **7 distinct phrases**: "has been altered", "have been altered", "virtually staged", "generative AI", "render", "altered image", "added digitally" |
| A link to unaltered originals | **present**, three of them, all to `/originals.html` |

**Pass A is the half of this stage that proves the check is real.** Run against `fail-case/`, the
same routine returns zero disclosure phrases and zero links. Run against this page it returns
seven and three. The two fixtures are separated on AB 723 **without reading the manifest at
all**, which is what makes this a check rather than a request for information.

**Pass B, which needs the manifest.**

| Provision | Verdict | Reason |
|---|---|---|
| `CA-10140.8(b)(1)` | Met for three images | `manifest.md` states that furniture and a fruit bowl were added to the kitchen photograph with generative AI, that a sofa, rug and wall art were added to the living room and the wall colour changed, and that the floor plan render was generated |
| `CA-10140.8(b)(2)` | Excludes one image | `img/exterior.jpg` had exposure lifted, was straightened and cropped, which the subdivision names as **not** covered |
| `CA-10140.8(a)(1)-STATEMENT` | PASS | "**This image has been altered.**" appears in the `<figcaption>` of each covered image, at `index.html:78` and `index.html:85`, and again as a section statement at `index.html:72` |
| `CA-10140.8(a)(1)-CONSPICUOUS` | PASS | Each statement is inside the same `<figure>` as the image it describes, which is as adjacent as markup gets. Whether a reader would notice it is REQUIRES HUMAN |
| `CA-10140.8(a)(1)-LINK` | PASS | Each caption links to `/originals.html`, at `index.html:80` and `index.html:87` |
| `CA-10140.8(a)(1)-POINTER` | PASS | Each statement says in words that the unaltered image is on the linked page: "The unaltered photograph is on the unaltered images page" |
| `CA-10140.8(a)(2)` | PASS, in part | The unaltered versions are reached by a compliant link. Whether `/originals.html` actually holds them is INSUFFICIENT EVIDENCE, because that page was not supplied. `NOTES.md` says it exists and what it contains. What would settle it: include that page in the artifact |

**The one row worth arguing about.** The living room image named in `manifest.md` is not on this
page at all, so it is not advertised here and the obligations do not attach to it. That is
recorded rather than passed over, because a reader comparing the manifest to the page will
notice the difference and should not have to work out whether it was missed.

### Stage 10, fair housing

**This stage issues no verdict, ever. It flags and hands to a person.**

| Flag | What was found | What a person must do |
|---|---|---|
| `FHA-100.75(c)(1)` Tier A wording scan | **No flags.** The page's visible text raised no word or phrase conveying a preference or limitation based on a protected characteristic | Nothing, on the wording. A clean scan is not a clearance |
| `FHA-100.75(a)`, `FHA-100.75(b)`, `FHA-100.75(c)(3)` | No flags raised | These reach oral statements and media selection as well as page text, neither of which is in this artifact |
| `FHA-109.20-RESCINDED` word list | Run as a Tier B flag only | Withdrawn 1 May 1996. It cannot produce a finding and it produced none. The Equal Housing Opportunity logo is absent and **that is not a federal violation**, because the logo requirement lived in Part 109. A brokerage, an MLS or state law may still require it |

### Stage 11, privacy and consent

| Provision | Verdict | Reason |
|---|---|---|
| `CALOPPA-22575(a)-COLLECTS` | Met | The enquiry form at `index.html:92-113` captures a name, an email address and a telephone number |
| `CALOPPA-22575(a)-POSTED` | PASS | Two visible links read "Privacy Policy" and point at `/privacy.html`: one in the consent text at `index.html:110` and one in the footer at `index.html:119`. Measured in the browser: both render with a non-zero box and no hidden ancestor. Whether `/privacy.html` contains a conforming policy is INSUFFICIENT EVIDENCE, because that page was not supplied |
| `CALOPPA-22575(a)-CONSPICUOUS` | PASS | Section 22577(b) names a link on the home page using the word "privacy". The footer link uses it, in the footer, without a search |
| `TCPA-64.1200(f)(9)-SCOPE` | Met on its first limb | `index.html:100` is an `<input type="tel">`. Whether the licensee autodials is REQUIRES HUMAN and is not assumed |
| `TCPA-64.1200(f)(9)-AGREEMENT` | PASS | Consent text at `index.html:107-110`, inside a `<label>` bound to `<input type="checkbox" id="consent" required>` at `index.html:106`. Measured in the browser: the box is **not** pre-ticked, and it is `required`, so ticking it is a deliberate act and the form will not submit without it |
| `TCPA-64.1200(f)(9)(i)(A)` | PASS | The words "including by autodialed or prerecorded means" at `index.html:108` |
| `TCPA-64.1200(f)(9)(i)(B)` | PASS | The words "Consent is not a condition of purchasing any property, goods or services" at `index.html:108-109` |
| `TCPA-64.1200(f)(3)` | PASS, in part | The disclosure is its own element in its own `<div class="consent">`, separate and distinguishable from the surrounding copy. Whether a reasonable consumer would notice it is REQUIRES HUMAN, and the type size and contrast that would inform that judgement are REQUIRES BROWSER here |

### Stage 12, link integrity

| Provision | Verdict | Reason |
|---|---|---|
| `LINK-REL-sponsored` | NOT APPLICABLE | The artifact identifies no link as paid, sponsored or an advertisement |
| `LINK-REL-ugc` | NOT APPLICABLE | No comment or review block with links in it |
| `LINK-REL-nofollow` | Reported, never required | No link carries `nofollow` |
| `LINK-REL-NONE` | NOT APPLICABLE | Not reached |
| `LINK-REL-MULTIPLE` | NOT APPLICABLE | No link carries any `rel` attribute |
| Outbound link inventory | Reported | Ten `<a>` tags, every one internal: a skip link, three navigation links, three to `/originals.html`, two to `/privacy.html` and one to `/sitemap.html`. **This page has no outbound links** |
| `BING-5`, `BING-7` | NOT APPLICABLE | Reachability across a site and server redirect behaviour are both properties of a site, not of a page. This auditor audits one page. Named rather than silently dropped |
| Dead links | INSUFFICIENT EVIDENCE | Six of the ten point at pages not supplied with the artifact, including `/originals.html`, which `CA-10140.8(a)(2)` depends on |

### Not covered

| Thing | Why |
|---|---|
| `BreadcrumbList`, `FAQPage`, `Article`, `Product` and every other rich result type | Their required-property tables are deliberately absent from `reference/` |
| The NAR Code of Ethics | Not a published standard this auditor holds |
| MLS rules, and the brokerage's own advertising policy | Private documents this tool cannot read |
| Whether either licence number is genuine | Settled at `www2.dre.ca.gov`, not from an artifact |
| Whether `/privacy.html` contains a conforming privacy policy | That page was not supplied |
| Whether `/originals.html` holds the unaltered images | That page was not supplied |
| Page speed as experienced by real visitors | Needs field data |
| Whether the site uses HTTPS with HSTS | Needs response headers |
| Whether the linked sitemap is valid | The file was not supplied |
| Everything the missing stylesheet blocks | Eight rows, listed in stage 07 and stage 09 |

---

## 4. Scope and limits

**Read this before quoting the zero.**

**Forty-six of 141 provisions were checked and passed. Fifty were not answered at all.** The
zero on the findings table means no rule this run could check was broken. It does not mean the
page is compliant, and `WCAG-CONFORMANCE-5.2.1` above says so in the standard's own terms.

**Accessibility coverage.** Browser mode ran and hit its own guard. The artifact links a
stylesheet that is not in the folder, the served file came back with zero CSS rules, and the
page rendered unstyled. Structure was measured, so **26 of 50** criteria are answered. Contrast,
focus visibility, reflow, resize, orientation, text spacing, non-text contrast and the licence
type size all stay REQUIRES BROWSER. **They did not become passes**, and on a clean fixture that
distinction matters more than anywhere else: this is exactly the run where an auditor would be
tempted to let unanswered slide into answered.

**Five things about this artifact are newer than the artifact.** The responsible broker line,
the privacy policy links and the three parts of the consent text were added on 2026-09-07,
because the auditor grew from six standards to eighteen and the fixture no longer answered them.
That is recorded in `samples/pass-case/NOTES.md` rather than left for a reader to notice. The
matching defects in `fail-case/` were left exactly as they were, so the pair still differs only
in the defects.

**What a person still has to do.** Supply `style.css`, `/privacy.html` and `/originals.html`,
and this run answers eleven more rows. Decide the twenty-two REQUIRES HUMAN judgements. Check
both licence numbers at `www2.dre.ca.gov`.

**What this audit did not do.** It did not predict rankings, did not give keyword advice, did
not judge writing quality, and did not give legal advice.
