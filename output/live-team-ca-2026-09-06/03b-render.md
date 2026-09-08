# 03b-render.md, run `live-team-ca-2026-09-06`

Stage 03 in browser mode. **Numbers only.** No verdicts are issued here. Stages 07 and 10 read
this file. The method is `method/browser-mode.md`.

## What was rendered

| | |
|---|---|
| Artifact | `samples/live-team-ca/` |
| Served from | `python3 -m http.server 8766 --bind 127.0.0.1`, loopback only |
| URL rendered | `http://127.0.0.1:8766/index.html` |
| Browser | Chromium via the Playwright MCP tools |
| Viewports | 1280x900, then 320x800 |
| Date | 2026-09-06 |

## Did the CSS arrive

| Reading | Value |
|---|---|
| `document.styleSheets.length` | **14** |
| `<link rel="stylesheet">` tags | 4 |
| `<style>` tags | 10 |

Not zero, so colour and layout measurements below are real.

## Page-level readings

| Reading | Value |
|---|---|
| `document.documentElement.lang` | `en` |
| `document.title` | `Example City CA Real Estate Agent \| Blake & Casey Agent` |
| `<h1>` elements | **1**, text `Blake & Casey Agent` |
| `<main>` or `[role=main]` | **0** |
| `<nav>` elements | 1 |
| `document.images.length` | 19 |
| `document.forms.length` | 4 |
| `<iframe>` elements | 1 |
| `script[type="application/ld+json"]` blocks | **0** |
| `[role=status]`, `[role=alert]`, `[aria-live]` | 1 |
| Elements carrying a `lang` attribute | 1 (the `<html>` element) |

## The reading that governs half this file: most of this page is closed

Four of this page's forms, and the disclaimers attached to them, sit inside pop-up and modal
containers that are closed when the page loads. Measured on load, each of those elements returns
a bounding rectangle of 0x0, `offsetParent` of `null`, and has an ancestor whose computed
`display` is `none`.

**This matters because the Tier 1 contrast routine in `method/browser-mode.md` checks
`display`, `visibility` and `opacity` on the element itself and not on its ancestors.** An
element inside a `display: none` ancestor still reports its own `display` as `block`, so closed
modal content passes that filter and gets measured as though it were on screen. Every reading
below is therefore reported twice: once as the routine returns it, and once filtered to elements
that actually have a box on the page.

## Contrast, for `WCAG-1.4.3`

Method: the Tier 1 routine in `method/browser-mode.md`, colours resolved through a 1px canvas.

### As the routine returns it

| Result | Count |
|---|---|
| Text elements measured | 210 |
| At or above the required threshold | 63 |
| REQUIRES HUMAN, over a picture or backdrop not found | 141 |
| Below the threshold | **6**, in 3 colour pairs |

| Foreground | Background | Size / weight | Ratio | Required | Occurrences | Sample text |
|---|---|---|---|---|---|---|
| `rgb(0,0,0)` | `rgb(20,20,20)` | 14px / 700 | **1.14** | 4.5 | 1 | `Submit` |
| `rgb(132,132,132)` | `rgb(255,255,255)` | 12px / 400 | **3.74** | 4.5 | 3 | consent disclaimer, `...`, `Privacy Policy` |
| `rgb(132,132,132)` | `rgb(255,255,255)` | 12px / 700 | **3.74** | 4.5 | 2 | `Blake Agent`, `Read more` |

### Filtered to elements that are actually rendered

Same routine, plus: non-zero bounding box, and no ancestor with `display: none`,
`visibility: hidden` or `opacity: 0`.

| Result | Count |
|---|---|
| Text elements measured | 135 |
| At or above the required threshold | 14 |
| REQUIRES HUMAN, over a picture or backdrop not found | 121 |
| Below the threshold | **0** |

**All six sub-threshold readings are inside closed containers.** Each was checked individually:

| Text | Width x height | `offsetParent` | Nearest hidden ancestor |
|---|---|---|---|
| `Submit` | 0 x 0 | null | `DIV.pop-up` |
| `SUBMIT` | 0 x 0 | null | `DIV.modal` |
| `I agree to be contacted by ...` | 0 x 0 | null | a `display: none` div |
| `...` (disclaimer ellipsis) | 0 x 0 | null | a `display: none` div |
| `Privacy Policy` | 0 x 0 | null | a `display: none` div |
| `Read more` | 0 x 0 | null | a `display: none` div |

These numbers are recorded, and they are not findings. What they say is that **if** those
modals are opened, the disclaimer text and one submit button will be below the threshold. That
is a measurement taken in a state nobody has seen, so stage 07 reports it as REQUIRES HUMAN and
names what the person has to do: open each modal and take the reading again.

## Keyboard, for `WCAG-2.1.1`, and focus visibility, for `WCAG-2.4.7`

Each visible focusable element's computed `outline-style`, `outline-width`, `outline-color`,
`box-shadow`, `border`, `background-color`, `color` and `text-decoration-line` were read
unfocused, then focused, then compared.

| Reading | Value |
|---|---|
| Visible focusable elements with `tabIndex >= 0` | **37** |
| Elements where **no** computed property changed on focus | **19** |

Eight of the nineteen, with the computed reading that was identical in both states:

| Element | Class | Reading, focused and unfocused |
|---|---|---|
| `a` "About Us" | `navigation__link` | `outline-style: none`, `box-shadow: none`, `border: 0px none`, `background: rgba(0,0,0,0)` |
| `a` "Sell With Us" | `navigation__link` | same |
| `a` "Buy With Us" | `navigation__link` | same |
| `a` "Properties" | `navigation__link` | same |
| `a` "Home Search" | `navigation__link` | same |
| `a` "Testimonials" | `navigation__link` | same |
| `button` (menu) | `hamburger hamburger-component` | `outline-style: none`, `box-shadow: none` |
| `input` (property search) | `search-input` | `outline-style: none`, `box-shadow: none` |

That set includes the whole primary navigation and the site's main search field.

### Elements visible on the page but outside the tab order

| Reading | Value |
|---|---|
| Visible `<a>` and `<button>` elements with `tabIndex < 0` | **15** |

All fifteen are the same control, repeated once per testimonial card:

```
<a href="/testimonials" class="btn btn--primary-dark card-button button-style-1" tabindex="-1">
  Read More
```

## Licence number type size, for `CA-2773(a)-TYPESIZE`

| Reading | Value |
|---|---|
| Licence number element | `p`, text `Example BrokerageCA DRE# 01885544CA DRE# 01885545` |
| Its computed `font-size` | **14px** |
| Smallest computed `font-size` of any visible text on the page | **10px**, `button`, `Let's Connect` |
| Every distinct size on the page | 10, 12, 14, 16, 17, 18, 21, 22, 24, 30, 36, 42, 43, 70 |

14px is larger than 10px.

## Reflow at 320 CSS pixels, for `WCAG-1.4.10`

| Reading | Value |
|---|---|
| Viewport width | 320 |
| `document.documentElement.scrollWidth` | **320** |
| Overflow beyond the viewport | **0px** |

Child elements extend past 320px, all of them inside the testimonial carousel
(`div.slick-track`, width 4800px). A carousel scrolls inside itself; the document does not
scroll horizontally.

## Resize text to 200 percent, for `WCAG-1.4.4`

| Reading | Value |
|---|---|
| `scrollWidth` | 1280 |
| `clientWidth` | 1280 |
| Horizontal overflow | **none** |

## Text spacing overrides, for `WCAG-1.4.12`

The criterion's own four overrides applied.

| Reading | Value |
|---|---|
| `scrollWidth` after the overrides | 1280 |
| Horizontal overflow | **none** |

## Animation, for `WCAG-2.2.2`

| Reading | Value |
|---|---|
| `document.getAnimations().length` | **0** |
| Animations with `iterations: Infinity` | 0 |
| Animations longer than 5000ms | 0 |

The carousels on this page move on a script timer rather than through the Web Animations API,
so a person still has to watch the page to say whether anything auto-advances.

## Bypass mechanism, for `WCAG-2.4.1`

| Reading | Value |
|---|---|
| First in-page link in `<body>` | `Your Privacy Choices`, href `#` |
| A link that moves focus to the main content | **none found** |
| `<main>` or `[role=main]` landmark | **0** |
| `<nav>` landmarks | 1 |

## Headings as rendered, for `WCAG-1.3.1`

51 rendered headings. H1 present and unique. Notable readings:

- `H3: 40`, `H3: $220 Million`, `H3: 350` are the three statistics in the "Our Proven Success"
  block, each marked as a heading.
- `H3: CO`, `H3: CTAP`, `H3: CFAP` are the initials drawn inside the testimonial avatar circles,
  each marked as a heading. Class `userpic-initials`.
- The seven testimonials render **twice** each, once in each of two carousels.
- Level order jumps from H2 to H4 in the sales and testimonial blocks.

## Images

| Reading | Value |
|---|---|
| `<img>` elements | 19 |
| **Missing an `alt` attribute entirely** | **1** |
| Carrying `alt=""` | 11 |
| Of those, rendered at 300px wide or more | **9** |

The one with no `alt` attribute at all resolves to `media/11111111-...`, renders 16px wide, and
its `naturalWidth` is 0, so the file did not load in this capture.

The nine rendered `alt=""` images are 367px to 427px wide and include agent photography, three
MLS listing photographs and section imagery.

## Templates

| Reading | Value |
|---|---|
| Handlebars or template-literal placeholders in the source | present, for example `{{name}}`, `{{formatPropertyPrice this}}`, `${src}` |
| The same placeholders found in `document.body.innerText` | **none** |

They sit inside hidden template elements and no visitor sees them.

## Links opening in a new tab

| Reading | Value |
|---|---|
| `a[target="_blank"]` | **30** |
| Of those, carrying no `rel` attribute at all | **29** |
| Distinct `rel` values anywhere on the page | `noopener noreferrer` |

## What browser mode did not reach on this page

The ten HUMAN criteria do not move. `WCAG-2.1.4`, `WCAG-2.5.1`, `WCAG-2.5.2`, `WCAG-2.5.4` and
`WCAG-1.4.13` stay REQUIRES HUMAN. **Every closed modal on this page is unmeasured in its open
state**, which is the single largest gap in this run and is named again in the ledger's scope
section.
