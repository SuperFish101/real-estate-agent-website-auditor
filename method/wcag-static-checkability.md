# WCAG method: which criteria are checkable from source

_Layer 3 lookup. `rules.md` is the contract and points here. Nothing in this file is a
standard: the standards live in `reference/`, written by other people. This is the
auditor's own method, and it is here rather than in `rules.md` so the contract stays short
enough to read in one sitting._

Cited by `rules.md` section 8 and by the evidence bar in `rules.md` section 6.

---

Which of the 50 criteria can be judged from source, and which cannot. This is the auditor's
own method, not part of the standard. The standard itself is in
`reference/wcag/CONTEXT.md` and says nothing about how you check it.

- **STATIC**: fully judgeable from the HTML you were given.
- **STATIC-PARTIAL**: the mechanical half is judgeable from source. The judgement half is not.
  You may issue a FAIL on the mechanical half and you must mark the rest REQUIRES HUMAN.
- **BROWSER**: needs a rendered page. Verdict is `REQUIRES BROWSER` unless the note says
  otherwise.
- **HUMAN**: needs a person. Verdict is `REQUIRES HUMAN`.

The **Method** column is what source alone can reach. The **With browser** column is what the
run can reach once stage 03 has rendered the page and written `03b-render.md`, following
[`browser-mode.md`](browser-mode.md). A dash means browser mode changes nothing for that
criterion. Browser mode never changes the provision, only the evidence.

- **MEASURED**: browser mode reaches the whole criterion. A FAIL is allowed, quoting the
  number in `03b-render.md`.
- **PARTIAL**: browser mode reaches the mechanical half. A FAIL is allowed on that half, and
  the same row carries REQUIRES HUMAN for the rest.
- **HUMAN**: a browser does not settle it either. The verdict becomes REQUIRES HUMAN rather
  than REQUIRES BROWSER, because no tool will close it.
- **`-`**: browser mode changes nothing here.

| Provision | Criterion | Level | Method | With browser | Note |
|---|---|---|---|---|---|
| `WCAG-1.1.1` | Non-text Content | A | STATIC-PARTIAL | - | Presence of `alt` is static. Whether the alt text is *equivalent* needs a human. |
| `WCAG-1.2.1` | Audio-only and Video-only (Prerecorded) | A | HUMAN | - |  |
| `WCAG-1.2.2` | Captions (Prerecorded) | A | HUMAN | - |  |
| `WCAG-1.2.3` | Audio Description or Media Alternative (Prerecorded) | A | HUMAN | - |  |
| `WCAG-1.2.4` | Captions (Live) | AA | HUMAN | - |  |
| `WCAG-1.2.5` | Audio Description (Prerecorded) | AA | HUMAN | - |  |
| `WCAG-1.3.1` | Info and Relationships | A | STATIC-PARTIAL | PARTIAL | Heading order, list markup, table headers, `<label>` association and landmark roles are static. Visual relationships not expressed in markup need a browser. |
| `WCAG-1.3.2` | Meaningful Sequence | A | STATIC-PARTIAL | MEASURED | Reading order in the DOM is static. Order changed by CSS needs a browser. |
| `WCAG-1.3.3` | Sensory Characteristics | A | HUMAN | - |  |
| `WCAG-1.3.4` | Orientation | AA | BROWSER | MEASURED |  |
| `WCAG-1.3.5` | Identify Input Purpose | AA | STATIC | - | `autocomplete` tokens on identifying form fields are visible in markup. |
| `WCAG-1.4.1` | Use of Color | A | HUMAN | - |  |
| `WCAG-1.4.2` | Audio Control | A | STATIC-PARTIAL | - | `autoplay` on `<audio>` or `<video>` longer than 3 seconds is visible in markup. |
| `WCAG-1.4.3` | Contrast (Minimum) | AA | BROWSER | MEASURED | Computable statically only when both foreground and background colours are declared in CSS supplied with the page and nothing overrides them. Otherwise a rendered page is required. |
| `WCAG-1.4.4` | Resize Text | AA | BROWSER | PARTIAL |  |
| `WCAG-1.4.5` | Images of Text | AA | HUMAN | - |  |
| `WCAG-1.4.10` | Reflow | AA | BROWSER | MEASURED |  |
| `WCAG-1.4.11` | Non-text Contrast | AA | BROWSER | PARTIAL |  |
| `WCAG-1.4.12` | Text Spacing | AA | BROWSER | MEASURED |  |
| `WCAG-1.4.13` | Content on Hover or Focus | AA | BROWSER | HUMAN |  |
| `WCAG-2.1.1` | Keyboard | A | BROWSER | PARTIAL |  |
| `WCAG-2.1.2` | No Keyboard Trap | A | BROWSER | MEASURED |  |
| `WCAG-2.1.4` | Character Key Shortcuts | A | BROWSER | HUMAN |  |
| `WCAG-2.2.1` | Timing Adjustable | A | STATIC-PARTIAL | - | `<meta http-equiv="refresh">` is static. Script timers need a browser. |
| `WCAG-2.2.2` | Pause, Stop, Hide | A | STATIC-PARTIAL | PARTIAL | `<marquee>`, `<blink>` and declared auto-advancing carousels are static. Script animation needs a browser. |
| `WCAG-2.3.1` | Three Flashes or Below Threshold | A | HUMAN | - |  |
| `WCAG-2.4.1` | Bypass Blocks | A | STATIC-PARTIAL | MEASURED | Presence of a skip link and of landmark elements is static. Whether it works needs a browser. |
| `WCAG-2.4.2` | Page Titled | A | STATIC | - | Presence and non-emptiness of `<title>` is static. |
| `WCAG-2.4.3` | Focus Order | A | BROWSER | PARTIAL |  |
| `WCAG-2.4.4` | Link Purpose (In Context) | A | STATIC-PARTIAL | - | Link text such as "click here" or "read more" is static. Purpose from surrounding context needs a human. |
| `WCAG-2.4.5` | Multiple Ways | AA | STATIC-PARTIAL | - | Presence of a sitemap link, search form or breadcrumb trail is static across the supplied pages. |
| `WCAG-2.4.6` | Headings and Labels | AA | STATIC-PARTIAL | - | Presence and non-emptiness of headings and form labels is static. Whether they are *descriptive* needs a human. |
| `WCAG-2.4.7` | Focus Visible | AA | BROWSER | MEASURED |  |
| `WCAG-2.5.1` | Pointer Gestures | A | BROWSER | HUMAN |  |
| `WCAG-2.5.2` | Pointer Cancellation | A | BROWSER | HUMAN |  |
| `WCAG-2.5.3` | Label in Name | A | STATIC-PARTIAL | - | Comparing a visible `<label>` against `aria-label` on the same control is static. |
| `WCAG-2.5.4` | Motion Actuation | A | BROWSER | HUMAN |  |
| `WCAG-3.1.1` | Language of Page | A | STATIC | - | `lang` on the `<html>` element is static. |
| `WCAG-3.1.2` | Language of Parts | AA | STATIC | - | `lang` on elements containing other-language passages is static. |
| `WCAG-3.2.1` | On Focus | A | BROWSER | MEASURED |  |
| `WCAG-3.2.2` | On Input | A | BROWSER | PARTIAL |  |
| `WCAG-3.2.3` | Consistent Navigation | AA | STATIC-PARTIAL | - | Only checkable when more than one page from the same site is supplied. |
| `WCAG-3.2.4` | Consistent Identification | AA | STATIC-PARTIAL | - | Only checkable when more than one page from the same site is supplied. |
| `WCAG-3.3.1` | Error Identification | A | BROWSER | PARTIAL |  |
| `WCAG-3.3.2` | Labels or Instructions | A | STATIC-PARTIAL | - | Presence of a label or instruction on each input is static. Sufficiency needs a human. |
| `WCAG-3.3.3` | Error Suggestion | AA | BROWSER | HUMAN |  |
| `WCAG-3.3.4` | Error Prevention (Legal, Financial, Data) | AA | HUMAN | - |  |
| `WCAG-4.1.1` | Parsing | A | STATIC | - | Duplicate `id` values and unclosed or improperly nested tags are static. |
| `WCAG-4.1.2` | Name, Role, Value | A | STATIC-PARTIAL | PARTIAL | Accessible name, role and value on standard controls are static. Custom widgets driven by script need a browser. |
| `WCAG-4.1.3` | Status Messages | AA | BROWSER | PARTIAL |  |

Counts from source alone: 5 STATIC, 15 STATIC-PARTIAL, 20 BROWSER, 10 HUMAN. So **40 percent
of Level A and AA is reachable from source alone**.

Counts with browser mode on: the 20 source criteria plus 14 of the 20 BROWSER ones, so **34 of
50, or 68 percent**. Sixteen are still out of reach: the 10 HUMAN criteria, plus `WCAG-1.4.13`,
`WCAG-2.1.4`, `WCAG-2.5.1`, `WCAG-2.5.2`, `WCAG-2.5.4` and `WCAG-3.3.3`, which need a person
whatever tooling is present.

Every report says which of these two numbers applies to it, plainly, rather than implying it
covered accessibility.

---