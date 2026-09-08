# General structured data guidelines

**This file is the standard, not a summary of it.**

| | |
|---|---|
| Document | General structured data guidelines |
| Publisher | Google |
| Source | https://developers.google.com/search/docs/appearance/structured-data/sd-policies |
| Page last updated by publisher | 2026-07-10 UTC |
| Retrieved | 2026-09-03 |
| Licence | Creative Commons Attribution 4.0 (https://creativecommons.org/licenses/by/4.0/) |
| Scope of this file | The full page, verbatim, minus the two long JSON-LD nesting code samples, which are markup examples rather than requirements. Hyperlinks flattened to plain text. |

**Provision ID scheme.** `SD-GEN-<SECTION>-<n>`, for example `SD-GEN-CONTENT-4`. Every ID
appears in the provision index at the foot of this file, next to the sentence it names.

---

## The page, verbatim

To be eligible for rich result appearance in Google Search results, structured data shouldn't violate the
Content policies for Google Search
(which include our spam policies).
In addition, this page details the general guidelines that apply to all structured data: they
must be followed in order to be eligible for appearance as a rich result in Google Search.

If your page contains a structured data issue,
it can result in a manual action. A structured data manual action means that a page loses eligibility
for appearance as a rich result; it doesn't affect how the page ranks in Google web search.
To check if you have a manual action, open the
Manual Actions report in Search Console.

### Technical guidelines

You can test compliance with technical guidelines using the
Rich Results Test and the URL Inspection tool, which catch most technical errors.

#### Format

In order to be eligible for rich results, mark up your site's pages
using one of three supported formats:

- JSON-LD (recommended)
- Microdata
- RDFa

#### Access

Don't block your structured data pages to Googlebot using robots.txt, `noindex`,
or any other access control methods.

### Quality guidelines

These quality guidelines are not easily testable using an automated tool.
Violating a quality guideline can prevent syntactically correct structured data from being
displayed as a rich result in Google Search, or possibly cause it
to be marked as spam.

#### Content

- Follow the spam policies for Google web search.
- Provide up-to-date information. We won't show a rich result for time-sensitive
content that is no longer relevant.
- Provide original content that you or your users have generated.
- **Don't** mark up content that is not visible to readers of the page. For example, if the JSON-LD
markup describes a performer, the HTML body must describe that same performer.
- **Don't** mark up irrelevant or misleading content, such as fake reviews or content
unrelated to the focus of a page.
- **Don't** use structured data to deceive or mislead users. Don't impersonate any person or
organization, or misrepresent your ownership, affiliation, or primary purpose.
- Content in structured data must also follow the additional content guidelines or policies, as
documented in the specific feature guide. For example, content in `JobPosting`
structured data must follow the job posting content policies.

#### Relevance

Your structured data must be a true representation of the page content. Here
are some examples of irrelevant data:

- A sports live streaming site labeling broadcasts as local events.
- A woodworking site labeling instructions as recipes.

#### Completeness

- Specify all required properties listed in the documentation for your specific rich result type. Items that are missing required properties are not eligible for rich results.
- The more recommended properties that you provide, the higher quality the result is to
users. For example: users prefer job postings with explicitly stated
salaries than those without; users prefer recipes with actual user reviews and genuine
star ratings (note that reviews or ratings not by actual users may result in
manual action). Rich result
ranking takes extra information into consideration.

#### Location

- Put the structured data on the page that it describes, unless specified otherwise
by the documentation.
- If you have duplicate pages for the same content, we recommend placing the same structured
data on all page duplicates, not just on the canonical page.

#### Specificity

- Try to use the most specific applicable type and property names defined by schema.org
for your markup.
- Follow all additional guidelines given in the documentation for your specific rich result type.

#### Images

- When specifying an image as a structured data property, make sure that the image is relevant
to the page that it's on. For example, if you define the `image` property of `NewsArticle`,
the image must be relevant to that news article.
- All image URLs specified in structured data must be crawlable and indexable. Otherwise, Google Search can't find and
display them on the search results page. To check if Google can access your URLs, use
the URL Inspection tool.

#### Multiple items on a page

Multiple items on a page means that there is more than one kind of thing on a page. For
example, a page could contain a recipe, a video that shows how to make that recipe,
and breadcrumb information for how people can discover that recipe. All of this user-visible
information can also be marked up with structured data, which makes it easier for search engines
like Google Search to understand the information on a page. When you add more items that
apply to a page, Google Search has a fuller picture of what the page is about and can display
that page in different search features.

Google Search understands multiple items on a page, whether you nest the items
or specify each item individually:

- **Nesting**: When there is one main item, and additional items are grouped
under the main item. This is particularly helpful when grouping related items (for example,
a recipe with a video and reviews).
- **Individual items**: When each item is a separate block on the same page.

##### Additional tips

- To make sure that Google Search understands what the main purpose of the page is, include
the main type of structured data that reflects the main focus of the page. For example, if a
page is mainly about a recipe, make sure to include
Recipe structured data in addition to Video and
Review structured data. This is an opportunity for that
page to be eligible for multiple search appearances (recipe rich results, video search, and
review snippets). If the page only contained Video structured data, Google Search wouldn't know
enough about the page to also display it as a recipe rich result.
- To ensure that the page fully represents the content that's visible to users, make sure all
structured data items are complete. For example, if you include multiple reviews, make sure
that you include all of the reviews that are visible to people on the page. If a page didn't
mark up all of the reviews on a page, this would be misleading for people who expect to see
all of those reviews, based on the appearance of the page in Search results.

---

## Provision index

| ID | Provision, in the publisher's words |
|---|---|
| `SD-GEN-FORMAT-1` | "In order to be eligible for rich results, mark up your site's pages using one of three supported formats: JSON-LD (recommended), Microdata, RDFa" |
| `SD-GEN-ACCESS-1` | "Don't block your structured data pages to Googlebot using robots.txt, `noindex`, or any other access control methods." |
| `SD-GEN-CONTENT-1` | "Follow the spam policies for Google web search." |
| `SD-GEN-CONTENT-2` | "Provide up-to-date information." |
| `SD-GEN-CONTENT-3` | "Provide original content that you or your users have generated." |
| `SD-GEN-CONTENT-4` | "Don't mark up content that is not visible to readers of the page." |
| `SD-GEN-CONTENT-5` | "Don't mark up irrelevant or misleading content, such as fake reviews or content unrelated to the focus of a page." |
| `SD-GEN-CONTENT-6` | "Don't use structured data to deceive or mislead users. Don't impersonate any person or organization, or misrepresent your ownership, affiliation, or primary purpose." |
| `SD-GEN-RELEVANCE-1` | "Your structured data must be a true representation of the page content." |
| `SD-GEN-COMPLETENESS-1` | "Specify all required properties listed in the documentation for your specific rich result type. Items that are missing required properties are not eligible for rich results." |
| `SD-GEN-COMPLETENESS-2` | "The more recommended properties that you provide, the higher quality the result is to users." |
| `SD-GEN-LOCATION-1` | "Put the structured data on the page that it describes, unless specified otherwise by the documentation." |
| `SD-GEN-SPECIFICITY-1` | "Try to use the most specific applicable type and property names defined by schema.org for your markup." |
| `SD-GEN-IMAGES-1` | "make sure that the image is relevant to the page that it's on" |
| `SD-GEN-IMAGES-2` | "All image URLs specified in structured data must be crawlable and indexable." |

Google's stated consequence for failing these: loss of eligibility to appear as a rich
result, and in the case of a structured data issue, a possible manual action. That is why
this auditor grades a structured data failure as ELIGIBILITY, not BLOCKING. Google is
explicit that a structured data manual action "doesn't affect how the page ranks in Google
web search."
