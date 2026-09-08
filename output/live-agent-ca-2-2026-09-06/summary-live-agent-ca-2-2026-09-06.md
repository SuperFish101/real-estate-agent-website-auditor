# Website check for a California real estate agent

Prepared 2026-09-06. Pages checked: the home page, the robots file and two sitemap files.

This is a check against published rules, not an opinion about your website. Every point below
names the rule it comes from, and the full text of every rule is in the `reference/` folder
that came with this report. You or your developer can open any rule and check it yourself.

> **This report is published with the identity removed.** The site is a real California
> licensee's site. The owner did not ask to be audited, so the name, the domain, the phone
> number, the licence number and the brokerage names have all been swapped for placeholders.
> Nothing else was touched. The method is `method/anonymising-a-run.md`.

---

## What is already right

**Most of it.** Here are the ones a business owner would worry about.

- **Google is allowed to read this page.** Nothing blocks it, and the page asks to be listed.
- **ChatGPT, Claude and Perplexity can all read it too.** None of the three is shut out, so the
  page can turn up in an AI answer.
- **Your licence number is on the page, and it is the right size.** California says the licence
  number can never be smaller than the smallest text on the page. Yours is 16 pixels and the
  smallest text on the page is 11. That rule is broken more often than any other on agent sites.
- **Your responsible broker is named.**
- **Nothing on the page is a search engine spam problem.** We looked hard at this and found
  nothing we could stand behind. More on that below.
- **Every picture has alternative text for screen readers, or is correctly marked as decoration.**
- **The text you can read is dark enough against its background.** We measured 82 pieces of text
  in a real browser. None was below the required contrast.
- **The page works on a phone.** At 320 pixels wide, nothing runs off the side of the screen.
- **Your robots file is valid**, and your sitemap is listed in it correctly.

---

## What needs fixing

Ordered worst first. The bracketed code is the rule, so your developer can look it up.

### Could become a legal problem

**There is no privacy policy on your website.** [CALOPPA-22575(a)-POSTED]

Where: the footer, `index.html` line 966.
What we found: we searched the whole page for the word "privacy". It is not there. Not a link,
not a heading, not a sentence.
What it means: California law says a website that collects personal details has to post a
privacy policy where people can find it. Your page has two forms that ask visitors for their
name, email and phone number, so the law applies to you. There is nothing posted.
The fix: write a privacy policy and put a link to it in your footer, with the words "Privacy
Policy" as the link text.

*We are not lawyers and this is not legal advice.*

### Stops people using the site

**Four of your five FAQ questions cannot be opened using a keyboard.** [WCAG-2.1.1]

Where: `index.html` line 936, the FAQ section.
What we found: four of the five question headers carry a setting called `tabindex="-1"`.
What it means: some people cannot use a mouse and move through a page using the Tab key.
That setting takes those four questions out of the path Tab follows, so they can see the
questions and can never open the answers. The first question works. The other four do not.
The fix: delete `tabindex="-1"` from those four question headers. They work by default.

**Three buttons give no sign when you land on them with a keyboard.** [WCAG-2.4.7]

Where: `index.html` line 936. The two "Work With Agent" buttons and "Visit Past Sales".
What we found: we measured each button in a browser before and after moving to it with the
keyboard. Nothing changes. No outline, no shadow, no colour shift.
What it means: a keyboard user tabbing through your page cannot tell when they have reached
these three buttons, so they cannot tell what pressing Enter will do. The other 21 controls on
your page do show a marker, so this is three buttons and not a whole-site problem.
The fix: your developer should remove the `outline: none` rule on those buttons, or replace it
with a visible outline.

### Stops your listing showing properly in Google

**Two of your three blocks of hidden Google data are broken and cannot be read at all.**
[SD-GEN-FORMAT-1]

Where: `index.html` line 849 and line 870.
What we found: line 849 has a piece of information sitting outside the closing bracket, so the
whole block fails to load. Line 870 has a stray piece of editor code pasted into the middle of
it, which does the same thing.
What it means: this is the invisible summary your site gives Google about your business: name,
address, phone, hours. Because the punctuation is wrong, Google reads none of it. Every detail
in those two blocks is thrown away. This is the block that would help you appear as a business
listing rather than a plain blue link.
The fix: move the stray `"hasMap"` line inside the closing bracket on line 849 and add the comma
before it. Delete the `<span data-mce-type="bookmark">` from line 870. Both are one-line edits.

---

## One thing we looked at hard and refused to call a problem

Your page repeats its search phrases a lot. "Real estate agent in [city]" seven times,
"realtors in [city]" and "sell my home in [city]" five times each, and the city name 46 times in
about 1,660 words.

That is the pattern people mean when they say keyword stuffing, and **we did not report it as a
failure.** Google's rule about keyword stuffing turns on what you were trying to do, and we
cannot read that from a file. Google's own published example is a block of text that repeats a
phrase and says nothing else. Yours is ordinary marketing copy written around a phrase list.

So the honest answer is: we do not know, and we would rather tell you that than accuse you.
What would settle it is you or your writer saying whether the phrases were put there to rank or
to inform. If a search engine ever does take issue with this page, this is where it would start.

---

## What we could not check

Being straight about this matters more than the list above.

- **16 of the 50 accessibility rules still need a person**, not a tool. We checked 34 of them.
  The rest need somebody to watch, read or judge whether a picture carries meaning. **A clean
  result here does not mean the site is accessible.**
- **We opened your page in a real browser and measured it**, at full size and at phone size.
  Colour contrast, keyboard use and focus visibility are all real measurements here, and every
  number is written down so you can take it again. 50 of the 82 pieces of text we measured sit
  on top of a photograph, and contrast over a photograph cannot be calculated. Those 50 need a
  person to look at them.
- **Your two contact forms are run by another company and we could not see inside them.** They
  load from `leadconnectorhq.com`. That means we could not read the consent wording next to your
  phone number field. **This is the biggest hole in this report.** There are federal rules about
  what has to be written next to a phone number field before you can text somebody, and we
  cannot tell you whether yours meet them. Open each form, read the small print, and check it
  says two things: that agreeing lets you send automated calls or texts, and that agreeing is not
  a condition of buying anything.
- **We did not visit your live website while writing this.** We saved a copy on 2026-09-06 and
  worked from that, so every point can be checked against the same file months later.
- **On the new California AI image law, we answered half of it and the half we answered
  matters.** Your page carries nine images and **says nothing anywhere about any of them being
  digitally altered, and links to no original versions.** So if any one of those nine was
  altered, your page does not meet the law today. What we cannot tell you is which of them was
  altered, because that needs one sentence from whoever made the site. Worth knowing: this page
  shows no photographs of properties at all, only a portrait, a logo and backgrounds, so your
  practical exposure is smaller than most agents'.

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
it came out, is in `audit-live-agent-ca-2-2026-09-06.md` beside this file.

**On the California rules and the federal ones.** We are not lawyers and this is not legal
advice. We reproduced the text of each rule and reported whether your page matches it. Before
you rely on any of it, have your broker's compliance desk or a real estate attorney confirm how
they want it handled.

**On fair housing.** We flagged one sentence: the word "family" in a client testimonial, in the
phrase "recommended her to our friends and family". We did not decide anything about it. Fair
housing wording is a judgement about meaning in context, and this check never makes that
judgement. It points at the sentence and hands it to a person.
