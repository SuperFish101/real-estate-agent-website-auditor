# Website check for Marisol Vega Real Estate

Prepared 2026-09-07. Pages checked: the home page and the robots file.

This is a check against published rules, not an opinion about your website. Every point below
names the rule it comes from, and the full text of every rule is in the `reference/` folder that
came with this report. You or your developer can open any rule and check it yourself.

> **Nobody named here exists.** This is a made-up website built to test the auditor. It is the
> repaired twin of `fail-case`, which is the same page with a deliberate mistake seeded against
> every level of seriousness. The real websites are the three `live-` reports.

---

## What is already right

**Nothing we were able to check came back as a problem.** 46 rules checked, 46 clean. The ones
worth naming:

- **Google is allowed to list this page**, and so are ChatGPT, Claude and Perplexity.
- **Both licence numbers are on the page**, yours and your responsible broker's, each beside the
  name it belongs to. When more than one licensed person is named, California wants a number for
  each, and that is the rule team sites miss most often.
- **Every digitally altered photograph says so, next to the picture, with a link to the
  original.** That is all four parts of the new California AI image law, done. This is the single
  hardest thing on this list to get right and almost nobody does. We checked it two ways: by
  searching your page for alteration wording and links to originals, which found seven phrases
  and three links, and by reading your image notes to see which pictures actually needed them.
- **Your form asks permission properly before you call or text.** Real consent wording, a tick
  box that starts empty, the form will not send without it, and it says both of the things the
  federal rule requires: that agreeing allows automated contact, and that agreeing is not a
  condition of buying anything.
- **Your privacy policy is linked twice and both links say "Privacy Policy".**
- **Every picture has a description for screen readers.**
- **Every form field has a proper label.**
- **Your skip link works**, your page says what language it is in, no `id` is used twice, and
  your headings run in order from level one.
- **Your hidden Google data is complete and honest.** Name, full address, phone with a country
  code, opening hours, map coordinates and price range, and it uses the most specific business
  type available. **No invented awards and no star rating you gave yourself.**
- **Your footer names three towns and a county**, which reads as a service area rather than a
  list of places you want to rank for.

---

## What needs fixing

**Nothing that we could check.** There are no findings in this report.

**Please do not read that as a clean bill of health**, and the rest of this page explains why.
Fifty of the 141 rules could not be answered at all, and unanswered is not the same as passed.
An audit that let a zero stand for the whole website would be misleading you.

---

## What we could not check

This is the important part of this particular report.

- **Your stylesheet is missing from the folder we were given.** We opened the page in a real
  browser and it rendered with no styling, because `style.css` is not there. **Eight checks
  could not be done**: colour contrast, whether the keyboard highlight is visible, how the page
  behaves on a phone, what happens at 200 percent text size, screen rotation, text spacing, the
  contrast of your buttons and boxes, and whether your licence number is large enough under
  California's type size rule. **None of those is a pass.** Send the stylesheet and we can answer
  all eight.
- **24 of the 50 accessibility rules still need a person or the stylesheet.** We answered 26.
  **A clean result here does not mean the site is accessible.**
- **Three pages you link to were not included**, so we could not open them: your privacy policy,
  your unaltered images page and your sitemap. The unaltered images page matters most, because
  the California image law is only satisfied if the originals are actually there. We confirmed
  you link to it correctly. We could not confirm what is on it.
- **We could not check whether the site uses HTTPS properly.** That needs the server's response
  headers, which a saved file does not have.
- **We did not follow any of your links**, so we cannot say whether they work.
- **Whether your licence numbers are genuine** is settled at `www2.dre.ca.gov`, not from a file.

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
it came out, is in `audit-pass-case-2026-09-07.md` beside this file.

**On the California rules and the federal ones.** We are not lawyers and this is not legal
advice. We reproduced the text of each rule and reported whether your page matches it. Before
you rely on any of it, have your broker's compliance desk or a real estate attorney confirm how
they want it handled.

**On fair housing.** The wording scan raised nothing. That is not a clearance. Fair housing
wording is a judgement about meaning in context, and this check never makes that judgement.
