# Spam policies for Google web search

**This file is the standard, not a summary of it.**

| | |
|---|---|
| Document | Spam policies for Google web search (part of Google Search Essentials) |
| Publisher | Google |
| Source | https://developers.google.com/search/docs/essentials/spam-policies |
| Page last updated by publisher | 2026-08-28 UTC |
| Retrieved | 2026-09-03 |
| Licence | Creative Commons Attribution 4.0 (https://creativecommons.org/licenses/by/4.0/) |
| Scope of this file | Every policy on the page, verbatim. The site reputation policy's worked examples and FAQ are summarised to a pointer rather than reproduced, because they concern publishers hosting third-party content and never apply to an agent's own website. Everything a finding in this auditor can cite is here in full. Hyperlinks flattened to plain text. |

**Provision ID scheme.** `SPAM-<SLUG>`, matching the publisher's own anchor names. For
example `SPAM-KEYWORD-STUFFING`, which is `#keyword-stuffing` on the source page.

---

## The page, verbatim

In the context of Google Search, spam refers to techniques used to deceive users or manipulate
our Search systems into featuring content prominently, such as attempting to manipulate Search
systems into ranking content highly or attempting to manipulate generative AI responses in Google
Search. Our spam policies help protect users and improve the
quality of Search results. To be eligible to appear in Google web search results, content (web pages, images, videos,
news content or other material that Google finds from across the web) shouldn't violate
Google Search's overall policies
or the spam policies listed on this page. These policies apply to all web search results,
including those from Google's own properties.

We detect policy-violating practices both through automated systems and, as needed,
human review that can result in a manual action.
**Sites that violate our policies may rank lower in results or not appear in results at all.**

Our policies cover common spam practices, but Google may act against any type of spam practices
we detect.

### `SPAM-CLOAKING` Cloaking

Cloaking refers to the practice of presenting different content to users and search engines
with the intent to manipulate search rankings and mislead users. Examples of cloaking include:

- Showing a page about travel destinations to search engines while showing a page about
discount drugs to users
- Inserting text or keywords into a page only when the user agent that is requesting the
page is a search engine, not a human visitor

If your site uses technologies that search engines have difficulty accessing, like JavaScript
or images, see our recommendations for making that content accessible to search engines and users without cloaking.

If a site is hacked, it's not uncommon for the hacker to use cloaking to make the hack harder
for the site owner to detect.

If you operate a paywall or a content-gating mechanism, we don't consider this to be cloaking
if Google can see the full content of what's behind the paywall just like any person who has
access to the gated material and if you follow our Flexible Sampling general guidance.

### `SPAM-DOORWAYS` Doorway abuse

Doorway abuse is when sites or pages are created to rank for specific, similar search queries. They lead
users to intermediate pages that aren't as useful as the final destination. Examples of
doorway abuse include:

- Having multiple websites with slight variations to the URL and home page to maximize their reach for any specific query
- Having multiple domain names or pages targeted at specific regions or cities that funnel users to one page
- Generating pages to funnel visitors into the actual usable or relevant portion of a site
- Creating substantially similar pages that are closer to search results than a clearly defined, browseable hierarchy

### `SPAM-EXPIRED-DOMAINS` Expired domain abuse

Expired domain abuse is where an expired domain name is purchased and repurposed primarily to
manipulate search rankings by hosting content that provides little to no value to users. Illustrative
examples include, but aren't limited to:

- Affiliate content on a site previously used by a government agency
- Commercial medical products being sold on a site previously used by a non-profit medical charity
- Casino-related content on a former elementary school site

### `SPAM-HACKED-CONTENT` Hacked content

Hacked content is any content placed on a site without permission, due to vulnerabilities in a
site's security. Hacked content gives poor search results to our users and can potentially
install malicious content on their machines. Examples of hacking include:

- **Code injection**: When hackers gain access to your website, they might try
to inject malicious code into existing pages on your site. This often takes the form of
malicious JavaScript injected directly into the site, or into iframes.
- **Page injection**: Sometimes, due to security flaws, hackers are able to add new
pages to your site that contain spammy or malicious content. These pages are often meant to
manipulate search engines or to attempt phishing.
Your existing pages might not show signs of hacking, but these newly-created pages could
harm your site's visitors or your site's performance in search results.
- **Content injection**: Hackers might also try to subtly manipulate existing pages on
your site. Their goal is to add content to your site that search engines can see but which
may be harder for you and your users to spot. This can involve adding hidden links or hidden text
to a page by using CSS or HTML, or it can involve more complex changes like cloaking.
- **Redirects**: Hackers might inject malicious code to your website that redirects some
users to harmful or spammy pages. The kind of redirect sometimes depends on the referrer,
user agent, or device. For example, clicking a URL in Google Search results could redirect
you to a suspicious page, but there is no redirect when you visit the same URL directly
from a browser.

### `SPAM-HIDDEN-TEXT` Hidden text and link abuse

Hidden text or link abuse is the practice of placing content on a page in a way solely to manipulate
search engines and not to be easily viewable by human visitors. Examples of hidden text or
link abuse include:

- Using white text on a white background
- Hiding text behind an image
- Using CSS to position text off-screen
- Setting the font size or opacity to 0
- Hiding a link by only linking one small character (for example, a hyphen in the middle of a paragraph)

There are many web design elements today that utilize showing and hiding content in a dynamic
way to improve user experience; these elements don't violate our policies:

- Accordion or tabbed content that toggle between hiding and showing additional content
- Slideshow or slider that cycles between several images or text paragraphs
- Tooltip or similar text that displays additional content when users interact with over an element
- Text that's only accessible to screen readers and is intended to improve the experience
for those using screen readers

### `SPAM-KEYWORD-STUFFING` Keyword stuffing

Keyword stuffing refers to the practice of filling a web page with keywords or numbers in an
attempt to manipulate rankings in Google Search results. Often these keywords appear in a list
or group, unnaturally, or out of context. Examples of keyword stuffing include:

- Lists of phone numbers without substantial added value
- Blocks of text that list cities and regions that a web page is trying to rank for
- Repeating the same words or phrases so often that it sounds unnatural. For example:

> Unlimited app store credit. There are so many sites that claim to offer app store
> credit for $0 but they're all fake and always mess up with users looking for unlimited app
> store credits. You can get limitless credits for app store right here on this website.
> Visit our unlimited app store credit page and get it today!

### `SPAM-LINK-SPAM` Link spam

Link spam is the practice of creating links to or from a site primarily for the purpose of
manipulating search rankings. The following are examples of link spam:

- Buying or selling links for ranking purposes. This includes:
  - Exchanging money for links, or posts that contain links
  - Exchanging goods or services for links
  - Sending someone a product in exchange for them writing about it and including a link
- Excessive link exchanges ("Link to me and I'll link to you") or partner pages exclusively for the sake of cross-linking
- Using automated programs or services to create links to your site
- Requiring a link as part of a Terms of Service, contract, or similar arrangement without
allowing a third-party content owner the choice of qualifying the outbound link
- Text advertisements or text links that don't block ranking credit
- Advertorials or native advertising where payment is received for articles that include
links that pass ranking credit, or links with optimized anchor text in articles, guest posts,
or press releases distributed on other sites
- Low-quality directory or bookmark site links
- Keyword-rich, hidden, or low-quality links embedded in widgets that are distributed across various sites
- Widely distributed links in the footers or templates of various sites
- Forum comments with optimized links in the post or signature
- Creating low-value content primarily for the purposes of manipulating linking and ranking signals

Google does understand that buying and selling links is a normal part of the economy of the
web for advertising and sponsorship purposes. It's not a violation of our policies to have
such links as long as they are qualified
with a `rel="nofollow"` or `rel="sponsored"` attribute value to the `<a>` tag.

### `SPAM-MACHINE-TRAFFIC` Machine-generated traffic

Machine-generated traffic (also called automated traffic)
refers to the practice of sending automated queries to Google. This includes scraping results for
rank-checking purposes or other types of automated access to Google Search conducted without
express permission. Machine-generated traffic consumes resources and interferes with our ability
to best serve users. Such activities violate our spam policies and the
Google Terms of Service.

### `SPAM-MALICIOUS` Malicious practices

Malicious practices create a mismatch between user expectations and the actual outcome, leading to
a negative and deceptive user experience, or compromised user security or privacy.

The following are common examples of malicious practices:

- Malware is any
software or mobile application specifically designed to harm a computer, a mobile device, the
software it's running, or its users. Malware exhibits malicious behavior that can include
installing software without user consent and installing harmful software such as viruses. Site
owners sometimes don't realize that their downloadable files are considered malware, so these
binaries might be hosted inadvertently.
- Unwanted software
is an executable file or mobile application that engages in behavior that is deceptive, unexpected,
or that negatively affects the user's browsing or computing experience. Examples include
software that switches your home page or other browser settings to ones you don't want, or
apps that leak private and personal information without proper disclosure.
- Back button hijacking is when a site interferes with user browser navigation by manipulating
the browser history or other functionalities, preventing them from using their back button to
immediately get back to the page they came from.

### `SPAM-MISLEADING-FUNCTIONALITY` Misleading functionality

Misleading functionality refers to the practice of intentionally creating sites that trick users
into thinking they would be able to access some content or services but in reality can't. Examples
of misleading functionality include:

- A site with a fake generator that claims to provide app store credit but doesn't actually provide the credit
- A site that claims to provide certain functionality (for example, PDF merge, countdown
timer, online dictionary service), but intentionally leads users to deceptive ads rather
than providing the claimed services

### `SPAM-SCALED-CONTENT` Scaled content abuse

Scaled content abuse is when many pages are generated for the primary purpose of manipulating
search rankings and not helping users. This abusive practice is typically focused on creating large
amounts of unoriginal content that provides little to no value to users, no matter how it's created.

Examples of scaled content abuse include, but aren't limited to:

- Using generative AI tools or other similar tools to generate many pages without adding value
for users
- Scraping feeds, search results, or other content to generate many pages (including through
automated transformations like synonymizing, translating, or other obfuscation techniques), where
little value is provided to users
- Stitching or combining content from different web pages without adding value
- Creating multiple sites with the intent of hiding the scaled nature of the content
- Creating many pages where the content makes little or no sense to a reader but contains search
keywords

If you're hosting such content on your site, exclude it from Search.

### `SPAM-SCRAPING` Scraping

Scraping refers to the practice of taking content from other sites, often through automated means,
and hosting it with the purpose of manipulating search rankings. Examples of abusive scraping include:

- Republishing content from other sites without adding any original content
or value, or even citing the original source
- Copying content from other sites, modify it only slightly (for example, by
substituting synonyms or using automated techniques), and republish it
- Reproducing content feeds from other sites without providing some type of unique
benefit to the user
- Creating sites dedicated to embedding or compiling content, such as videos, images, or other media
from other sites, without substantial added value to the user

### `SPAM-SITE-REPUTATION` Site reputation policy

The site reputation policy applies where third-party content is published on a host site mainly
because of that host's already-established ranking signals, which it has earned primarily from its
first-party content. The goal of this tactic is for the content to rank better than it could
otherwise on its own.

Having third-party content alone isn't inconsistent with the site reputation policy; it's only
inconsistent if the third-party content is published on a host site mainly because of that host
site's already-established ranking signals.

Examples inconsistent with the site reputation policy include, but aren't limited to:

- An educational site hosting a page about sponsored reviews of payday loans written by a
third-party that distributes the same page to other sites across the web
- A medical site hosting a low-quality, third-party advertising page about "best casinos" that
isn't integrated with the site, and that's being placed on the site to rank better due to the
established site's ranking signals

Examples that are **NOT** considered inconsistent with the site reputation policy include:

- Wire service or press release service sites
- News publications that have syndicated news content from other news publications
- Sites designed to allow user-generated content, such as a forum website or comment sections
- Columns, opinion pieces, articles, and other work of an editorial nature
- Third-party content (for example, "advertorial" or "native advertising" type pages) where the
purpose is to share content directly to readers (such as through promotion within the publication
itself), rather than hosting the content to manipulate search rankings
- Using affiliate links throughout a page, with links treated appropriately,
or embedding third-party ad units throughout a page

_The publisher's page continues with detailed review guidance, three worked examples, and an
FAQ about the European Economic Area. All of it concerns publishers hosting third-party
content and none of it applies to a real estate agent's own website, so it is not reproduced
here. Read it at the source URL above if a finding ever needs it._

### `SPAM-SNEAKY-REDIRECTS` Sneaky redirects

Redirecting is the act of sending a visitor to a different URL than the one they initially
requested. Sneaky redirecting is the practice of doing this maliciously in order to either show users and search
engines different content or show users unexpected content that doesn't fulfill their
original needs. Examples of sneaky redirects include:

- Showing search engines one type of content while redirecting users to something significantly
different
- Showing desktop users a normal page while redirecting mobile users to a completely
different spam domain

While sneaky redirection is a type of spam, there are many legitimate, non-spam reasons to
redirect one URL to another. Examples of legitimate redirects include:

- Moving your site to a new address
- Consolidating several pages into one
- Redirecting users to an internal page once they are logged in

When examining if a redirect is sneaky, consider whether or not the redirect is intended to
deceive either the users or search engines.

### `SPAM-THIN-AFFILIATION` Thin affiliation

Thin affiliation is the practice of publishing content with product affiliate links where the
product descriptions and reviews are copied directly from the original merchant without any
original content or added value.

Affiliate pages can be considered thin if they are a part of a program that distributes its
content across a network of affiliates without providing additional value. These sites often
appear to be cookie-cutter sites or templates with the same or similar content replicated
within the same site or across multiple domains or languages.

Not every site that participates in an affiliate program is a thin affiliate. Good affiliate
sites add value by offering meaningful content or features. Examples of good affiliate pages include offering
additional information about price, original product reviews, rigorous testing and ratings,
navigation of products or categories, and product comparisons.

### `SPAM-USER-GENERATED` User-generated spam

User-generated spam is spammy content added to a site by users through a channel intended
for user content. Often site owners are unaware of the spammy content. Examples of spammy
user-generated content include:

- Spammy accounts on hosting services that anyone can register for
- Spammy posts on forum threads
- Comment spam on blogs
- Spammy files uploaded to file hosting platforms

### `SPAM-SCAM-FRAUD` Scam and fraud

Scam and fraud come in many forms, including but not limited to impersonating an official
business or service through imposter sites, intentionally displaying false information about
a business or service, or otherwise attracting users to a site on false pretenses. Using
automated systems, Google seeks to identify pages with scammy or fraudulent content and
prevent them from showing up in Google Search results. Examples of online scams and fraud include:

- Impersonating a well-known business or service provider to trick users into paying money
to the wrong party
- Creating deceptive sites pretending to provide official customer support on behalf of a
legitimate business or provide fake contact information of such business

### `SPAM-POLICY-CIRCUMVENTION` Policy circumvention

If a site continues to engage in actions intended to bypass our spam policies or
content policies for Google Search,
we may take appropriate action which may include restricting or removing eligibility for
some of our search features (for example, Top Stories, Discover) and taking broader action in
Google Search (for example, removing more sections of a site from Search results). Circumvention
includes but isn't limited to:

- Using existing or creating new subdomains, subdirectories, or sites with the intention of
continuing to violate our policies
- Using other methods intended to continue distributing content or engaging in a behavior
that aims to violate our policies

---

## Why a spam finding is graded BLOCKING

Google's stated consequence, on this page: "Sites that violate our policies may rank lower in
results or not appear in results at all." Removal from results is the same outcome as failing
a technical requirement, so this auditor treats a confirmed spam policy violation as
BLOCKING.

## The four policies that matter most on a real estate agent's site

Named here as navigation, not as a new rule. The provisions themselves are above.

- `SPAM-KEYWORD-STUFFING`. Google's own example is "Blocks of text that list cities and regions that a web page is trying to rank for." Service-area footers on agent sites are frequently exactly this.
- `SPAM-DOORWAYS`. Google's own example is "Having multiple domain names or pages targeted at specific regions or cities that funnel users to one page." City landing pages that all funnel to one contact form are exactly this.
- `SPAM-SCALED-CONTENT`. Google's own example is "Using generative AI tools or other similar tools to generate many pages without adding value for users."
- `SPAM-SCRAPING`. Republishing IDX or MLS descriptions with no original content added.
