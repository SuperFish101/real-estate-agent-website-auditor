# WCAG 2.1 Principle 2: Operable, Level A and AA success criteria

**This file is the standard, not a summary of it.**

| | |
|---|---|
| Document | Web Content Accessibility Guidelines (WCAG) 2.1 |
| Publisher | World Wide Web Consortium (W3C) |
| Status | W3C Recommendation, 5 June 2018 (latest revision 21 September 2023) |
| Source | https://www.w3.org/TR/WCAG21/ |
| Retrieved | 2026-09-03 |
| Licence | W3C Software and Document Licence |
| Scope of this file | The 17 Level A and AA success criteria under Principle 2, verbatim. The other three principles are in the sibling files listed in `CONTEXT.md`. |

Hyperlinks in the source have been flattened to plain text so the wording can be read
offline. No word of the criterion text has been added, removed or reordered. Level AAA
criteria are excluded because this auditor audits to Level AA.

**Provision ID.** A finding cites `WCAG-<number>`, for example `WCAG-1.4.3`. Every ID below
is a heading in this file.

---

## WCAG-2.1.1

**2.1.1 Keyboard** (Level A)

All functionality of the content is operable through a keyboard interface without requiring specific timings for individual keystrokes, except where the underlying
function requires input that depends on the path of the user's movement and not just
the endpoints.

Note 1

This exception relates to the underlying function, not the input technique. For example,
if using handwriting to enter text, the input technique (handwriting) requires path-dependent
input but the underlying function (text input) does not.

Note 2

This does not forbid and should not discourage providing mouse input or other input
methods in addition to keyboard operation.

---

## WCAG-2.1.2

**2.1.2 No Keyboard Trap** (Level A)

If keyboard focus can be moved to a component of the page using a keyboard interface, then focus can be moved away from that component using only a keyboard interface,
and, if it requires more than unmodified arrow or tab keys or other standard exit
methods, the user is advised of the method for moving focus away.

Note

Since any content that does not meet this success criterion can interfere with a user's
ability to use the whole page, all content on the web page (whether it is used to
meet other success criteria or not) must meet this success criterion. See Conformance Requirement 5: Non-Interference.

---

## WCAG-2.1.4

**2.1.4 Character Key Shortcuts** (Level A)

If a keyboard shortcut is implemented in content using only letter (including upper- and lower-case letters), punctuation, number, or symbol characters, then at least one of the following is true:

Turn offA mechanism is available to turn the shortcut off;RemapA mechanism is available to remap the shortcut to include one or more non-printable keyboard keys (e.g., Ctrl, Alt);Active only on focusThe keyboard shortcut for a user interface component is only active when that component has focus.

---

## WCAG-2.2.1

**2.2.1 Timing Adjustable** (Level A)

For each time limit that is set by the content, at least one of the following is true:

Turn off

The user is allowed to turn off the time limit before encountering it; or

Adjust

The user is allowed to adjust the time limit before encountering it over a wide range
that is at least ten times the length of the default setting; or

Extend

The user is warned before time expires and given at least 20 seconds to extend the
time limit with a simple action (for example, "press the space bar"), and the user
is allowed to extend the time limit at least ten times; or

Real-time Exception

The time limit is a required part of a real-time event (for example, an auction),
and no alternative to the time limit is possible; or

Essential Exception

The time limit is essential and extending it would invalidate the activity; or

20 Hour Exception

The time limit is longer than 20 hours.

Note

This success criterion helps ensure that users can complete tasks without unexpected
changes in content or context that are a result of a time limit. This success criterion
should be considered in conjunction with Success Criterion 3.2.1, which puts limits on changes of content or context as a result of user action.

---

## WCAG-2.2.2

**2.2.2 Pause, Stop, Hide** (Level A)

For moving, blinking, scrolling, or auto-updating information, all of the following are true:

Moving, blinking, scrolling

For any moving, blinking or scrolling information that (1) starts automatically, (2)
lasts more than five seconds, and (3) is presented in parallel with other content,
there is a mechanism for the user to pause, stop, or hide it unless the movement, blinking, or scrolling is part of an activity
where it is essential; and

Auto-updating

For any auto-updating information that (1) starts automatically and (2) is presented
in parallel with other content, there is a mechanism for the user to pause, stop,
or hide it or to control the frequency of the update unless the auto-updating is part
of an activity where it is essential.

Note 1

For requirements related to flickering or flashing content, refer to Guideline 2.3.

Note 2

Since any content that does not meet this success criterion can interfere with a user's
ability to use the whole page, all content on the web page (whether it is used to
meet other success criteria or not) must meet this success criterion. See Conformance Requirement 5: Non-Interference.

Note 3

Content that is updated periodically by software or that is streamed to the user agent
is not required to preserve or present information that is generated or received between
the initiation of the pause and resuming presentation, as this may not be technically
possible, and in many situations could be misleading to do so.

Note 4

An animation that occurs as part of a preload phase or similar situation can be considered
essential if interaction cannot occur during that phase for all users and if not indicating
progress could confuse users or cause them to think that content was frozen or broken.

---

## WCAG-2.3.1

**2.3.1 Three Flashes or Below Threshold** (Level A)

Web pages do not contain anything that flashes more than three times in any one second period,
or the flash is below the general flash and red flash thresholds.

Note

Since any content that does not meet this success criterion can interfere with a user's
ability to use the whole page, all content on the web page (whether it is used to
meet other success criteria or not) must meet this success criterion. See Conformance Requirement 5: Non-Interference.

---

## WCAG-2.4.1

**2.4.1 Bypass Blocks** (Level A)

A mechanism is available to bypass blocks of content that are repeated on multiple web pages.

---

## WCAG-2.4.2

**2.4.2 Page Titled** (Level A)

Web pages have titles that describe topic or purpose.

---

## WCAG-2.4.3

**2.4.3 Focus Order** (Level A)

If a web page can be navigated sequentially and the navigation sequences affect meaning or operation, focusable components receive
focus in an order that preserves meaning and operability.

---

## WCAG-2.4.4

**2.4.4 Link Purpose (In Context)** (Level A)

The purpose of each link can be determined from the link text alone or from the link text together with its
programmatically determined link context, except where the purpose of the link would be ambiguous to users in general.

---

## WCAG-2.4.5

**2.4.5 Multiple Ways** (Level AA)

More than one way is available to locate a web page within a set of web pages except where the web page is the result of, or a step in, a process.

---

## WCAG-2.4.6

**2.4.6 Headings and Labels** (Level AA)

Headings and labels describe topic or purpose.

---

## WCAG-2.4.7

**2.4.7 Focus Visible** (Level AA)

Any keyboard operable user interface has a mode of operation where the keyboard focus indicator is visible.

---

## WCAG-2.5.1

**2.5.1 Pointer Gestures** (Level A)

All functionality that uses multipoint or path-based gestures for operation can be operated with a single pointer without a path-based gesture, unless a multipoint or path-based gesture is essential.

Note

This requirement applies to web content that interprets pointer actions (i.e. this does not apply to actions that are required to operate the user agent or assistive technology).

---

## WCAG-2.5.2

**2.5.2 Pointer Cancellation** (Level A)

For functionality that can be operated using a single pointer, at least one of the following is true:

No Down-EventThe down-event of the pointer is not used to execute any part of the function;Abort or UndoCompletion of the function is on the up-event, and a mechanism is available to abort the function before completion or to undo the function after completion;Up ReversalThe up-event reverses any outcome of the preceding down-event;EssentialCompleting the function on the down-event is essential.

Note 1

Functions that emulate a keyboard or numeric keypad key press are considered essential.

Note 2

This requirement applies to web content that interprets pointer actions (i.e. this does not apply to actions that are required to operate the user agent or assistive technology).

---

## WCAG-2.5.3

**2.5.3 Label in Name** (Level A)

For user interface components with labels that include text or images of text, the name contains the text that is presented visually.

Note

A best practice is to have the text of the label at the start of the name.

---

## WCAG-2.5.4

**2.5.4 Motion Actuation** (Level A)

Functionality that can be operated by device motion or user motion can also be operated by user interface components and responding to the motion can be disabled to prevent accidental actuation, except when:

Supported InterfaceThe motion is used to operate functionality through an accessibility supported interface;EssentialThe motion is essential for the function and doing so would invalidate the activity.
