# 03b-render.md: what the browser measured

**This file holds numbers, not verdicts.** Stage 03 judges nothing. Stages 07 and 10 read these
numbers and judge them against the provisions. Every row names where it came from, so a reader
can open the same page and take the same measurement.

| | |
|---|---|
| Rendered | 2026-09-05 |
| Source | `samples/live-agent-ca/`, served locally at `http://127.0.0.1:8766/index.html` |
| Browser | Chromium, via the Playwright MCP tools |
| Stylesheets loaded | **6 sheets, 1 `<link>` tag resolved.** Colour and type size measurements are valid |
| Viewports measured | 1280x900 desktop, 375x812 phone, 320x800 for reflow |

The page was served over loopback rather than opened as a `file://` path, because the
Playwright MCP server blocks the `file:` protocol outright. Nothing left the machine.

---

## 1. Type size, for `CA-2773(a)-TYPESIZE`

The regulation compares the licence number's type against **the smallest type used in the
material**. It is a relative floor, so both numbers are needed and both are recorded.

### At 375px wide (phone)

| | Size | Element |
|---|---|---|
| Licence, instance 1 | **9px** | `<p class="pt-0.5 text-[9px] md:text-xs ...">CA DRE# 01998877</p>`, the header |
| Licence, instance 2 | 18px | `<p class="font-display text-lg md:text-2xl mb-12">`, the hero |
| Licence, instance 3 | 12px | `<p class="uppercase tracking-[0.22em] text-xs ...">License #01998877</p>` |
| Licence, instance 4 | 12px | `<p class="text-xs text-white/65">`, the footer credit line |
| **Smallest type anywhere on the page** | **9px** | The header licence itself |

Every distinct size on the page at 375px: 9, 10, 11, 12, 14, 15, 16, 18, 20, 24, 30.

### At 1280px wide (desktop)

| | Size | Element |
|---|---|---|
| Licence, smallest instance | **12px** | The footer credit line |
| **Smallest type anywhere on the page** | **12px** | Several elements, including the licence itself |

Every distinct size at 1280px: 12, 14, 16, 18, 20, 24, 26, 30, 38, 40, 42.

## 2. Contrast, for `WCAG-1.4.3`

170 text-bearing elements measured at 1280px. Colours resolved through a 1px canvas, so
`oklab()` and every other colour space is converted to sRGB before the ratio is computed.

| Result | Count |
|---|---|
| PASS | 138 |
| FAIL | 4 |
| REQUIRES HUMAN | 28 |

The four below the threshold:

| Text | Foreground | Background | Ratio | Required | Size |
|---|---|---|---|---|---|
| "License #01998877" | `rgb(129,129,129)` | `rgb(255,255,255)` | **3.88** | 4.5 | 12px |
| Step number "2" | `rgb(122,121,119)` | `rgb(238,237,233)` | **3.71** | 4.5 | 18px |
| Step number "3" | `rgb(122,121,119)` | `rgb(238,237,233)` | **3.71** | 4.5 | 18px |
| "Terms & Privacy" | `rgb(123,123,161)` | `rgb(14,14,84)` | **4.28** | 4.5 | 12px |

The 28 REQUIRES HUMAN rows are text sitting over a photograph or over a backdrop the routine
could not determine. **A ratio against a picture is not computable this way and is not
guessed.** Two guards produce that verdict rather than a failure:

1. Any ancestor with a `background-image`, or a positioned ancestor containing an `<img>`.
2. A computed backdrop identical to the text colour, which means the real backdrop was never
   found rather than that the text is invisible.

Without the second guard this same page produced **16 false failures** at ratio 1.00, all of
them white text over hero photographs. They are recorded here because a false ACCESS finding
against a real business is the worst thing this tool can produce, and the guard that prevents
it is now part of the method.

## 3. Focus visibility and keyboard reach, for `WCAG-2.4.7` and `WCAG-2.1.1`

| Measurement | Result |
|---|---|
| Focusable elements found | 73 |
| Focusable elements whose computed style does not change on focus | **0** |
| Elements that respond to click but cannot be reached by Tab | **0** |

Method note, stated because it bounds the claim: each element was focused with `el.focus()`
and its computed `outline`, `box-shadow`, `border`, `background-color` and `color` compared
before and after. That is the `:focus` style. It is the same default outline Chromium paints on
Tab, but a site that styles `:focus-visible` differently from `:focus` would not be
distinguished by this measurement.

## 4. Reflow, for `WCAG-1.4.10`

| Measurement | Result |
|---|---|
| Viewport | 320px |
| `document.documentElement.scrollWidth` | **320px** |
| Horizontal page scrolling | **None** |

Six elements extend past 320px, and all six sit inside a horizontally scrolling credential
ticker with its own overflow. The criterion is about the page requiring two-dimensional
scrolling, and it does not.

## 5. Text spacing, for `WCAG-1.4.12`

The criterion's own four overrides were applied: line height 1.5em, paragraph spacing 2em,
letter spacing 0.12em, word spacing 0.16em.

| Measurement | Result |
|---|---|
| Elements checked | 233 |
| Elements clipped after the override | 2 |
| Horizontal scrolling introduced | None |

Both "clipped" elements have a `clientHeight` of 1px, which is the visually-hidden pattern used
for screen reader labels. They are not visible text and nothing was clipped from a reader.

## 6. What the browser did not settle

Recorded so no reader mistakes this for full coverage.

- `WCAG-1.4.13`, `WCAG-2.1.4`, `WCAG-2.5.1`, `WCAG-2.5.2`, `WCAG-2.5.4`, `WCAG-3.3.3`: still
  REQUIRES HUMAN. No tool settles them.
- The ten HUMAN criteria are unchanged.
- The 28 contrast rows over photographs need a person with the picture in front of them.
