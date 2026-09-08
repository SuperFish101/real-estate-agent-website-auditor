# The AI assistant crawler documentation: OpenAI, Anthropic, Perplexity

Three publishers, three documents, one file, because each is short and stage 05 reads all three
together to answer one question: can the assistants read this agent's site.

| | |
|---|---|
| Scope of this file | The bot names, what each is for, and what happens when it is blocked, verbatim from each publisher. IP range lists, WAF configuration guides and user-agent version strings are not reproduced, because they change without notice and no finding depends on them |

**Provision ID scheme.** `AICRAWL-OPENAI-<bot>`, `AICRAWL-ANTHROPIC-<bot>`,
`AICRAWL-PERPLEXITY-<bot>`.

---

## OpenAI

| | |
|---|---|
| Publisher | OpenAI |
| Source | https://platform.openai.com/docs/bots |
| Retrieved | 2026-09-06 |
| Licence | OpenAI documentation, reproduced for reference. Not endorsed by OpenAI |

OpenAI uses web crawlers ("robots") and user agents to perform actions for its products, either
automatically or triggered by user request. OpenAI uses OAI-SearchBot and GPTBot robots.txt tags
to enable webmasters to manage how their sites and content work with AI. Each setting is
independent of the others. For search results, please note it can take ~24 hours from a site's
robots.txt update for our systems to adjust.

`AICRAWL-OPENAI-OAI-SearchBot` OAI-SearchBot is for search. OAI-SearchBot is used to surface
websites in search results in ChatGPT's search features. **Sites that are opted out of
OAI-SearchBot will not be shown in ChatGPT search answers**, though can still appear as
navigational links. To help ensure your site appears in search results, we recommend allowing
OAI-SearchBot in your site's robots.txt file.

`AICRAWL-OPENAI-GPTBot` GPTBot is used to make our generative AI foundation models more useful
and safe. It is used to crawl content that may be used in training our generative AI foundation
models. **Disallowing GPTBot indicates a site's content should not be used in training
generative AI foundation models.**

`AICRAWL-OPENAI-ChatGPT-User` OpenAI also uses ChatGPT-User for certain user actions in ChatGPT.
When users ask ChatGPT or a CustomGPT a question, it may visit a web page with a ChatGPT-User
agent. ChatGPT-User is not used for crawling the web in an automatic fashion. **Because these
actions are initiated by a user, robots.txt rules may not apply.** ChatGPT-User is not used to
determine whether content may appear in Search.

## Anthropic

| | |
|---|---|
| Publisher | Anthropic |
| Source | https://support.anthropic.com/en/articles/8896518-does-anthropic-crawl-data-from-the-web-and-how-can-site-owners-block-the-crawler |
| Version | Article dated 7 April 2026 |
| Retrieved | 2026-09-06 |
| Licence | Anthropic documentation, reproduced for reference. Not endorsed by Anthropic |

As per industry standard, Anthropic uses a variety of robots to gather data from the public web
for model development, to search the web, and to retrieve web content at users' direction.
Anthropic uses different robots to enable website owner transparency and choice.

`AICRAWL-ANTHROPIC-ClaudeBot` ClaudeBot helps enhance the utility and safety of our generative
AI models by collecting web content that could potentially contribute to their training. **When
a site restricts ClaudeBot access, it signals that the site's future materials should be
excluded from our AI model training datasets.**

`AICRAWL-ANTHROPIC-Claude-User` Claude-User supports Claude AI users. When individuals ask
questions to Claude, it may access websites using a Claude-User agent. **Disabling Claude-User
on your site prevents our system from retrieving your content in response to a user query, which
may reduce your site's visibility for user-directed web search.**

`AICRAWL-ANTHROPIC-Claude-SearchBot` Claude-SearchBot navigates the web to improve search result
quality for users. **Disabling Claude-SearchBot on your site prevents our system from indexing
your content for search optimization, which may reduce your site's visibility and accuracy in
user search results.**

Anthropic's stated principles: crawling should be transparent; should not be intrusive or
disruptive; Bots respect "do not crawl" signals by honoring industry standard directives in
robots.txt; and Bots respect anti-circumvention technologies. Anthropic supports the
non-standard Crawl-delay extension to robots.txt.

## Perplexity

| | |
|---|---|
| Publisher | Perplexity |
| Source | https://docs.perplexity.ai/guides/bots |
| Retrieved | 2026-09-06 |
| Licence | Perplexity documentation, reproduced for reference. Not endorsed by Perplexity |

Webmasters can use the following robots.txt tags to manage how their sites and content interact
with Perplexity. Each setting works independently, and it may take up to 24 hours for our
systems to reflect changes.

`AICRAWL-PERPLEXITY-PerplexityBot` PerplexityBot is designed to surface and link websites in
search results on Perplexity. **It is not used to crawl content for AI foundation models.** To
ensure your site appears in search results, we recommend allowing PerplexityBot in your site's
robots.txt file.

`AICRAWL-PERPLEXITY-Perplexity-User` Perplexity-User supports user actions within Perplexity.
When users ask Perplexity a question, it might visit a web page to help provide an accurate
answer and include a link to the page in its response. It is not used for web crawling or to
collect content for training AI foundation models. **Since a user requested the fetch, this
fetcher generally ignores robots.txt rules.**

---

## How the auditor uses this

**Every one of these is ADVISORY, and blocking any of them is a legitimate choice.** The
auditor's job is to tell the licensee what their robots.txt is actually doing, not to tell them
what to want. There is a real difference between the two kinds of bot and the report must keep
it:

| Kind | Bots | What blocking it costs |
|---|---|---|
| **Search and answer** | `OAI-SearchBot`, `Claude-SearchBot`, `PerplexityBot` | The publisher's own stated consequence is reduced or no visibility in that assistant's answers. For an agent whose leads come from search, this is the one worth understanding |
| **Model training** | `GPTBot`, `ClaudeBot` | The publisher's own stated consequence is exclusion from training data. **Nothing about visibility.** Blocking these is a preference, and the auditor never reports it as a problem |
| **User-initiated fetch** | `ChatGPT-User`, `Claude-User`, `Perplexity-User` | Two of the three publishers state that robots.txt may not or generally does not apply to these. **So a robots.txt rule against them is not a reliable block**, and reporting one as effective would be wrong |

**Where robots.txt names no assistant at all**, as most agent sites do not, the `*` group
applies and the correct finding is a PASS with a note saying the outcome was inherited rather
than chosen. Silence is not consent, but it is also not a defect.

**These are vendor documents, not standards.** They can change the week after this file was
retrieved, and two of the three are help-centre articles rather than specifications. The
freshness script carries a canary for each. A finding citing them says "as documented on
`<date>`", because that is all anyone can honestly claim.
