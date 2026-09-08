# examples.md: worked examples, for calibration

Three worked examples drawn from the two complete audits in `output/`. One is a FAIL from
`samples/fail-case/`, one is a PASS from `samples/pass-case/`, and the last is a verdict that
is deliberately **not** a finding.

**Three, because three is what teaches the shape.** A finding, a pass and a refusal are the
only three things this auditor ever writes. Every severity band, and all 141 provisions, are in
the committed runs in `output/`, which is where you go for coverage. This file is for
calibration, not coverage.

The last one is the important one. Anyone can write a rule that says "cite your source." The
test of an auditor is whether it holds the line when something looks obviously wrong and the
evidence is not there. Every line number below is real
and every citation resolves. Run `./verify-citations.sh` and it checks them for you.

These are excerpts. The two complete runs they come from are committed at
`output/fail-case-2026-09-07/` (27 findings and a 141-provision ledger) and
`output/pass-case-2026-09-07/` (0 findings and the same ledger). Each run carries three files:
the findings ledger, the one-page client summary, and the browser measurements it rests on.

**The finding numbers here match those files exactly.** Open
`output/fail-case-2026-09-07/audit-fail-case-2026-09-07.md`, search for `F-012`, and you get
the same finding printed below, with the same provision, the same line numbers and the same
observed string.

Read these for the shape, not for the content. Your audit finds what is actually there.

---

## Example 1: a LEGAL finding

The severest band. Notice that the evidence comes from `manifest.md`, never from looking at
the image, because this auditor cannot see images.

```
F-001   LEGAL
Provision : CA-10140.8(a)(1)-STATEMENT
            (reference/state/ca/bpc-10140-8-ab-723.md:87)
Provision text
  "A real estate broker or salesperson, or person acting on their behalf, who
   includes a digitally altered image in an advertisement or other promotional
   material for the sale of real property shall include in the advertisement or
   promotional material a statement disclosing that the image has been altered"
Location  : samples/fail-case/index.html:45
Observed  : <img src="img/kitchen-staged.jpg" width="800">
Evidence  : samples/fail-case/manifest.md row 3 states this image was produced by
            "Photograph of the empty kitchen. Furniture and a fruit bowl added
            with generative AI".
Coverage  : Covered. "Furniture" is named in CA-10140.8(b)(1)
            (reference/state/ca/bpc-10140-8-ab-723.md:80). The b(2) exclusion
            does not reach it, because adding furniture changes the
            representation of the real property.
Verdict   : FAIL
Why       : The image is a digitally altered image and the page carries no
            statement anywhere that it has been altered. Searched the whole file
            for "altered", "AI", "virtual" and "staged": no match outside the
            file name itself.
Fix       : Put a statement on or adjacent to the image saying it has been
            altered, add a link to a public page holding the unaltered
            photograph, and say in the statement that the unaltered images are
            at that link. samples/pass-case/index.html:77-82 shows all three
            done together.
See also  : F-002 (-CONSPICUOUS), F-003 (-LINK), F-004 (-POINTER) fail for the
            same image. Each obligation is a separate finding.
Note      : This auditor is not a lawyer and this is not legal advice. It
            reports that an artifact does not match a statute's text.
```

**Why this is four findings and not one.** `CA-10140.8(a)(1)` imposes four separate
obligations. Collapsing them into "AB 723 violation" would hide that a site could fix the
statement and still be missing the link. One finding, one provision.

---

## Example 2: a PASS, written out in full

**An audit that does not report its passes is a complaint.** Passes get the same format,
minus the fix.

```
P-001   PASS
Provision : CA-10140.8(b)(2)
            (reference/state/ca/bpc-10140-8-ab-723.md:81)
Provision text
  "'Digitally altered image' does not include an image where only lighting,
   sharpening, white balance, color correction, angle, straightening, cropping,
   exposure, or other common photo editing adjustments are made that do not
   change the representation of the real property."
Location  : samples/pass-case/index.html:67
Observed  : <img src="img/exterior.jpg" ... >
Evidence  : samples/pass-case/manifest.md row 2: "Photograph. Exposure lifted,
            straightened and cropped".
Verdict   : PASS
Why       : Exposure, straightening and cropping are three of the adjustments
            named in the exclusion, and nothing else was done. The image is not
            a digitally altered image, so no disclosure obligation attaches to
            it.
```

---

## Example 3: something that is not a finding

The most important example in this file. An auditor is judged as much on what it refuses to
say as on what it reports.

While reading `samples/fail-case/index.html` you will notice the footer at lines 69 to 74:
forty-seven city and neighbourhood names in one paragraph, with no other content.

That looks exactly like `SPAM-KEYWORD-STUFFING`
(`reference/google/spam-policies.md:125`), whose own example is "Blocks of text that list
cities and regions that a web page is trying to rank for."

**It is still not a FAIL.** Here is the verdict this auditor issues:

```
Q-001   INSUFFICIENT EVIDENCE
Provision : SPAM-KEYWORD-STUFFING  (reference/google/spam-policies.md:125)
Provision text
  "Keyword stuffing refers to the practice of filling a web page with keywords
   or numbers in an attempt to manipulate rankings in Google Search results."
   Listed example: "Blocks of text that list cities and regions that a web page
   is trying to rank for".
Location  : samples/fail-case/index.html:69-74
Observed  : A single paragraph naming 47 cities and neighbourhoods, with no
            other content in it.
Verdict   : INSUFFICIENT EVIDENCE
Why       : The provision turns on intent: "in an attempt to manipulate
            rankings". The artifact matches Google's listed example closely, but
            intent is not visible in a file. A genuine service-area list on a
            real brokerage page and a stuffed footer look identical in source.
What would settle it
  Whether these areas are served in fact, and whether each name links to a page
  with its own content. If the list is decorative and the areas are real, this
  is not keyword stuffing. If the names exist to catch queries the agent does
  not serve, it is.
Severity if confirmed : BLOCKING
```

`rules.md` section 6 is the rule this follows. A false spam accusation against a real
business is the worst thing this auditor can produce, so the bar is a near word-for-word
match against the publisher's own example **plus** evidence of intent, and intent is almost
never in the file.

Contrast that with the `CA-10140.8` finding in Example 1, which is a flat FAIL. The statute
turns on what was done to the image, `manifest.md` states what was done, and no intent is
required. **The evidence bar is set by the provision, not by how bad the thing looks.**
