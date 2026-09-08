# WCAG 2.1 Principle 1: Perceivable, Level A and AA success criteria

**This file is the standard, not a summary of it.**

| | |
|---|---|
| Document | Web Content Accessibility Guidelines (WCAG) 2.1 |
| Publisher | World Wide Web Consortium (W3C) |
| Status | W3C Recommendation, 5 June 2018 (latest revision 21 September 2023) |
| Source | https://www.w3.org/TR/WCAG21/ |
| Retrieved | 2026-09-03 |
| Licence | W3C Software and Document Licence |
| Scope of this file | The 20 Level A and AA success criteria under Principle 1, verbatim. The other three principles are in the sibling files listed in `CONTEXT.md`. |

Hyperlinks in the source have been flattened to plain text so the wording can be read
offline. No word of the criterion text has been added, removed or reordered. Level AAA
criteria are excluded because this auditor audits to Level AA.

**Provision ID.** A finding cites `WCAG-<number>`, for example `WCAG-1.4.3`. Every ID below
is a heading in this file.

---

## WCAG-1.1.1

**1.1.1 Non-text Content** (Level A)

All non-text content that is presented to the user has a text alternative that serves the equivalent purpose, except for the situations listed below.

Controls, Input

If non-text content is a control or accepts user input, then it has a name that describes its purpose. (Refer to Success Criterion 4.1.2 for additional requirements for controls and content that accepts user input.)

Time-Based Media

If non-text content is time-based media, then text alternatives at least provide descriptive
identification of the non-text content. (Refer to Guideline 1.2 for additional requirements for media.)

Test

If non-text content is a test or exercise that would be invalid if presented in text, then text alternatives at least provide descriptive identification of the non-text
content.

Sensory

If non-text content is primarily intended to create a specific sensory experience, then text alternatives at least provide descriptive identification of the non-text
content.

CAPTCHA

If the purpose of non-text content is to confirm that content is being accessed by
a person rather than a computer, then text alternatives that identify and describe
the purpose of the non-text content are provided, and alternative forms of CAPTCHA
using output modes for different types of sensory perception are provided to accommodate
different disabilities.

Decoration, Formatting, Invisible

If non-text content is pure decoration, is used only for visual formatting, or is not presented to users, then it is implemented
in a way that it can be ignored by assistive technology.

---

## WCAG-1.2.1

**1.2.1 Audio-only and Video-only (Prerecorded)** (Level A)

For prerecorded audio-only and prerecorded video-only media, the following are true, except when the audio or video is a media alternative for text and is clearly labeled as such:

Prerecorded Audio-only

An alternative for time-based media is provided that presents equivalent information for prerecorded audio-only content.

Prerecorded Video-only

Either an alternative for time-based media or an audio track is provided that presents
equivalent information for prerecorded video-only content.

---

## WCAG-1.2.2

**1.2.2 Captions (Prerecorded)** (Level A)

Captions are provided for all prerecorded audio content in synchronized media, except when the media is a media alternative for text and is clearly labeled as such.

---

## WCAG-1.2.3

**1.2.3 Audio Description or Media Alternative (Prerecorded)** (Level A)

An alternative for time-based media or audio description of the prerecorded video content is provided for synchronized media, except when the media is a media alternative for text and is clearly labeled as such.

---

## WCAG-1.2.4

**1.2.4 Captions (Live)** (Level AA)

Captions are provided for all live audio content in synchronized media.

---

## WCAG-1.2.5

**1.2.5 Audio Description (Prerecorded)** (Level AA)

Audio description is provided for all prerecorded video content in synchronized media.

---

## WCAG-1.3.1

**1.3.1 Info and Relationships** (Level A)

Information, structure, and relationships conveyed through presentation can be programmatically determined or are available in text.

---

## WCAG-1.3.2

**1.3.2 Meaningful Sequence** (Level A)

When the sequence in which content is presented affects its meaning, a correct reading sequence can be programmatically determined.

---

## WCAG-1.3.3

**1.3.3 Sensory Characteristics** (Level A)

Instructions provided for understanding and operating content do not rely solely on
sensory characteristics of components such as shape, color, size, visual location, orientation,
or sound.

Note

For requirements related to color, refer to Guideline 1.4.

---

## WCAG-1.3.4

**1.3.4 Orientation** (Level AA)

Content does not restrict its view and operation to a single display orientation, such as portrait or landscape, unless a specific display orientation is essential.

Note

Examples where a particular display orientation may be essential are a bank check, a piano application, slides for a projector or television, or virtual reality content where content is not necessarily restricted to landscape or portrait display orientation.

---

## WCAG-1.3.5

**1.3.5 Identify Input Purpose** (Level AA)

The purpose of each input field collecting information about the user can be programmatically determined when:

- The input field serves a purpose identified in the Input Purposes for user interface components section; and
- The content is implemented using technologies with support for identifying the expected meaning for form input data.

---

## WCAG-1.4.1

**1.4.1 Use of Color** (Level A)

Color is not used as the only visual means of conveying information, indicating an
action, prompting a response, or distinguishing a visual element.

Note

This success criterion addresses color perception specifically. Other forms of perception are covered in Guideline 1.3 including programmatic access to color and other visual presentation coding.

---

## WCAG-1.4.2

**1.4.2 Audio Control** (Level A)

If any audio on a web page plays automatically for more than 3 seconds, either a mechanism is available to pause or stop the audio, or a mechanism is available to control audio
volume independently from the overall system volume level.

Note

Since any content that does not meet this success criterion can interfere with a user's
ability to use the whole page, all content on the web page (whether or not it is used
to meet other success criteria) must meet this success criterion. See Conformance Requirement 5: Non-Interference.

---

## WCAG-1.4.3

**1.4.3 Contrast (Minimum)** (Level AA)

The visual presentation of text and images of text has a contrast ratio of at least 4.5:1, except for the following:

Large Text

Large-scale text and images of large-scale text have a contrast ratio of at least 3:1;

Incidental

Text or images of text that are part of an inactive user interface component, that are pure decoration, that are not visible to anyone, or that are part of a picture that contains significant
other visual content, have no contrast requirement.

Logotypes

Text that is part of a logo or brand name has no contrast requirement.

---

## WCAG-1.4.4

**1.4.4 Resize Text** (Level AA)

Except for captions and images of text, text can be resized without assistive technology up to 200 percent without loss of content or functionality.

---

## WCAG-1.4.5

**1.4.5 Images of Text** (Level AA)

If the technologies being used can achieve the visual presentation, text is used to convey information rather than images of text except for the following:

Customizable

The image of text can be visually customized to the user's requirements;

Essential

A particular presentation of text is essential to the information being conveyed.

Note

Logotypes (text that is part of a logo or brand name) are considered essential.

---

## WCAG-1.4.10

**1.4.10 Reflow** (Level AA)

Content can be presented without loss of information or functionality, and without requiring scrolling in two dimensions for:

- Vertical scrolling content at a width equivalent to 320 CSS pixels;
- Horizontal scrolling content at a height equivalent to 256 CSS pixels.

Except for parts of the content which require two-dimensional layout for usage or meaning.

Note 1

320 CSS pixels is equivalent to a starting viewport width of 1280 CSS pixels wide at 400% zoom. For web content which is designed to scroll horizontally (e.g., with vertical text), 256 CSS pixels is equivalent to a starting viewport height of 1024 CSS pixels at 400% zoom.

Note 2

Examples of content which requires two-dimensional layout are images required for understanding (such as maps and diagrams), video, games, presentations, data tables (not individual cells), and interfaces where it is necessary to keep toolbars in view while manipulating content. It is acceptable to provide two-dimensional scrolling for such parts of the content.

---

## WCAG-1.4.11

**1.4.11 Non-text Contrast** (Level AA)

The visual presentation of the following have a contrast ratio of at least 3:1 against adjacent color(s):

User Interface ComponentsVisual information required to identify user interface components and states, except for inactive components or where the appearance of the component is determined by the user agent and not modified by the author;Graphical ObjectsParts of graphics required to understand the content, except when a particular presentation of graphics is essential to the information being conveyed.

---

## WCAG-1.4.12

**1.4.12 Text Spacing** (Level AA)

In content implemented using markup languages that support the following text style properties, no loss of content or functionality occurs by setting all of the following and by changing no other style property:

- Line height (line spacing) to at least 1.5 times the font size;
- Spacing following paragraphs to at least 2 times the font size;
- Letter spacing (tracking) to at least 0.12 times the font size;
- Word spacing to at least 0.16 times the font size.

Exception: Human languages and scripts that do not make use of one or more of these text style properties in written text can conform using only the properties that exist for that combination of language and script.

---

## WCAG-1.4.13

**1.4.13 Content on Hover or Focus** (Level AA)

Where receiving and then removing pointer hover or keyboard focus triggers additional content to become visible and then hidden, the following are true:

DismissibleA mechanism is available to dismiss the additional content without moving pointer hover or keyboard focus, unless the additional content communicates an input error or does not obscure or replace other content;HoverableIf pointer hover can trigger the additional content, then the pointer can be moved over the additional content without the additional content disappearing;PersistentThe additional content remains visible until the hover or focus trigger is removed, the user dismisses it, or its information is no longer valid.

Exception: The visual presentation of the additional content is controlled by the user agent and is not modified by the author.

Note 1

Examples of additional content controlled by the user agent include browser tooltips created through use of the HTML `title` attribute.

Note 2

Custom tooltips, sub-menus, and other nonmodal popups that display on hover and focus are examples of additional content covered by this criterion.
