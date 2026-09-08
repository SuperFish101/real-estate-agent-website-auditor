# Website check for {{BUSINESS_NAME}}

Prepared {{DATE}}. Pages checked: {{PAGE_LIST}}.

This is a check against published rules, not an opinion about your website. Every point below
names the rule it comes from, and the full text of every rule is in the `reference/` folder
that came with this report. You or your developer can open any rule and check it yourself.

---

## What is already right

{{PASS_COUNT}} of the {{CHECKED_COUNT}} rules we were able to check came back clean.

{{PASS_HIGHLIGHTS}}

<!-- Three to six of the most meaningful passes, in plain English, one line each.
     Lead with the ones a business owner would worry about. For example:
     - Google is allowed to read every page we looked at.
     - Every photograph that was digitally altered carries the disclosure California requires.
     - Every image on the page has alternative text for screen readers. -->

---

## What needs fixing

Ordered worst first. The bracketed code is the rule, so your developer can look it up.

### {{SEVERITY_BAND}}

{{FINDINGS}}

<!-- One block per finding, in this shape:

  **Google is being told not to list this page.** [GSE-TR-1]

  Where: `index.html`, line 5.
  What we found: `<meta name="robots" content="noindex, follow">`
  What it means: this tag tells Google to keep the page out of search results
  entirely. Nobody searching for you will find this page.
  The fix: delete that line.

  Rules for writing these:
  - The bold line is the consequence in the owner's words, not the rule's name.
  - "What it means" never uses a term it has not explained in the same sentence.
  - "The fix" is specific to this page, never "improve accessibility".
  - Do not invent a finding here that is not in the full ledger. -->

---

## What we could not check

Being straight about this matters more than the list above.

- **{{WCAG_UNCHECKED}} of the 50 accessibility rules still need a person**, not a tool. We
  checked {{WCAG_CHECKED}} of them. The rest need somebody to watch a video, read a sentence or
  judge whether a picture carries meaning. **A clean result here does not mean the site is
  accessible.**
- **We opened your page in a real browser and measured it**, at full size and at phone size.
  Colour contrast, keyboard use and focus visibility are all real measurements in this report,
  and every number is written down so you can take it again. {{BROWSER_NOTE}}
- **We did not visit your live website while writing this.** We saved a copy of the page on
  {{DATE}} and worked from that, so every point can be checked against the exact same file
  months later. If the live site has changed since, the findings may differ.
- {{OTHER_LIMITS}}

---

## The rules we checked against

| Rule set | Who publishes it | Version we used |
|---|---|---|
| Google Search technical requirements, spam policies, structured data guidelines, `LocalBusiness` properties and outbound link guidance | Google | retrieved {{DATE_REF_GOOGLE}} |
| WCAG 2.1, Levels A and AA, all 50 success criteria | World Wide Web Consortium | W3C Recommendation |
| California Business and Professions Code section 10140.8 (AB 723) | California Legislative Counsel | in force from 1 January 2026 |
| 10 CCR 2773, licence identification in advertising | California Office of Administrative Law | current |
| California Business and Professions Code section 22575 (CalOPPA) | California Legislative Counsel | current |
| 24 CFR 100.75, discriminatory advertising | US Dept of Housing and Urban Development | current |
| 47 CFR 64.1200(f)(9), prior express written consent | US Federal Communications Commission | current |
| RFC 9309, Robots Exclusion Protocol, and RFC 6797, HSTS | Internet Engineering Task Force | Standards Track |
| Bing Webmaster Guidelines | Microsoft | retrieved {{DATE_REF_GOOGLE}} |
| Sitemaps XML protocol 0.9, and the IndexNow protocol | sitemaps.org, IndexNow | current |
| The OpenAI, Anthropic and Perplexity crawler documentation | OpenAI, Anthropic, Perplexity | retrieved {{DATE_REF_GOOGLE}} |

The full text of each is in `reference/`.

**On the California rules and the federal ones.** We are not lawyers and this is not legal
advice. We reproduced the text of each rule and reported whether your page matches it. Before
you rely on any of it, have your broker's compliance desk or a real estate attorney confirm how
they want it handled.

**On fair housing.** Where we flagged wording, we did not decide anything. Fair housing wording
is a judgement about meaning in context, and this check never makes that judgement. It points
at the sentence and hands it to a person.
