# Website check for a California real estate team

Prepared 2026-09-06. Pages checked: the home page, the robots file and the sitemap.

This is a check against published rules, not an opinion about your website. Every point below
names the rule it comes from, and the full text of every rule is in the `reference/` folder
that came with this report. You or your developer can open any rule and check it yourself.

> **This report is published with the identity removed.** The site is a real California team's
> site. The owners did not ask to be audited, so the names, the domain, the phone number, the
> licence numbers, the brokerage names, the sold addresses and prices, and the clients' names on
> the testimonials have all been swapped for placeholders. Nothing else was touched. The method
> is `method/anonymising-a-run.md`.

---

## What is already right

**Two of these are things most agent sites get wrong.**

- **Both of you have your licence number on the page, right next to your names.** California
  says that when more than one licensed person is named, every one of them needs their number
  shown. Team sites miss this constantly. Yours is correct, and it is the clearest pass in this
  report.
- **Your contact form asks permission before you text anyone, properly.** There is real consent
  wording next to the phone field, tied to a tick box that is empty until the visitor ticks it,
  and the form will not send without it. It tells people how to stop. That is better than most
  agent sites and it is worth saying first.
- **Your licence numbers are the right size**, at 14 pixels against a smallest-text size of 10.
- **Google is allowed to read the page**, and so are ChatGPT, Claude and Perplexity.
- **Somebody thought about your robots file.** It names four scraping bots and slows them down.
  Worth knowing: it says nothing about the AI assistants either way, so they can read the page.
  That is the outcome you want, and it happened by accident rather than on purpose.
- **The page works on a phone.** At 320 pixels wide nothing runs off the side of the screen.
- **The text is dark enough against its background** everywhere a visitor can actually see it.
- **You do not fake your reviews in your website code.** Fourteen testimonial cards, none of
  them marked up as a star rating for Google. That is the correct choice and the commonest
  hidden-data mistake on agent sites.

---

## What needs fixing

Ordered worst first. The bracketed code is the rule, so your developer can look it up.

### Could become a legal problem

**Your consent wording is missing two sentences the federal rule names.**
[TCPA-64.1200(f)(9)(i)(A) and (i)(B)]

Where: `index.html` line 278, the tick box under the contact form.
What we found: your wording says "I agree to be contacted by [name] via call, email, and text
for real estate services", then explains how to opt out. We searched the whole page for the
words "autodial", "prerecorded" and "not a condition". None of them is there.
What it means: the federal rule spells out what written consent has to say before a business
may send automated calls or texts. Two required sentences are missing. The first is that
agreeing lets you contact them by automated means. The second is that agreeing is **not a
condition of buying anything**. That second one matters more here than usual, because your form
will not submit unless the box is ticked, which is exactly the situation that sentence exists
to be honest about.
The fix: two clauses added to the sentence you already have. "...including autodialed or
prerecorded calls and texts. Consent is not a condition of purchase."

**Nothing a visitor can see on your page says "Privacy Policy".**
[CALOPPA-22575(a)-POSTED and CALOPPA-22575(a)-CONSPICUOUS]

Where: the footer, `index.html` line 1141.
What we found: your footer reads `Copyright © 2026 | Policy`, and "Policy" links to your terms
and conditions page. There are three links on the page that do say "Privacy Policy", and all
three are inside contact forms that are shut until somebody clicks to open them.
What it means: California law says a site collecting personal details must post its privacy
policy somewhere people can find it, and the law specifically mentions a link on the home page
using the word "privacy". The only link a visitor can see says "Policy". There is a "Your
Privacy Choices" link, but that one opens a cookie setting box, it does not go to a document.
The fix: change the footer link text from "Policy" to "Privacy Policy". That one word settles
both points.

*We are not lawyers and this is not legal advice.*

### Stops people using the site

**More than half the things you can click give no sign when you land on them with a keyboard.**
[WCAG-2.4.7]

Where: your whole main menu, plus the menu button and the property search box. 19 of 37
controls.
What we found: we measured each one in a browser before and after moving to it with the
keyboard. Nothing changes. No outline, no shadow, no colour shift.
What it means: some people cannot use a mouse and move through a page with the Tab key. On your
site they can tab through the entire main navigation and the search box without ever seeing
where they are. This is the largest accessibility problem on the page.
The fix: your developer should remove the `outline: none` rule on `.navigation__link` and
`.search-input` and let the browser draw its normal focus ring, or draw a visible one.

**All fifteen "Read More" buttons on your testimonials cannot be reached by keyboard.**
[WCAG-2.1.1]

Where: `index.html` line 930 and fourteen more like it.
What we found: every one carries a setting called `tabindex="-1"`.
What it means: a keyboard user can see all fifteen buttons and press none of them. Those are the
only way through to your full testimonials page from that section.
The fix: remove `tabindex="-1"` from the card button. If it is there to stop the off-screen
carousel slides catching focus, apply it only to the slides that are genuinely hidden and clear
it as each one slides into view.

**One image has no description at all.** [WCAG-1.1.1]

Where: `index.html` line 95. A small 16 pixel icon.
What we found: 18 of your 19 images have a description tag, even if it is empty. This one has no
tag at all.
What it means: an empty description tells a screen reader "skip this, it is decoration", which
is a real and useful instruction. No tag at all tells it nothing, so it often reads out the file
name instead, which here is 32 random letters and numbers.
The fix: either describe the icon, or give it an empty description to mark it as decoration.
Either is right. Having neither is not.

---

## Two things we measured and deliberately did not report as problems

**Six pieces of text on your page are too pale to meet the standard, and every one of them is
inside a box that is closed.** A submit button that is black text on a nearly black background,
and your consent small print, its "Privacy Policy" link and a "Read more" button, all measured
at 3.74 where 4.5 is required.

We did not count any of these as failures, **because nobody has ever seen them.** They only
appear once a visitor opens one of your pop-up forms, and we measured the page as it loads.
Reporting them would mean telling you a text colour is wrong in a state we never looked at.

**This is still the single most useful thing anyone can do with this report.** Open each pop-up
form and check those readings. If they hold up, then the consent small print that the legal
point above is about is also hard to read, which makes that point worse rather than better.

**Nine of your photographs are marked as decoration.** They include agent photos and three
photographs of sold houses, and they render around 400 pixels wide. Marking a photograph as
decoration tells a screen reader to skip it entirely. Whether a 400 pixel photograph of a house
you sold is decoration is a judgement, not a measurement, so we are not calling it a failure. It
is the second thing worth a person's time.

---

## What we could not check

Being straight about this matters more than the list above.

- **16 of the 50 accessibility rules still need a person**, not a tool. We checked 34 of them.
  **A clean result here does not mean the site is accessible.**
- **121 of the 135 pieces of text we measured sit on top of a photograph**, and contrast over a
  photograph cannot be calculated. Those need a person to look at them. Your site is very
  image-heavy, so this is a bigger share than usual.
- **Every pop-up and pop-out form on your page was shut when we measured**, so most of your form
  fields were never seen in the state a visitor meets them.
- **We did not fill in or send any of your forms.** They go to a real inbox and it would not be
  right to send you a fake enquiry, so error messages and validation are unchecked.
- **Your page has no hidden data for Google at all.** Not broken: absent. There is no rule
  saying you must have it, so this is not a failure. What it costs you is the chance of showing
  up as a business listing with your address and hours rather than a plain blue link.
- **We did not visit your live website while writing this.** We saved a copy on 2026-09-06 and
  worked from that.
- **On the new California AI image law, we answered half of it and you should act on that
  half.** Your page carries sixteen images, **three of them photographs of real properties you
  sold**, and it **says nothing anywhere about any image being digitally altered, and links to no
  original versions.** So if any one of those three property photographs was altered, staged
  digitally or AI-enhanced, your page does not meet the law today. What we cannot tell you is
  which of them was, because that needs one sentence from whoever made the site. **This is the
  most exposed page in this report on that law**, because it is the only one advertising property
  photography.

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
it came out, is in `audit-live-team-ca-2026-09-06.md` beside this file.

**On the California rules and the federal ones.** We are not lawyers and this is not legal
advice. We reproduced the text of each rule and reported whether your page matches it. Before
you rely on any of it, have your broker's compliance desk or a real estate attorney confirm how
they want it handled.

**On fair housing.** We flagged one phrase: "exclusive news and updates", on your newsletter
signup. We did not decide anything about it, and on its face it describes emails rather than a
house. Fair housing wording is a judgement about meaning in context, and this check never makes
that judgement. It points at the sentence and hands it to a person.
