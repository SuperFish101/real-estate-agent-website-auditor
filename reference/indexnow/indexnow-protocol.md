# IndexNow protocol

| | |
|---|---|
| Publisher | IndexNow (Microsoft Bing, Yandex, Seznam, Naver and others) |
| Source | https://www.indexnow.org/documentation |
| Version | The published documentation as at the retrieval date |
| Retrieved | 2026-09-06 |
| Licence | Published documentation, reproduced for reference. Not endorsed by IndexNow or its participants |
| Scope of this file | The key requirements, the submission methods and the ownership verification rules, verbatim. The per-search-engine endpoint list and the response-code table are not reproduced |

**Why this is in the auditor.** Bing's own Webmaster Guidelines name IndexNow four times as the
way to tell Bing that URLs changed. It is checkable from an artifact: either a key file is
hosted at the root or it is not.

**Provision ID scheme.** `INDEXNOW-KEY-<n>`, `INDEXNOW-SUBMIT-<n>`, `INDEXNOW-VERIFY-<n>`.

---

## The key

`INDEXNOW-KEY-1` Your-key should have a minimum of 8 and a maximum of 128 hexadecimal
characters. The key can contain only the following characters: lowercase characters (a-z),
uppercase characters (A-Z), numbers (0-9), and dashes (-).

## Submitting URLs

`INDEXNOW-SUBMIT-1` To submit one URL, issue an HTTP request with the URL and your key. A
successful request will return an HTTP 200 response code; if you receive a different response,
verify that you don't submit too often, that the key and URL are valid and resubmit the request.
The HTTP 200 response code only indicates that the search engine has received your URL.

`INDEXNOW-SUBMIT-2` To submit a set of URLs using an HTTP request issue your POST JSON request
to the URL provided by Search Engines. A successful request will return an HTTP 200 response
code.

## Verifying ownership

`INDEXNOW-VERIFY-1` To submit URLs, you must "prove" ownership of the host for which URLs are
being submitted by hosting at least one text file within the host. Once you submit your URLs to
search engines, search engines will crawl the key file to verify ownership and use the key until
you change the key. Only you and the search engines should know the key and your file key
location.

`INDEXNOW-VERIFY-2` You must host a UTF-8 encoded text key file `{your-key}.txt` listing the key
in the file at the root directory of your website.

---

## How the auditor uses this

| Provision | Check | Verdict |
|---|---|---|
| `INDEXNOW-VERIFY-2` | Is a `{key}.txt` file present in the artifact, or named in `NOTES.md`? | Present is a PASS. **Absent is not a failure**, it is NOT APPLICABLE with a note, because IndexNow is optional and no publisher requires it |
| `INDEXNOW-KEY-1` | If a key file is present, does the key match the character and length rules? | A malformed key is a real FAIL: the file exists and cannot work |

**Severity is ADVISORY at most.** Nothing here says a site is delisted or penalised for not
using IndexNow. The honest finding is "adopting this would tell Bing about changes faster", and
that sentence is only allowed because Bing's own guidelines say it, cited to `BING-4`.

**Never report the key value.** It is a shared secret between the site owner and the search
engines, and the documentation says so in `INDEXNOW-VERIFY-1`. The auditor reports that a key
file exists and whether its format is valid. **It never prints the key**, in the ledger, the
client summary or a committed run.
