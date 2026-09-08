# Local business (`LocalBusiness`) structured data

**This file is the standard, not a summary of it.**

| | |
|---|---|
| Document | Local business (`LocalBusiness`) structured data |
| Publisher | Google |
| Source | https://developers.google.com/search/docs/appearance/structured-data/local-business |
| Page last updated by publisher | 2025-12-10 UTC |
| Retrieved | 2026-09-03 |
| Licence | Creative Commons Attribution 4.0 (https://creativecommons.org/licenses/by/4.0/) |
| Scope of this file | The Guidelines section and the `LocalBusiness` property tables, verbatim. The long JSON-LD examples and the Restaurant carousel section are not reproduced: the carousel is limited to a small set of restaurant providers and never applies to a real estate agent's site. Hyperlinks flattened to plain text. |

**Why this type.** `RealEstateAgent` is a schema.org subtype of `LocalBusiness`, so Google's
`LocalBusiness` required and recommended properties are the ones that apply to a real estate
agent's site. Google's own instruction on the page: "Use the most specific `LocalBusiness`
sub-type possible."

**Provision ID scheme.** `SD-LB-REQ-<property>` for a required property,
`SD-LB-REC-<property>` for a recommended one, `SD-LB-GUIDE-<n>` for the guidelines list.

---

## Guidelines, verbatim

You must follow these guidelines to be eligible to appear in Local Business rich results.

- Search Essentials
- General structured data guidelines
- Carousel guidelines (if applicable). The
Restaurant carousel is currently limited to a small set of restaurant providers.

## Structured data type definitions, verbatim

The following tables list properties and usage for local business and business
action types, based on the full definitions at schema.org/LocalBusiness.

You must include the required properties for your content to be eligible for display as a rich result.
You can also include the recommended properties to add more information about your content,
which could provide a better user experience.

You can add `LocalBusiness` structured data to any page on your
site, though it may make more sense to put it on a page that contains information about your
business.

### `LocalBusiness`

The full definition of `LocalBusiness` is available at
schema.org/LocalBusiness. Define each local
business location as a `LocalBusiness` type. Use
the most specific `LocalBusiness` sub-type possible; for example,
`Restaurant`, `DaySpa`, `HealthClub`, and so on.

If you have multiple types, specify them as an array (`additionalType` isn't
supported).

The Google-supported properties are the following:

#### Required properties

| Property | Type and definition, verbatim |
|---|---|
| `address` | `PostalAddress`. The physical location of the business. Include as many properties as possible. The more properties you provide, the higher quality the result is to users. |
| `name` | `Text`. The name of the business. |

#### Recommended properties

| Property | Type and definition, verbatim |
|---|---|
| `aggregateRating` | `AggregateRating`. **This property is only recommended for sites that capture reviews about other local businesses**: The average rating of the local business based on multiple ratings or reviews. Follow the Review snippet guidelines and the list of required and recommended aggregate rating properties. |
| `department` | `LocalBusiness`. A nested item for a single department. You can define any of the properties in this table for a department. |
| `geo` | `GeoCoordinates`. Geographic coordinates of the business. |
| `geo.latitude` | `Number`. The latitude of the business location. The precision must be at least 5 decimal places. |
| `geo.longitude` | `Number`. The longitude of the business location. The precision must be at least 5 decimal places. |
| `menu` | `URL`. For food establishments, the fully-qualified URL of the menu. |
| `openingHoursSpecification` | Array or single object (both supported) of `OpeningHoursSpecification`. Hours during which the business location is open. |
| `openingHoursSpecification.closes` | `Time`. The time the business location closes, in hh:mm:ss format. |
| `openingHoursSpecification.dayOfWeek` | `DayOfWeek`. One or more of the following values: `https://schema.org/Monday` through `https://schema.org/Sunday`. |
| `openingHoursSpecification.opens` | `Time`. The time the business location opens, in hh:mm:ss format. |
| `openingHoursSpecification.validFrom` | `Date`. The start date of a seasonal business closure, in YYYY-MM-DD format. |
| `openingHoursSpecification.validThrough` | `Date`. The end date of a seasonal business closure, in YYYY-MM-DD format. |
| `priceRange` | `Text`. The relative price range of a business, commonly specified by either a numerical range (for example, "$10-15") or a normalized number of currency signs (for example, "$$$"). This field must be shorter than 100 characters. If it's 100 characters or longer, Google won't show a price range for the business. |
| `review` | `Review`. **This property is only recommended for sites that capture reviews about other local businesses**: A review of the local business. Follow the Review snippet guidelines and the list of required and recommended review properties. |
| `servesCuisine` | `servesCuisine`. The type of cuisine the restaurant serves. |
| `telephone` | `Text`. A business phone number meant to be the primary contact method for customers. Be sure to include the country code and area code in the phone number. |
| `url` | `URL`. The fully-qualified URL of the specific business location. The URL must be a working link. |

---

## Provision index

| ID | Provision |
|---|---|
| `SD-LB-REQ-name` | `name` is a required property. Missing it makes the item ineligible for a rich result, per `SD-GEN-COMPLETENESS-1`. |
| `SD-LB-REQ-address` | `address` is a required property. Missing it makes the item ineligible for a rich result, per `SD-GEN-COMPLETENESS-1`. |
| `SD-LB-REC-telephone` | `telephone` is a recommended property. |
| `SD-LB-REC-url` | `url` is a recommended property, and "The URL must be a working link." |
| `SD-LB-REC-geo` | `geo`, `geo.latitude` and `geo.longitude` are recommended. Precision "must be at least 5 decimal places." |
| `SD-LB-REC-openingHoursSpecification` | `openingHoursSpecification` is a recommended property. |
| `SD-LB-REC-priceRange` | `priceRange` is recommended and "must be shorter than 100 characters." |
| `SD-LB-REC-aggregateRating` | `aggregateRating` is recommended **only for sites that capture reviews about other local businesses**. |
| `SD-LB-REC-review` | `review` is recommended **only for sites that capture reviews about other local businesses**. |
| `SD-LB-GUIDE-1` | "You must follow these guidelines to be eligible to appear in Local Business rich results": Search Essentials, and the general structured data guidelines. |
| `SD-LB-SUBTYPE` | "Use the most specific `LocalBusiness` sub-type possible." |

**A trap this auditor is built to catch.** `aggregateRating` and `review` on `LocalBusiness`
are recommended **only for sites that capture reviews about other local businesses**. Google
states that qualifier twice, in bold, in its own property table above. An agent's own website
marking up its own star rating is not that case. A finding here cites
`SD-LB-REC-aggregateRating` together with `SD-GEN-CONTENT-5`.
