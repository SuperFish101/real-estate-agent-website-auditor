# RFC 6797, HTTP Strict Transport Security (HSTS)

| | |
|---|---|
| Publisher | Internet Engineering Task Force (IETF) |
| Source | https://www.rfc-editor.org/rfc/rfc6797.txt |
| Version | RFC 6797, November 2012. Standards Track. **Current, not obsoleted** |
| Retrieved | 2026-09-06 |
| Licence | Copyright (c) 2012 IETF Trust and the persons identified as the document authors. Subject to BCP 78 and the IETF Trust's Legal Provisions (https://trustee.ietf.org/license-info) |
| Scope of this file | Sections 5.1, 5.2 and 6.1 including 6.1.1 and 6.1.2, verbatim. The threat model, UA processing model, IANA and security considerations are not reproduced, because nothing in them can be checked against a saved page |

**Why this is in a real estate auditor.** A licensee's site collects names, phone numbers and
addresses through lead forms. Whether those forms are served over a connection a browser is
required to keep secure is a fact about the page, checkable from response headers, and it is
the one transport question that has a published standard rather than an opinion.

**Provision ID scheme.** `HSTS-5.1`, `HSTS-5.2`, `HSTS-6.1`, `HSTS-6.1.1`, `HSTS-6.1.2`.

---

## Section 5.1, HSTS Host Declaration

`HSTS-5.1` An HTTP host declares itself an HSTS Host by issuing to UAs an HSTS Policy, which is
represented by and conveyed via the Strict-Transport-Security HTTP response header field over
secure transport (e.g., TLS). Upon error-free receipt and processing of this header by a
conformant UA, the UA regards the host as a Known HSTS Host.

## Section 5.2, HSTS Policy

`HSTS-5.2` An HSTS Policy directs UAs to communicate with a Known HSTS Host only over secure
transport and specifies policy retention time duration.

HSTS Policy explicitly overrides the UA processing of URI references, user input (e.g., via the
"location bar"), or other information that, in the absence of HSTS Policy, might otherwise cause
UAs to communicate insecurely with the Known HSTS Host.

An HSTS Policy may contain an optional directive, includeSubDomains, specifying that this HSTS
Policy also applies to any hosts whose domain names are subdomains of the Known HSTS Host's
domain name.

## Section 6.1, Strict-Transport-Security HTTP Response Header Field

`HSTS-6.1` The overall requirements for directives are:

1. The order of appearance of directives is not significant.
2. All directives MUST appear only once in an STS header field. Directives are either optional
   or required, as stipulated in their definitions.
3. Directive names are case-insensitive.
4. UAs MUST ignore any STS header field containing directives, or other header field value
   data, that does not conform to the syntax defined in this specification.
5. If an STS header field contains directive(s) not recognized by the UA, the UA MUST ignore
   the unrecognized directives, and if the STS header field otherwise satisfies the above
   requirements (1 through 4), the UA MUST process the recognized directives.

### 6.1.1, The max-age Directive

`HSTS-6.1.1` The REQUIRED "max-age" directive specifies the number of seconds, after the
reception of the STS header field, during which the UA regards the host (from whom the message
was received) as a Known HSTS Host.

### 6.1.2, The includeSubDomains Directive

`HSTS-6.1.2` The OPTIONAL "includeSubDomains" directive is a valueless directive that, if
present (i.e., it is "asserted"), signals the UA regarding whether or not the HSTS Policy
applies to the Known HSTS Host's domain name's subdomains.

---

## How the auditor uses this

| Provision | What is checked | Verdict when it cannot be checked |
|---|---|---|
| `HSTS-5.1` | Is a `Strict-Transport-Security` response header present, and was it served over HTTPS? | INSUFFICIENT EVIDENCE. **A saved HTML file carries no response headers.** The capture must record them, or the stage asks for a live `curl -I` |
| `HSTS-6.1.1` | Does the header carry `max-age`, which the RFC marks REQUIRED? A header without it is malformed | Same |
| `HSTS-6.1.2` | Is `includeSubDomains` asserted? **Optional, so its absence is never a failure**, only reported | Same |

**This standard sets no minimum `max-age`.** Preload lists and hardening guides recommend one
year, and that recommendation is not in this RFC, so the auditor does not issue a finding for a
short `max-age`. It reports the value and stops. Grading a number the standard does not state
would be an opinion wearing a citation.
