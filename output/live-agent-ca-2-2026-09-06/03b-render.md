# 03b-render.md, run `live-agent-ca-2-2026-09-06`

Stage 03 in browser mode. **Numbers only.** No verdicts are issued here. Stages 07 and 10 read
this file. The method is `method/browser-mode.md`.

## What was rendered

| | |
|---|---|
| Artifact | `samples/live-agent-ca-2/` |
| Served from | `python3 -m http.server 8765 --bind 127.0.0.1`, loopback only |
| URL rendered | `http://127.0.0.1:8765/index.html` |
| Browser | Chromium via the Playwright MCP tools |
| Viewports | 1280x900, then 320x800 |
| Date | 2026-09-06 |

## Did the CSS arrive

| Reading | Value |
|---|---|
| `document.styleSheets.length` | **11** |
| `<link rel="stylesheet">` tags | 1 |
| `<style>` tags | 10 |

Not zero, so colour and layout measurements below are real. Had this read 0 with a stylesheet
link present, every colour row would have stayed REQUIRES BROWSER.

## Page-level readings

| Reading | Value |
|---|---|
| `document.documentElement.lang` | `en-US` |
| `document.title` | `Alex Agent Real Estate Agent \| Leading Realtor in Example City, CA` |
| `<h1>` elements | **0** |
| `<main>` or `[role=main]` | **0** |
| `<nav>` elements | 2 |
| `document.images.length` | 5 |
| `document.forms.length` | 1 |
| `<iframe>` elements | 2 |
| `[role=status]`, `[role=alert]`, `[aria-live]` | **0** |
| Elements carrying a `lang` attribute | 1 (the `<html>` element) |

## Contrast, for `WCAG-1.4.3`

Method: the Tier 1 routine in `method/browser-mode.md`, colours resolved through a 1px canvas,
never by parsing a computed colour string.

| Result | Count |
|---|---|
| Text elements measured | 82 |
| Ratio at or above the required threshold | **32** |
| REQUIRES HUMAN, text sits over a picture or the backdrop was not found | **50** |
| Below the threshold | **0** |

The lowest four passing measurements, so a reader can see how close it runs:

| Text | Foreground | Background | Ratio | Size / weight | Required |
|---|---|---|---|---|---|
| `(555) 555-0173` | `rgb(68,127,135)` | `rgb(255,255,255)` | 4.53 | 25px / 500 | 3 |
| `Work With Agent` | `rgb(68,127,135)` | `rgb(255,255,255)` | 4.53 | 16px / 500 | 4.5 |
| `Visit Past Sales` | `rgb(68,127,135)` | `rgb(255,255,255)` | 4.53 | 16px / 500 | 4.5 |
| `My aim is to make buying or selling a ...` | `rgb(84,89,95)` | `rgb(255,255,255)` | 7.07 | 16px / 400 | 4.5 |

**Fifty of eighty-two could not be computed.** This is a page built on full-bleed background
photographs, so most of its text sits over a picture. A ratio against a photograph is not
computable this way and guessing at it would be inventing evidence.

## Keyboard, for `WCAG-2.1.1`, and focus visibility, for `WCAG-2.4.7`

### Real Tab traversal, 12 presses from `document.body`

Recorded with a `focusin` listener. Focus landed, in order, on: Facebook, Instagram, Google,
Home, About, Resources, Listings, Testimonials, Home Valuation, Example City CA Homes, Contact,
Work With Agent. That is DOM order with the `tabindex="-1"` duplicates skipped, so **focus order
matches DOM order** over the part traversed.

Three menu links did not receive focus. Their ancestor `ul.sub-menu` reads
`display: none`, and their bounding rectangle is 0x0, so they are a closed dropdown rather than
unreachable content.

### Focus indicator, every visible focusable element

Each element's computed `outline-style`, `outline-width`, `outline-color`, `box-shadow`,
`border`, `background-color`, `color` and `text-decoration-line` were read unfocused, then
focused, then compared.

| Reading | Value |
|---|---|
| Visible focusable elements with `tabIndex >= 0` | **24** |
| Elements where **no** computed property changed on focus | **3** |

The three, all sharing class `button_medium border_b button_settings`:

| Element | Unfocused | Focused |
|---|---|---|
| `a` "Work With Agent" (hero) | `outline-style: none`, `box-shadow: none`, `border: 2px solid rgb(68,127,135)` | identical |
| `a` "Work With Agent" (second) | same | identical |
| `a` "Visit Past Sales" | same | identical |

`outline-style` is `none` in both states, so no outline is painted in either.

### Elements visible on the page but outside the tab order

| Element | Text | `tabIndex` |
|---|---|---|
| `summary` | `Q2: Why should I work with a local...` | **-1** |
| `summary` | `Q3: How do I find a realtor in Exa...` | **-1** |
| `summary` | `Q4: What's the process of buying a...` | **-1** |
| `summary` | `Q5: How can I sell my home in Exam...` | **-1** |

The fifth, `Q1`, carries `tabindex="0"` and is reachable. All five are `<summary>` elements
inside `<details>`, so each is the only control that opens its answer.

## Licence number type size, for `CA-2773(a)-TYPESIZE`

| Reading | Value |
|---|---|
| Licence number element | `span`, text `License #01885544` |
| Its computed `font-size` | **16px** |
| Smallest computed `font-size` of any visible text on the page | **11px**, `div`, `Copyright © 2026 Alex Agent Real Estate` |
| Every distinct size on the page | 11, 14, 16, 18, 20, 25, 26, 32, 42 |

16px is larger than 11px.

## Reflow at 320 CSS pixels, for `WCAG-1.4.10`

| Reading | Value |
|---|---|
| Viewport width | 320 |
| `document.documentElement.scrollWidth` | **320** |
| Overflow beyond the viewport | **0px** |

Child elements do extend past 320px, all of them inside the testimonial carousel
(`div.swiper-slide`, right edge 532px, 780px, 1028px). A carousel scrolls inside itself; the
document does not scroll horizontally.

## Resize text to 200 percent, for `WCAG-1.4.4`

Root font size set to `200%`.

| Reading | Value |
|---|---|
| `scrollWidth` | 1280 |
| `clientWidth` | 1280 |
| Horizontal overflow | **none** |

## Text spacing overrides, for `WCAG-1.4.12`

The criterion's own four overrides applied: line height 1.5em, paragraph spacing 2em, letter
spacing 0.12em, word spacing 0.16em.

| Reading | Value |
|---|---|
| `scrollWidth` after the overrides | 1280, unchanged |
| Boxes whose content then exceeded their fixed height with `overflow-y: hidden` | 8 |

Seven of the eight are `span.elementor-screen-only`, which are 1px visually hidden spans that
exist to give social icons a text name; clipping there is by design and loses nothing. The
eighth is `div.slider_f`, the hero, `scrollHeight` 1350 against `clientHeight` 900.

## Animation, for `WCAG-2.2.2`

| Reading | Value |
|---|---|
| `document.getAnimations().length` | 9 |
| Animations with `iterations: Infinity`, state `running` | **8** |
| Their duration | 1000ms each |
| Their target | `div.line_title`, eight instances |
| Controls matching pause, stop or hide | **0** |

An animation repeating without end runs for longer than five seconds.

## Bypass mechanism, for `WCAG-2.4.1`

| Reading | Value |
|---|---|
| First in-page link in `<body>` | `About`, href `#about` |
| A link that moves focus to the main content | **none found** |
| `<main>` or `[role=main]` landmark | **0** |
| `<nav>` landmarks | 2 |
| Heading elements on the page | 30 |

## Headings as rendered, for `WCAG-1.3.1`

Order as they appear in the DOM: H3, H3, H3, H2, H2, H2, H2, H2, H2, H2, H4, H5, H4, H5, H2,
H2, H4, H4, H4, H4, H2, **H2 (empty)**, H2, H2, H2, H2, H3, H3, H2, H4.

The first heading on the page is an H3 holding a phone number. There is no H1. One H2 is empty:
its DOM serialisation is `<h2 class="elementor-heading-title elementor-size-default"></h2>`,
with no text content. It does not appear as an empty element in the saved source, so it is
generated after parse, which is why this reading is recorded here and carries no source line.

## Form controls

| Control | Type | Label | `aria-label` | Placeholder |
|---|---|---|---|---|
| `input[name=s]` | search | **none** | **none** | `Search` |

Both contact forms are `<iframe>` elements on `api.leadconnectorhq.com`. Both carry a `title`
attribute, `Home Valuation` and `Quote`. Their contents are cross-origin and were not read.

## Links opening in a new tab

30 measured across the page. 11 carry `target="_blank"`; of those, 6 carry no `rel` attribute,
1 carries `nofollow noopener` (the Zillow profile link), and the rest carry `noopener`.

## Images

| Reading | Value |
|---|---|
| `<img>` elements rendered | 5 |
| Missing an `alt` attribute entirely | **0** |
| Carrying `alt=""` | 3 (the header logo and two 1x1 base64 lazy-load placeholders) |
| Links whose only content is an image | **0** |
| Links with no accessible text at all | **0** |

## What browser mode did not reach on this page

The ten HUMAN criteria do not move. `WCAG-2.1.4`, `WCAG-2.5.1`, `WCAG-2.5.2`, `WCAG-2.5.4` and
`WCAG-1.4.13` stay REQUIRES HUMAN. Text inside images is not reached by the contrast routine at
all. The two iframed forms are cross-origin, so every check that needs to read a form field on
this page is INSUFFICIENT EVIDENCE, not a pass.
