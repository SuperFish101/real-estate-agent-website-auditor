# 03b-render.md, run `pass-case-2026-09-07`

Stage 03 in browser mode. **Numbers only.** No verdicts are issued here. Stages 07 and 10 read
this file. The method is `method/browser-mode.md`.

## What was rendered

| | |
|---|---|
| Artifact | `samples/pass-case/` |
| Served from | `python3 -m http.server 8768 --bind 127.0.0.1`, loopback only |
| URL rendered | `http://127.0.0.1:8768/index.html` |
| Browser | Chromium via the Playwright MCP tools |
| Viewport | 1280x900 |
| Date | 2026-09-07 |

## Did the CSS arrive: NO

| Reading | Value |
|---|---|
| `<link rel="stylesheet">` tags in the page | **1**, pointing at `style.css` |
| `document.styleSheets[0].href` | `http://127.0.0.1:8768/style.css` |
| `document.styleSheets[0].cssRules.length` | **0** |

Same as `fail-case`, and for the same reason: the fixture links a stylesheet that is not in the
folder. **Every colour and layout criterion stays REQUIRES BROWSER**, and nothing below is used
to pass one.

## Page-level readings

| Reading | Value |
|---|---|
| `document.documentElement.lang` | **`en`** |
| `document.title` | `2736 5th St, Davis CA \| Marisol Vega Real Estate` |
| `<h1>` elements | **1** |
| Heading order as rendered | `H1: 2736 5th St, Davis CA`, `H2: Photographs`, `H2: Virtually staged images`, `H2: Ask a question about this list` |
| Duplicate `id` values in the document | **none** |
| `<main>` or `[role=main]` | **1** |
| `<nav>` elements | 1, with `aria-label="Main"` |
| `<img>` elements | 5 |
| Missing an `alt` attribute entirely | **0** |
| Carrying `alt=""` | **0** |
| `[role=status]`, `[role=alert]`, `[aria-live]` | 0 |
| `document.getAnimations().length` | 0 |

## Skip link, for `WCAG-2.4.1`

| Reading | Value |
|---|---|
| First in-page link in `<body>` | `Skip to main content` |
| Its `href` | `#main` |
| Does the target element exist | **yes** |

## Keyboard, for `WCAG-2.1.1`, `WCAG-2.4.3` and `WCAG-2.4.7`

| Reading | Value |
|---|---|
| Visible focusable elements with `tabIndex >= 0` | **16** |
| Visible elements with `tabIndex < 0` | **0** |
| Elements where no computed property changed on focus | 0 |

**That last row is not evidence and is not used**, for the same reason as `fail-case`: on an
unstyled page every control shows Chromium's default focus ring. `WCAG-2.4.7` stays REQUIRES
BROWSER.

## Form controls

| Control | Type | `id` | Label bound by `for` | `autocomplete` | `required` |
|---|---|---|---|---|---|
| `input[name=fullname]` | text | `fullname` | **yes** | `name` | yes |
| `input[name=email]` | email | `email` | **yes** | `email` | yes |
| `input[name=phone]` | tel | `phone` | **yes** | `tel` | no |
| `textarea[name=message]` | textarea | `message` | **yes** | none | no |
| `input[name=consent]` | checkbox | `consent` | **yes** | none | **yes** |

## Consent checkbox, for `TCPA-64.1200(f)(9)-AGREEMENT`

| Reading | Value |
|---|---|
| `id` | `consent` |
| `required` | **true** |
| `checked` on load | **false** |
| Bound `<label for="consent">` present | **true** |

Not pre-ticked, and the form cannot submit without it. That is a deliberate act by the user,
which is what the provision asks for.

## Privacy policy links, for `CALOPPA-22575(a)-POSTED`

| Link text | `href` | Rendered with a non-zero box and no hidden ancestor |
|---|---|---|
| `Privacy Policy` | `/privacy.html` | **yes** |
| `Privacy Policy` | `/privacy.html` | **yes** |

Both are visible on load. This check exists because on one of the live runs in this folder the
only links reading "Privacy Policy" were inside modals that are closed until a visitor opens
them, which is not posting.

## Link text, for `WCAG-2.4.4`

Ten links, in document order: `Skip to main content`, `Home`, `Listings`, `About`, three times
`the unaltered images page`, `Privacy Policy`, `Site map`, `Privacy Policy`. The three identical
"unaltered images page" links all point at the same `/originals.html`, so the repetition is not
ambiguous. **No "click here" anywhere.**

## What browser mode did not reach on this page

Everything that needs the stylesheet: contrast, focus visibility, reflow at 320 pixels, resize
to 200 percent, orientation, text spacing, non-text contrast, and the licence number type size
under `CA-2773(a)-TYPESIZE`. All eight stay REQUIRES BROWSER in the ledger.

The ten HUMAN criteria do not move either.
