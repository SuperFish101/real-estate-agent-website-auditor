# Website check for a California real estate agent

Prepared 2026-09-05. Pages checked: the home page, the robots file, the sitemap and the
stylesheet.

This is a check against published rules, not an opinion about your website. Every point below
names the rule it comes from, and the full text of every rule is in the `reference/` folder that
came with this report. You or your developer can open any rule and check it yourself.

> **This report is published with the identity removed.** The site is a real California
> licensee's site. The owner did not ask to be audited, so the name, the domain, the phone
> number, the licence numbers and both brokerage names have been swapped for placeholders.
> Nothing else was touched. The method is `method/anonymising-a-run.md`.

---

## What is already right

**This site is in better shape than most.** The ones a business owner would worry about:

- **Google is allowed to read every part of this page.**
- **ChatGPT, Claude and Perplexity can all read it too.**
- **Your licence number is on the page, and so is your broker.**
- **Your licence number is large enough** under California's type size rule.
- **Your robots file is valid** and your sitemap is correctly listed in it.
- **Your hidden Google data is the right type and it loads.** Business name and full address are
  both there, which are the two required fields.
- **138 of the 170 pieces of text we measured are dark enough against their background.** Four
  fall short and they are near misses, listed below.
- **Nothing on the page is a search engine spam problem** that we could stand behind.
- **Your wording raised no fair housing flags.**

---

## What needs fixing

Ordered worst first. The bracketed code is the rule, so your developer can look it up.

### Could become a legal problem

**Your two forms ask for a phone number and say nothing about calling or texting.**
[TCPA-64.1200(f)(9)-AGREEMENT and (i)(B)]

Where: `index.html` lines 451 and 617, the home valuation form and the contact form.
What we found: both forms take a phone number. Neither has any consent wording, any tick box, or
any mention of calls or texts. We searched the form markup for "consent", "agree", "autodial"
and "text message" and found none of them.
What it means: federal rules set out what written consent must say before a business may send
automated calls or texts. Right now there is nothing for anyone to agree to. If you ever text
these numbers using an automated system, two things are missing: consent at the point you
collect the number, and the sentence saying that agreeing is not a condition of buying anything.
The fix: one sentence beside the phone field, tied to an empty tick box.

**Your privacy policy is not named as one.** [CALOPPA-22575(a)-POSTED]

Where: `index.html` line 692, the footer.
What we found: one link, reading "Terms & Privacy", pointing at a terms and conditions page.
There is no link that names a privacy policy as its own document.
What it means: California says a site collecting personal details must post its privacy policy
where people can find it. Three forms on this page collect names, emails and phone numbers. What
you have is a combined link that names terms first and privacy second, going to a page titled
terms and conditions. We could not check what is on that page because it was not part of what we
looked at. What we can say is that nothing on this page names a privacy policy.
The fix: a separate footer link reading "Privacy Policy", pointing at a privacy policy.

*We are not lawyers and neither of the above is legal advice.*

### Stops people using the site

**Your form fields have no labels.** [WCAG-3.3.2 and WCAG-4.1.2] They rely on grey placeholder
text, which disappears the moment somebody starts typing. A screen reader announces them as
unnamed boxes.

**Your form fields do not tell the browser what they are for.** [WCAG-1.3.5] Adding
`autocomplete` to the name, email and phone fields lets a visitor's browser fill them in, which
matters most for people who find typing difficult.

**Some pictures have no description for screen readers.** [WCAG-1.1.1]

**Four pieces of text are too pale.** [WCAG-1.4.3] Your licence number is grey on white at 3.88
where 4.5 is needed. Two step numbers are at 3.71. The "Terms & Privacy" link is at 4.28. All
four are near misses, and each is fixed by darkening one colour. **138 other pieces of text on
the page passed**, so this is four items and not a page with a contrast problem.

### Stops your listing showing properly in Google

**Your page names two different brokerages.** [SD-GEN-RELEVANCE-1] The hidden Google data says
you belong to one brokerage. Your visible page text and one of your testimonials name a
different one. The footer names the first again. Google's rule is that the hidden data must be a
true representation of the page. **We are not saying which one is right.** We are saying they do
not match and a reader cannot tell which is current.

### Worth doing, nothing is lost by ignoring it

Three pieces of recommended hidden data are missing: your map coordinates [SD-LB-REC-geo], your
opening hours [SD-LB-REC-openingHoursSpecification] and your price range
[SD-LB-REC-priceRange]. Google's own word for all three is "recommended".

---

## Two things we looked at and refused to report as problems

**We did not call the two-brokerage mismatch a licensing failure.** California requires your
responsible broker's name on your advertising. A broker name is there. Whether it is the
*correct* one is a question about the state's licence register, not about your page, and this
check does not look at the register. So it is reported above as a data mismatch, which is what
we can actually see, and not as a licensing breach, which we cannot.

**We did not call your locality wording keyword stuffing.** It is a judgement about what you
were trying to do, and we cannot read that from a file.

---

## What we could not check

Being straight about this matters more than the list above.

- **16 of the 50 accessibility rules still need a person**, not a tool. We checked 34.
  **A clean result here does not mean the site is accessible.**
- **28 pieces of text sit on top of photographs**, and contrast over a photograph cannot be
  calculated. Those need a person to look at them.
- **We did not visit your live website while writing this.** We saved a copy on 2026-09-05 and
  worked from that, so every point can be checked against the same file months later.
- **On the new California AI image law, we answered half of it.** Your page carries
  twenty-two images and **says nothing anywhere about any of them being digitally altered, and
  links to no original versions.** So if any one of those twenty-two was altered, your page does
  not meet the law today. What we cannot tell you is which of them was, because that needs one
  sentence from whoever made the site.
- **We did not open your terms and conditions page**, so we cannot say whether a conforming
  privacy policy is on it.

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
it came out, is in `audit-live-agent-ca-2026-09-05.md` beside this file, and every number behind
a browser finding is in `03b-render.md`.

**On the California rules and the federal ones.** We are not lawyers and this is not legal
advice. We reproduced the text of each rule and reported whether your page matches it. Before
you rely on any of it, have your broker's compliance desk or a real estate attorney confirm how
they want it handled.

**On fair housing.** The wording scan raised nothing. That is not a clearance. Fair housing
wording is a judgement about meaning in context, and this check never makes that judgement.
