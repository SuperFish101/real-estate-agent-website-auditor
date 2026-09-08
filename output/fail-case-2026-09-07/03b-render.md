# 03b-render.md, run `fail-case-2026-09-07`

Stage 03 in browser mode. **Numbers only.** No verdicts are issued here. Stages 07 and 10 read
this file. The method is `method/browser-mode.md`.

## What was rendered

| | |
|---|---|
| Artifact | `samples/fail-case/` |
| Served from | `python3 -m http.server 8767 --bind 127.0.0.1`, loopback only |
| URL rendered | `http://127.0.0.1:8767/index.html` |
| Browser | Chromium via the Playwright MCP tools |
| Viewport | 1280x900 |
| Date | 2026-09-07 |

## Did the CSS arrive: NO

**This is the reading that governs the rest of this file.**

| Reading | Value |
|---|---|
| `<link rel="stylesheet">` tags in the page | **1**, pointing at `style.css` |
| `document.styleSheets.length` | 1 |
| `document.styleSheets[0].href` | `http://127.0.0.1:8767/style.css` |
| `document.styleSheets[0].cssRules.length` | **0** |
| `getComputedStyle(document.body).fontSize` | `16px`, the browser default |
| `getComputedStyle(document.body).color` | `rgb(0, 0, 0)`, the browser default |
| `getComputedStyle(document.body).backgroundColor` | `rgba(0, 0, 0, 0)`, the browser default |

The artifact links a stylesheet that is **not in the folder**. The server returned 404 and the
sheet loaded with zero rules, so the page rendered with browser defaults throughout.

`method/browser-mode.md` says what happens next, and this run did it: **stop, record it here, and
leave every colour and layout criterion at REQUIRES BROWSER.** A contrast ratio taken off an
unstyled page describes a page nobody will ever see, and a licence type size taken off one is
16px against 16px by accident. Reporting either as a PASS would be passing a check that was
never performed.

**What still counts.** Structure does not depend on CSS. Everything below this line was measured
and is used by stage 07.

## Page-level readings

| Reading | Value |
|---|---|
| `document.documentElement.lang` | **empty** |
| `document.title` | **`""`**, present and empty |
| `<h1>` elements | 1 |
| Heading order as rendered | `H3: Marisol Vega Real Estate`, `H1: Featured listing: 2736 5th St,`, `H2: Ask me a question` |
| Duplicate `id` values in the document | **`["top"]`** |
| `<img>` elements | 5 |
| Missing an `alt` attribute entirely | **4** (`img/logo.png`, `img/kitchen-staged.jpg`, `img/living-staged.jpg`, `img/floorplan-render.png`) |
| Carrying `alt=""` | 0 |
| `[role=status]`, `[role=alert]`, `[aria-live]` | 0 |
| `document.getAnimations().length` | 0 |

## Skip link, for `WCAG-2.4.1`

| Reading | Value |
|---|---|
| First in-page link in `<body>` | `Skip to content` |
| Its `href` | `#main` |
| Does the target element exist | **yes** |

## Keyboard, for `WCAG-2.1.1`, `WCAG-2.4.3` and `WCAG-2.4.7`

| Reading | Value |
|---|---|
| Visible focusable elements with `tabIndex >= 0` | **12** |
| Visible elements with `tabIndex < 0` | **0** |
| Elements where no computed property changed on focus | 0 |

**That last row is not evidence and is not used.** On an unstyled page every control shows the
browser's own default focus ring, so the reading says only that Chromium has a default. The real
site's stylesheet is what would suppress it, and that stylesheet is not here. `WCAG-2.4.7` stays
REQUIRES BROWSER.

## Form controls

| Control | Type | `id` | Label bound by `for` | `autocomplete` | Placeholder |
|---|---|---|---|---|---|
| `input[name=fullname]` | text | none | **no** | **none** | `Your name` |
| `input[name=email]` | email | none | **no** | **none** | `Email` |
| `input[name=phone]` | tel | none | **no** | **none** | `Phone` |
| `textarea[name=message]` | textarea | none | **no** | **none** | `Message` |

No `<label>` element exists anywhere in the document.

## Link text, for `WCAG-2.4.4`

Six links, in document order: `Skip to content`, `Home`, `Listings`, `About`, **`click here`**,
**`click here`**, **`click here`**. The three identical link texts point at `/contact.html`,
`/docs/disclosures.pdf` and `/listings.html`.

## What browser mode did not reach on this page

Everything that needs the stylesheet: contrast, focus visibility, reflow at 320 pixels, resize
to 200 percent, orientation, text spacing, non-text contrast, and the licence number type size
under `CA-2773(a)-TYPESIZE`. All eight stay REQUIRES BROWSER in the ledger, with the same reason
in each row.

The ten HUMAN criteria do not move either.
