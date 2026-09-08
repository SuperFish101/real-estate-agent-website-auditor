# Standards this auditor points at but does not reproduce

`reference/` holds standards **verbatim** so any finding can be checked. Some real standards
cannot go in a public repository, almost always because they are copyrighted by a private
body rather than published as law. Those are listed here instead, with what they cover, why
the text is absent, and where to read it.

**Nothing in this file is ever cited by a finding.** A finding cites a provision that exists
in `reference/`. These are pointers for the human, handed over so the audit can say honestly
"here is a rulebook that applies to you which I could not check."

| Standard | Publisher | What it covers | Why it is not here | Read it at |
|---|---|---|---|---|
| NAR Code of Ethics and Standards of Practice, especially **Article 12** | National Association of REALTORS® | Advertising and marketing must present a "true picture". Article 12 and its Standards of Practice govern advertising, disclosure of REALTOR® status, and use of another firm's listings | Copyright NAR. Reproducing the text in a public repo is not permitted | nar.realtor, "Code of Ethics and Standards of Practice" |
| MLS rules, including IDX display rules | Each local MLS | What listing data may be shown, attribution, refresh frequency, and what must be removed when a listing closes | Different in every MLS, and most are behind a member login rather than published | The agent's own MLS member portal |
| Brokerage advertising policy | The agent's brokerage | Logo size and placement, approved language, team name rules, what needs compliance review before publishing | Private to each brokerage | The agent's broker or compliance desk |
| ADA Title III as applied to websites | US Department of Justice | Whether and how the ADA reaches a private business's website | DOJ has issued a web rule for state and local government under Title II, but has not adopted a technical standard for Title III private businesses. There is no text to vendor | ada.gov |

## What the auditor does about them

Every audit ends with a short section naming these, so the report never implies it covered
ground it did not. The wording is fixed:

> **Not checked, and worth checking yourself.** This audit covers the standards in
> `reference/`. It did not check the NAR Code of Ethics, your MLS rules, or your brokerage's
> own advertising policy. Those apply to you and this tool cannot read them. Article 12 of the
> NAR Code, on advertising presenting a true picture, is the closest in subject to what this
> audit does cover, and is worth reading next to these findings.

Applies only where relevant. If the agent is not a REALTOR®, the NAR row is dropped and the
report says so.
