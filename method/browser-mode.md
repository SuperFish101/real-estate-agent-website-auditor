# Browser mode: judging what only a rendered page can show

_Layer 3 lookup. `rules.md` is the contract and points here. Nothing in this file is a
standard. The standards live in `reference/`, written by other people. This is the auditor's
own method for measuring a rendered page, and it lives here rather than in `rules.md` so the
contract stays short enough to read in one sitting._

Cited by `rules.md` section 1, section 5 and section 6, by
[`wcag-static-checkability.md`](wcag-static-checkability.md), by
`stages/03-inventory/CONTEXT.md`, by `stages/07-accessibility/CONTEXT.md` and by
`stages/09-licence-and-broker/CONTEXT.md`.

---

## What browser mode is

Reading a saved HTML file answers about half of what an audit needs. The other half only
exists once a browser has laid the page out and applied the CSS: what colour the text
actually came out, whether the keyboard can reach the menu, how many pixels tall the licence
number is. Browser mode is the auditor opening the page in a real browser and **measuring**
those things.

It changes nothing about how the auditor decides. A browser finding cites the same provision,
by the same ID, from the same file in `reference/`, as every other finding. Browser mode adds
evidence. It never adds a rule.

## The five rules of browser mode

1. **It runs by default. You do not wait to be asked.** If the Playwright tools are present,
   every audit renders the page. There is no such thing as choosing not to, because 14 of the
   50 accessibility criteria and the entire licence type size rule are unreachable without it,
   and leaving them as REQUIRES BROWSER when a browser was available is a gap you created.
   **The only reason to skip it is that the tools are absent**, and then the run says so in its
   header, in those words, on the first screen. If you find yourself about to write REQUIRES
   BROWSER, the question is not whether to report the gap. It is why you have not opened the
   browser.
2. **It renders the artifact you were given**, served from your own machine, not the live web.
   The folder under audit is the thing under audit. Rendering a live URL instead is allowed
   only when the person asks for it, and then the run header says which URL and when, because
   the live page can change tomorrow and the saved one cannot.
3. **Every browser verdict rests on a recorded number.** The measurement goes into
   `output/<run>/03b-render.md` with the selector it came from. A reader who does not trust
   the finding can open the same page and get the same number. A browser claim with no
   recorded number is an opinion, and opinions are deleted.
4. **A check that could not run stays REQUIRES BROWSER.** No browser, a page that will not
   render, a script that errors: the verdict does not move. It never becomes a PASS. Passing a
   check you did not perform is the worst thing in this file.
5. **The browser measures. It does not judge.** Contrast is a number. Whether a low number is
   a failure is decided by the provision text in `reference/wcag/1-perceivable.md`, exactly as
   it would be from source.

## What it needs

The Playwright MCP tools, in the client running the audit. Nothing is installed into this
folder and nothing here calls the network. If the tools are absent, say so in one line, name
them, and run the audit without them.

| Tool | Used for |
|---|---|
| `browser_navigate` | Open the page under audit at its `http://127.0.0.1` address |
| `browser_evaluate` | Every measurement in this file. All of them are JavaScript reading computed styles or geometry |
| `browser_press_key` | Tab traversal, for keyboard reachability and focus order |
| `browser_snapshot` | The accessibility tree, for computed name and role on custom controls |
| `browser_resize` | Reflow at 320 CSS pixels, and orientation |
| `browser_take_screenshot` | Attached to a contrast or focus finding so the reader can see it |
| `browser_close` | At the end of the stage. Always |

**Serve the folder, do not open the file.** The Playwright MCP server blocks the `file:`
protocol, so `browser_navigate` on a `file:///...` path fails outright. Serve the folder over
loopback instead and navigate to that:

```
cd <the folder under audit> && python3 -m http.server 8765
```

Then `browser_navigate` to `http://127.0.0.1:8765/index.html`. Nothing leaves the machine, and
relative paths to CSS and images resolve exactly as they would on the real site, which
`file://` does not always manage. Stop the server when the stage ends.

**Check the CSS arrived before measuring any colour.** A page saved with `curl` alone has no
local stylesheet, so it renders unstyled and every colour measurement taken off it is
worthless. Read `document.styleSheets.length`. If it is 0 and the page has
`<link rel="stylesheet">` tags, the CSS did not load: stop, record that in `03b-render.md`, and
leave every colour and layout criterion at REQUIRES BROWSER. `samples/README.md` has the
capture that brings the CSS down with the page.

---

## Tier 1: the three checks this mode exists for

These are the ones that matter most and that source can never reach.

### 1. Contrast, `WCAG-1.4.3`

The criterion asks for 4.5:1 for normal text and 3:1 for large text. Large means 18.66px or
larger and bold, or 24px or larger. Both numbers come from the criterion itself, not from
this file.

Run this, and record every row it returns:

```js
() => {
  const cv = document.createElement('canvas'); cv.width = cv.height = 1;
  const ctx = cv.getContext('2d', { willReadFrequently: true });
  // Paint the colour and read the pixel back. This resolves oklab(), lab(), color()
  // and every alpha to plain sRGB. Never parse a computed colour string yourself.
  const resolve = css => {
    ctx.clearRect(0,0,1,1); ctx.fillStyle = '#000'; ctx.fillStyle = css; ctx.fillRect(0,0,1,1);
    const d = ctx.getImageData(0,0,1,1).data; return [d[0],d[1],d[2],d[3]/255];
  };
  const lum = c => {
    const [r,g,b] = c.slice(0,3).map(v => { v /= 255; return v <= 0.03928 ? v/12.92 : ((v+0.055)/1.055)**2.4 });
    return 0.2126*r + 0.7152*g + 0.0722*b;
  };
  const over = (fg, bg) => [0,1,2].map(i => fg[i]*fg[3] + bg[i]*(1-fg[3]));
  // If a picture is anywhere behind the text, a computed ratio is not evidence.
  const overlaps = (a, b) => !(a.right <= b.left || a.left >= b.right || a.bottom <= b.top || a.top >= b.bottom);
  const backdropIsPicture = el => {
    const r = el.getBoundingClientRect();
    for (let n = el; n && n !== document.documentElement; n = n.parentElement) {
      const st = getComputedStyle(n);
      // A picture counts only where it actually sits behind THIS text. See lesson 4 below.
      if (st.backgroundImage !== 'none' && overlaps(r, n.getBoundingClientRect())) return true;
      if (st.position !== 'static') {
        for (const m of n.querySelectorAll('img,video')) { if (overlaps(r, m.getBoundingClientRect())) return true; }
      }
    }
    return false;
  };
  const bgOf = el => {
    for (let n = el; n; n = n.parentElement) {
      const c = resolve(getComputedStyle(n).backgroundColor);
      if (c[3] === 0) continue;
      return c[3] === 1 ? c.slice(0,3) : over(c, [255,255,255]);
    }
    return [255,255,255];                       // canvas default
  };
  const rows = [];
  document.querySelectorAll('*').forEach(el => {
    const t = [...el.childNodes].filter(n => n.nodeType === 3 && n.textContent.trim()).map(n => n.textContent.trim()).join(' ');
    if (!t) return;
    const st = getComputedStyle(el);
    if (st.visibility === 'hidden' || st.display === 'none' || +st.opacity === 0) return;
    const size = parseFloat(st.fontSize), weight = +st.fontWeight || 400;
    const large = size >= 24 || (size >= 18.66 && weight >= 700);
    const required = large ? 3 : 4.5;
    if (backdropIsPicture(el)) {
      rows.push({ text: t.slice(0,38), verdict: 'REQUIRES HUMAN', why: 'text sits over a picture' }); return;
    }
    const bg = bgOf(el);
    const fg = over(resolve(st.color), bg);
    if (fg.every((v,i) => Math.abs(v - bg[i]) < 1)) {
      rows.push({ text: t.slice(0,38), verdict: 'REQUIRES HUMAN', why: 'computed backdrop equals the text colour, so it was never found' }); return;
    }
    const ratio = (Math.max(lum(fg),lum(bg)) + 0.05) / (Math.min(lum(fg),lum(bg)) + 0.05);
    rows.push({ text: t.slice(0,38), fg: 'rgb('+fg.map(Math.round).join(',')+')', bg: 'rgb('+bg.map(Math.round).join(',')+')',
                ratio: +ratio.toFixed(2), size, weight, required, verdict: ratio >= required ? 'PASS' : 'FAIL' });
  });
  return { checked: rows.length, pass: rows.filter(r=>r.verdict==='PASS').length,
           human: rows.filter(r=>r.verdict==='REQUIRES HUMAN').length, fails: rows.filter(r=>r.verdict==='FAIL') };
}
```

**Three things in that routine exist because getting them wrong produced false failures on a
real site, and a false ACCESS finding against a real business is the worst thing this tool can
produce.**

1. **Colours go through the canvas, never through a regular expression.** Modern CSS serialises
   computed colours as `oklab(0.999994 0.0000455 0.0000201 / 0.95)`. Pulling the numbers out of
   that string and treating them as RGB turns white into black. On the run in
   `output/live-agent-ca-2026-09-05/` that single mistake produced **58 failures that were not
   real**. Painting the colour onto a 1px canvas and reading the pixel back resolves every
   colour space, and every alpha, to sRGB. Do it that way.
2. **A ratio of 1.00 means you did not find the backdrop.** White text at ratio 1.00 on white is
   almost never invisible text. It is text over a hero photograph or a positioned overlay that
   the ancestor walk missed. On the same run that accounted for a further **16 false
   failures**. So: if the computed backdrop equals the text colour, the verdict is REQUIRES
   HUMAN, not FAIL.
3. **The filter above checks the element, not its ancestors, so closed modals get measured.**
   `getComputedStyle` on an element inside a `display: none` ancestor still reports that
   element's own `display` as `block`. Every pop-up, modal and collapsed disclosure on the page
   is therefore measured as though it were on screen. On the run in
   `output/live-team-ca-2026-09-06/` that produced **6 sub-threshold readings, every one of them
   inside a closed modal**, including a black-on-black submit button at ratio 1.14. None was a
   real failure, because nobody has ever seen any of them. Before issuing a contrast FAIL,
   confirm the element is actually rendered:

   ```js
   const rendered = el => {
     const r = el.getBoundingClientRect();
     if (r.width === 0 || r.height === 0) return false;
     for (let n = el; n; n = n.parentElement) {
       const s = getComputedStyle(n);
       if (s.display === 'none' || s.visibility === 'hidden' || +s.opacity === 0) return false;
     }
     return true;
   };
   ```

   Report both counts, the raw one and the rendered one, and say which is which. A reading taken
   in a state no visitor has seen is not evidence of anything, and it is not nothing either: it
   says what will be true **if** that modal is opened. That belongs in the run as REQUIRES HUMAN,
   naming the modal the person has to open, and never as a FAIL.

4. **A picture only counts if it actually sits behind the text.** The guard above used to fire on
   any `position: non-static` ancestor that contained an `<img>` anywhere inside it. On a real
   Sacramento brokerage site (`output/grounded-city-2026-09-10/`) the page-wide wrapper
   `div.site-container` is `position: relative` and holds images somewhere in the page, so **every
   element on the page had that ancestor and the guard fired for all 95 text nodes**. The routine
   returned 0 passes, 0 failures and 95 REQUIRES HUMAN, which reads like a page nobody can measure
   and was actually a page with one real contrast failure and sixty passes. This is the
   false-*silence* version of the first three lessons, and it is worse than a false failure,
   because a false failure gets argued with and a silent 95 gets believed. The fix is the
   `overlaps()` rectangle test now in the routine. **A guard that never lets anything through is
   broken, not cautious**: if a run comes back with every reading REQUIRES HUMAN, suspect the
   guard before you write it up.

Reading the result:

- `verdict: 'FAIL'` is a FAIL on `WCAG-1.4.3`. The finding quotes the ratio, the required ratio,
  the two colours and the text. One finding per distinct colour pair, listing every place it
  appears, because the same pair has the same fix everywhere. That is the grouping rule in
  `rules.md` section 3.
- **Report the pass count next to the fail count.** "Four below the threshold, 138 above it" is
  the honest sentence. "Four contrast failures" alone reads as a page with a contrast problem.
- `REQUIRES HUMAN` covers both guards above. A ratio against a photograph is not computable this
  way and guessing at it would be inventing evidence.
- Text inside `<img>`, `<video>` or a canvas is not reached by this at all. Say so.

### 2. Keyboard operability, `WCAG-2.1.1`, and focus visibility, `WCAG-2.4.7`

One traversal answers both, plus `WCAG-2.1.2` and `WCAG-2.4.3`.

First list what should be reachable:

```js
() => [...document.querySelectorAll('a[href],button,input,select,textarea,[tabindex],[role="button"],[role="link"],[onclick]')]
  .filter(el => { const s = getComputedStyle(el); return s.display !== 'none' && s.visibility !== 'hidden' && !el.disabled })
  .map((el,i) => ({ i, tag: el.tagName.toLowerCase(), id: el.id, text: (el.textContent||el.value||'').trim().slice(0,30), tabindex: el.getAttribute('tabindex') }))
```

Then press `Tab` once per element in that list plus five, and after each press read where
focus landed and what it looks like:

```js
() => {
  const el = document.activeElement;
  if (!el || el === document.body) return { at: 'body' };
  const st = getComputedStyle(el);
  return { tag: el.tagName.toLowerCase(), id: el.id, text: (el.textContent||el.value||'').trim().slice(0,30),
           outline: st.outlineStyle + ' ' + st.outlineWidth + ' ' + st.outlineColor,
           boxShadow: st.boxShadow, border: st.border, background: st.backgroundColor, rect: el.getBoundingClientRect().toJSON() };
}
```

Read the three results out of the one traversal:

- **`WCAG-2.1.1` Keyboard.** Any element in the first list that focus never landed on is a
  FAIL, and the finding names the element and its line in the source file. This covers
  reachability only. Whether a custom widget can be *operated* by keyboard once focused stays
  REQUIRES HUMAN, and the same row says so.
- **`WCAG-2.4.7` Focus Visible.** Compare each focused reading against the same element
  unfocused. `outlineStyle: 'none'` with no change in `boxShadow`, `border` or `background` is
  a FAIL. Quote both readings in the finding.
- **`WCAG-2.1.2` No Keyboard Trap.** If Tab pressed more times than there are focusable
  elements never returns to `body` or to the first element, focus is trapped. Name the element
  it is stuck on.
- **`WCAG-2.4.3` Focus Order.** Compare the order focus visited against the DOM order in the
  first list. Same order is a PASS. A different order is not automatically a failure, because
  the criterion allows any order that preserves meaning, so a difference is REQUIRES HUMAN
  with the two orders printed side by side for the person to judge.

### 3. Licence number type size, `CA-2773(a)-TYPESIZE`

The regulation says the licence number's type must be "no smaller than the smallest size type
used in the solicitation material". That is a comparison between two rendered numbers and
there is no way to reach it from source.

Run this after stage 09 has found the licence number string:

```js
(licence) => {
  const sizes = [];
  let target = null;
  document.querySelectorAll('*').forEach(el => {
    const t = [...el.childNodes].filter(n => n.nodeType === 3 && n.textContent.trim()).map(n => n.textContent).join('');
    if (!t.trim()) return;
    const st = getComputedStyle(el);
    if (st.display === 'none' || st.visibility === 'hidden' || +st.opacity === 0) return;
    const px = parseFloat(st.fontSize);
    sizes.push({ px, tag: el.tagName.toLowerCase(), text: t.trim().slice(0,40) });
    if (t.includes(licence)) target = { px, tag: el.tagName.toLowerCase(), text: t.trim().slice(0,60) };
  });
  sizes.sort((a,b) => a.px - b.px);
  return { licence: target, smallest: sizes[0], allSizes: [...new Set(sizes.map(s => s.px))].sort((a,b) => a-b) };
}
```

- `licence.px` smaller than `smallest.px` is a FAIL on `CA-2773(a)-TYPESIZE`, severity LEGAL.
  The finding quotes both pixel values and the text of the element that set the smaller one.
- Equal or larger is a PASS, and the finding says the two numbers anyway.
- `licence: null` means stage 09 found no licence number, so this provision is not reached.
  The failure is `CA-2773(a)-LICENSE`, not this one.
- Hidden text is excluded above on purpose. Type that nobody can see is not type used in the
  material, and including it would let a `display:none` element create a false failure.

---

## Tier 2: the rest of what a browser settles

Same rules. A recorded number or it did not happen.

| Provision | Measurement | What is still not settled |
|---|---|---|
| `WCAG-1.3.4` Orientation | Resize to 320x640 and 640x320. Look for a CSS transform or a message that locks one orientation | Nothing, if neither is present |
| `WCAG-1.4.4` Resize Text | Set the root font size to 200 percent, then read `scrollWidth > clientWidth` and check for clipped text (`scrollHeight > clientHeight` on fixed-height boxes) | Whether clipped content is still available another way, which is REQUIRES HUMAN |
| `WCAG-1.4.10` Reflow | Resize to 320 CSS pixels wide, then read `document.documentElement.scrollWidth > 320`. Horizontal scrolling for content that is not a map, table or diagram is a FAIL | Whether the content requires two-dimensional layout, which the criterion exempts |
| `WCAG-1.4.11` Non-text Contrast | The Tier 1 contrast routine, run over form control borders and focus indicators against their background. 3:1 required | Which graphics are "needed to understand the content", which needs a person |
| `WCAG-1.4.12` Text Spacing | Apply the criterion's own four overrides (line height 1.5em, paragraph spacing 2em, letter spacing 0.12em, word spacing 0.16em), then look for clipping or overlap | Nothing mechanical. Overlap is measurable from bounding rectangles |
| `WCAG-3.2.1` On Focus | Focus each control in turn and record `location.href`, the focused element and `window.length` before and after. A change is a FAIL | Nothing |
| `WCAG-3.2.2` On Input | Change each control and record the same three. A change with no prior warning is a FAIL | Whether the user was warned, which needs the surrounding text read by a person |
| `WCAG-4.1.2` Name, Role, Value | `browser_snapshot` gives the computed accessible name and role for custom widgets, which source cannot | Whether the name is *meaningful*, which is REQUIRES HUMAN, as it is from source |
| `WCAG-4.1.3` Status Messages | Read every `[role=status]`, `[role=alert]` and `[aria-live]` region, then trigger a form error and see whether the message lands in one | Whether every status message was found, since some only appear after a real submission |
| `WCAG-1.3.1` Info and Relationships | Compare what looks like a heading (font size and weight) against what is marked as one. Visual grouping that no markup expresses is only visible once rendered | Whether an unmarked relationship matters, which needs a person |
| `WCAG-1.3.2` Meaningful Sequence | Compare DOM order against visual order from bounding rectangles. CSS `order`, `float` and absolute positioning move content without moving it in the source | Nothing, where the visual order is unambiguous |
| `WCAG-2.2.2` Pause, Stop, Hide | Read `getAnimations()` for anything running longer than 5 seconds, then look for a control that stops it | Whether a control found elsewhere on the page governs it |
| `WCAG-2.4.1` Bypass Blocks | Focus the skip link with one Tab, activate it, and read where focus landed. A skip link that does not move focus is a FAIL, and source cannot tell you that | Nothing |
| `WCAG-3.3.1` Error Identification | Submit the form empty and read what appears. An error signalled only by a red border is a FAIL, because the criterion requires the error be "described to the user in text" | Whether the text names the right field, which needs a person |

## What browser mode still cannot reach

Say this plainly in every run that uses it, so nobody reads a browser-mode audit as a clean
bill of accessibility.

- **The ten HUMAN criteria do not move.** Captions, audio description, sensory
  characteristics, use of colour, images of text, flashing, and error prevention on legal or
  financial forms all need a person. A browser cannot watch a video or judge a sentence.
- **`WCAG-2.1.4`, `WCAG-2.5.1`, `WCAG-2.5.2` and `WCAG-2.5.4`** stay REQUIRES HUMAN. Single
  character shortcuts, pointer gestures, pointer cancellation and motion actuation are all
  about handlers that a page can register in ways no script can enumerate reliably. Guessing
  here would produce confident wrong answers, which is the failure this whole tool exists to
  avoid.
- **`WCAG-1.4.13` Content on Hover or Focus** stays REQUIRES HUMAN. Whether extra content is
  dismissible, hoverable and persistent is three judgements, not three measurements.
- **A clean browser-mode result is still not a conformance claim.** It means the criteria this
  file lists came out clean on the page as rendered here, at the sizes tested, by a tool, on
  one page.

## What goes in the run

`output/<run>/03b-render.md`, written by stage 03 and read by stages 07 and 09. It carries, in
this order: what was rendered and from which path, the viewport, whether stylesheets loaded,
then one table per measurement above with the raw numbers. No verdicts. Stage 03 judges
nothing, and that does not change because a browser is open.

The reader must be able to take any browser finding, open `03b-render.md`, and see the number
it came from. That is the same contract as `file:line` for a source finding, which is the
whole idea of this tool applied to something that has no line number.
