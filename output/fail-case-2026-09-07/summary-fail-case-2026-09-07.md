# Website check for Marisol Vega Real Estate

Prepared 2026-09-07. Pages checked: the home page and the robots file.

This is a check against published rules, not an opinion about your website. Every point below
names the rule it comes from, and the full text of every rule is in the `reference/` folder that
came with this report. You or your developer can open any rule and check it yourself.

> **Nobody named here exists.** This is a made-up website built to test the auditor, with a
> deliberate mistake seeded against every level of seriousness. Its twin, `pass-case`, is the
> same site with all of them fixed. The real websites are the three `live-` reports.

---

## What is already right

8 of the rules we could check came back clean. The ones worth naming:

- **Your licence number is on the page, and it has the right number of digits.**
- **Your "skip to content" link works.** Someone using a keyboard can jump past your menu
  straight to the page content. Most sites either do not have one or have one that is broken.
- **Every part of the page can be reached with a keyboard.** Nothing is trapped and nothing is
  skipped over.
- **Nothing on the page is hidden from visitors but shown to Google.**
- **Your hidden Google data is at least valid.** The punctuation is correct and it loads, which
  is more than many sites manage. What it says is a separate problem, below.
- **Your wording raised no fair housing flags.**
- **One of your four photographs is correctly outside the new California AI image law**, because
  the only things done to it were exposure, straightening and cropping. That is exactly the
  exclusion the law spells out.

---

## What needs fixing

Ordered worst first. The bracketed code is the rule, so your developer can look it up.

### Could become a criminal matter in California

**Three of your listing photographs were digitally altered and nothing on the page says so.**
[CA-10140.8(a)(1)-STATEMENT, -CONSPICUOUS, -LINK, -POINTER, and CA-10140.8(a)(2)]

Where: `index.html` lines 45, 46 and 47. The kitchen, the living room and the floor plan render.
What we found: two things, and the first needed no help from you. **We searched your whole page
for any wording about images being altered, staged or AI-generated, and for any link to original
versions. There is none of either.** Then your own image notes told us why that matters: they say
furniture and a fruit bowl were added to the kitchen with generative AI, that a sofa, rug and
wall art were added to the living room and the wall colour changed, and that the floor plan image
was generated.
What it means: a California law in force since 1 January 2026 says that if you advertise a
property with a digitally altered image, the advertisement must say the image was altered, put
that statement on or next to the image, link to the unaltered originals, and say in the
statement that the originals can be found at that link. None of the four is done. The
Legislative Counsel's own summary of the bill says it creates "new requirements on real estate
licensees, the violation of which is a crime". It also binds anyone acting on your behalf, which
means your web developer and your marketer too.
The fix: `pass-case/index.html` lines 76 to 81 show the whole thing done, for one image, in
about six lines of HTML.

**Your responsible broker is not named anywhere on the page.** [CA-2773(a)-BROKER]

Where: `index.html` line 76, where it should be.
What we found: "Marisol Vega, DRE #01234567. Copyright 2026." We searched the page for
"broker", "brokerage", "Inc", "Realty", "Group" and "Associates" and found none of them.
What it means: California requires a salesperson's advertising to carry the responsible
broker's name as currently licensed. "Marisol Vega Real Estate" is your own name, not a
brokerage.
The fix: add the broker's licensed name next to your licence number.

**There is no privacy policy on your website.** [CALOPPA-22575(a)-POSTED]

Where: `index.html` line 76.
What we found: we searched the whole page for the word "privacy". It is not there.
What it means: California says a site collecting personal details must post a privacy policy
where people can find it. Your enquiry form asks for a name, an email and a phone number.
The fix: write one, and link to it from the footer with the words "Privacy Policy".

**Your form asks for a phone number and says nothing about texting people.**
[TCPA-64.1200(f)(9)-AGREEMENT, (i)(A) and (i)(B)]

Where: `index.html` line 61, the phone field.
What we found: no consent wording, no tick box, and no mention of calls or texts anywhere in
the form.
What it means: federal rules set out what written consent has to say before a business may
send automated calls or texts. Right now there is nothing at all for someone to agree to. If
you ever text these numbers using an automated system, three separate requirements are unmet:
having consent at all, saying that agreeing allows automated contact, and saying that agreeing
is not a condition of buying anything.
The fix: `pass-case/index.html` lines 105 to 111 show all three met in one sentence and one
tick box.

*We are not lawyers and none of the above is legal advice.*

### Stops Google listing the page at all

**Two separate things are telling Google not to list this page.** [GSE-TR-1]

Where: `index.html` line 5, and `robots.txt` lines 7 and 8.
What we found: `<meta name="robots" content="noindex, follow">` in the page, and a
`Googlebot` block in the robots file saying `Disallow: /`.
What it means: either one on its own would keep the page out of Google. Nobody searching for
you will find it. Google's own words are that a page like this "is not eligible to be indexed".
The fix: delete the meta tag on line 5, and delete the Googlebot block from the robots file.

### Stops people using the site

Nine problems here. The most important four:

**Your page has no title.** [WCAG-2.4.2] `index.html` line 6 is `<title></title>`. That is the
text in the browser tab and the blue line in Google results. Yours is blank.

**Four of your five pictures have no description for screen readers.** [WCAG-1.1.1] Lines 29,
45, 46 and 47. Someone using a screen reader is told nothing about them.

**None of your form fields has a label.** [WCAG-3.3.2 and WCAG-4.1.2] Lines 59 to 62. They rely
on the grey placeholder text, which vanishes the moment somebody starts typing, so a user who
loses their place has no way to know which box is which. A screen reader announces them as
unnamed.

**Three links all say "click here" and go to three different places.** [WCAG-2.4.4] Lines 52 to
54. Screen reader users often pull up a list of the links on a page. Yours reads "click here,
click here, click here".

The other five: your page does not say what language it is in, the same `id` is used twice,
your headings start at level three and the level one comes after, and your form fields do not
tell the browser what they are for so autofill cannot help.

### Stops your listing showing properly in Google

**Your hidden Google data claims things that are not on the page.** [SD-GEN-CONTENT-4 and
SD-GEN-CONTENT-5] Lines 15 and 16 to 20. It says you were "Voted #1 Agent in Yolo County 2025",
which appears nowhere on the page, and it carries a 5.0 star rating from 214 people, which also
appears nowhere. Google's rule is that you may not mark up content that is not visible to
readers, and star ratings you gave yourself are the specific case they warn about.

**It is also missing your address**, which is a required field [SD-LB-REQ-address], **uses a
less specific business type than it should** [SD-GEN-SPECIFICITY-1], and **your phone number has
no country code** [SD-LB-REC-telephone].

### Worth fixing, low stakes

**A rule in your robots file does nothing.** [RFC9309-2.2.2] Line 1 says `Disallow: /wp-admin/`
before naming which crawler it applies to, and the standard says crawlers should ignore rules
that are not in a group. Move it under the `User-agent: *` line.

---

## One thing we looked at hard and refused to call a problem

Your footer lists 47 towns and neighbourhoods and nothing else, from Davis all the way out to
Placerville and Roseville. That closely matches Google's own published example of keyword
stuffing: "blocks of text that list cities and regions that a web page is trying to rank for".

**We did not report it as a failure.** Google's rule turns on what you were trying to do, and we
cannot read that from a file. A real service-area list and a stuffed footer look identical.

What would settle it: whether you actually work in all 47. Your notes say your brokerage and
listings are in Yolo County, which covers nine of the names. It does not cover Placerville,
Folsom, Roseville, Rocklin, Auburn or Granite Bay, which are 40 to 70 miles away in other
counties. **That is a reason to ask you, not a finding against you.**

---

## What we could not check

Being straight about this matters more than the list above.

- **Your stylesheet is missing from the folder we were given.** We opened the page in a real
  browser and it rendered with no styling at all, because `style.css` is not there. That means
  **eight checks could not be done**: colour contrast, whether the keyboard highlight is
  visible, how the page behaves on a phone, what happens at 200 percent text size, screen
  rotation, text spacing, the contrast of your buttons and boxes, and whether your licence
  number is large enough under California's type size rule. **None of those is a pass. They are
  unanswered.** Send the stylesheet and we can answer all eight.
- **24 of the 50 accessibility rules still need a person or the stylesheet.** We answered 26.
  **A clean result here does not mean the site is accessible.**
- **We could not check your sitemap.** Your robots file points at one and it was not included.
- **We could not check whether the site uses HTTPS properly.** That needs the server's response
  headers, which a saved file does not have.
- **We did not follow any of your links**, so we cannot say whether they work.

---

## The rules we checked against

| Rule set | Who publishes it | Version we used |
|---|---|---|
| Google Search technical requirements, spam policies, structured data guidelines, `LocalBusiness` properties and outbound link guidance | Google | retrieved September 2026 |
| WCAG 2.1, Levels A and AA, all 50 success criteria | World Wide Web Consortium | W3C Recommendation 06 May 2025 |
| California Business and Professions Code section 10140.8 (AB 723) | California Legislative Counsel | in force from 1 January 2026 |
| 10 CCR 2773, licence identification in advertising | California Office of Administrative Law | current |
| California Business and Professions Code section 22575 (CalOPPA) | California Legislative Counsel | current |
| 24 CFR 100.75, discriminatory advertising | US Dept of Housing and Urban Development | current |
| 47 CFR 64.1200(f)(9), prior express written consent | US Federal Communications Commission | current |
| RFC 9309, Robots Exclusion Protocol, and RFC 6797, HSTS | Internet Engineering Task Force | Standards Track |
| Bing Webmaster Guidelines | Microsoft | retrieved September 2026 |
| Sitemaps XML protocol 0.9, and the IndexNow protocol | sitemaps.org, IndexNow | current |
| The OpenAI, Anthropic and Perplexity crawler documentation | OpenAI, Anthropic, Perplexity | retrieved September 2026 |

The full text of each is in `reference/`. The full working, with every rule we checked and how
it came out, is in `audit-fail-case-2026-09-07.md` beside this file.

**On the California rules and the federal ones.** We are not lawyers and this is not legal
advice. We reproduced the text of each rule and reported whether your page matches it. Before
you rely on any of it, have your broker's compliance desk or a real estate attorney confirm how
they want it handled.

**On fair housing.** The wording scan raised nothing. That is not a clearance. Fair housing
wording is a judgement about meaning in context, and this check never makes that judgement.
