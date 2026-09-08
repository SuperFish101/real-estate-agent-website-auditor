# Notes from the site owner

> **This is `fail-case/` with every defect repaired. Same fictional licensee, on purpose.**
> The two folders are one controlled pair, not two different sites. `fail-case/` has a known
> defect seeded against every severity band; this one has each of them fixed and nothing else
> changed. That is what makes it a test: an auditor that finds problems here, in markup built
> to be clean, is broken, and you can only prove that with the *same* artifact repaired.
> Nobody named here exists. Neither folder was taken from a real website.

- Marisol Vega, licensed salesperson, California DRE #01234567 (fictional).
- Her responsible broker is Yolo Valley Realty Inc, California DRE #01987654 (fictional). Both
  are named in the footer, which is what 10 CCR 2773 requires of a salesperson's own website.
- All listings are in Yolo County, California, so California statutes apply.
- The site does not host reviews of any other business, so no review markup is used.
- `/privacy.html` is a public privacy policy, linked from the footer and from the consent text
  beside the enquiry form.
- The enquiry form takes a telephone number, so it carries written consent wording tied to an
  unticked, required checkbox. The wording names autodialed and prerecorded contact and says
  consent is not a condition of purchase, which is what 47 CFR 64.1200(f)(9) sets out.
- `/originals.html` is a public page holding the unaltered photographs, each captioned with
  the file name of the altered version it corresponds to.
- This is a fictional sample built for testing this auditor. No such agent exists.

## Repaired again, 2026-09-07

This fixture was originally built against six standards. The auditor now holds eighteen, and a
fixture that was clean against six is not automatically clean against eighteen. Re-running it
found five things it did not previously have to answer for: no responsible broker named, no
privacy policy posted, and three separate parts of the federal written-consent rule missing
from the enquiry form.

**All five were repaired in the fixture rather than reported as findings**, because a clean
control that is no longer clean has stopped doing its job. `fail-case/` was left alone: it
already fails all five by omission, which is exactly what a fail fixture is for. The pair still
differ only in the defects.
