# Social Media Metadata

Generate metadata tags for social media cards.

## Usage

``` r
meta_social(
  .meta = meta(),
  title = NULL,
  url = NULL,
  image = NULL,
  image_alt = NULL,
  image_width = NULL,
  image_height = NULL,
  description = NULL,
  twitter_card_type = c("summary", "summary_large_image", "app", "player"),
  twitter_creator = NULL,
  twitter_site = twitter_creator,
  og_type = "website",
  og_locale = "en_US",
  og_author = NULL,
  og_site_name = NULL,
  facebook_app_id = NULL,
  disable_pinterest = FALSE
)
```

## Arguments

- .meta:

  A `meta` object created by
  [`meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md)
  or
  [`as_meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md),
  or returned by a `meta_*()` object.

- title:

  Content title

- url:

  Content URL

- image:

  Image url for card.

- image_alt:

  A description of what's in the image (not a caption)

- image_width:

  The width of the image in pixels

- image_height:

  The height of the image in pixels

- description:

  Content description. If you have already used
  [`meta_general()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_general.md)
  to set the content's description, that description will automatically
  be used.

- twitter_card_type:

  One of `"summary"`, `"summary_large_image"`, `"app"`, or `"player"`.

- twitter_creator:

  `@username` for the content creator / author.

- twitter_site:

  ``` @username`` for the website used in the card footer.  ```twitter_creator\`
  is used by default.

- og_type:

  Open Graph card type, default is `"website"`. Other common options
  include `"article"`, `"book"`, or `"profile"`. The full list of valid
  options can be referenced at <https://ogp.me/>

- og_locale:

  The locale these tags are marked up in. Of the format
  `language_TERRITORY`. Default is `"en_US"`.

- og_author:

  Writers of the article. Multiple authors may be specified in a vector
  of character strings.

- og_site_name:

  The name of the site hosting the content

- facebook_app_id:

  The Facebook app ID. See the [Facebook Open Graph
  Markup](https://developers.facebook.com/docs/sharing/webmasters#markup)
  page for more information.

- disable_pinterest:

  If `TRUE`, adds a metadata tag disabling pins from your website. See
  the [Pinterest help
  center](https://help.pinterest.com/en/business/article/prevent-saves-to-pinterest-from-your-site)
  for more information.

## Value

A `meta` object, or a set of `<meta>` HTML tags inside an HTML `<head>`
tag. For use in
[`rmarkdown::html_document()`](https://pkgs.rstudio.com/rmarkdown/reference/html_document.html),
[`shiny::runApp()`](https://rdrr.io/pkg/shiny/man/runApp.html), or other
HTML locations.

## References

- [Open Graph](https://ogp.me/)

- [Google Structured Data Testing
  Tool](https://search.google.com/structured-data/testing-tool)

- [Facebook Sharing
  Debugger](https://developers.facebook.com/tools/debug/)

- [Twitter Card
  Documentation](https://developer.twitter.com/en/docs/twitter-for-websites/cards/guides/getting-started)

## See also

Other meta:
[`meta_apple_itunes_app()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_apple_itunes_app.md),
[`meta_apple_web_app()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_apple_web_app.md),
[`meta_general()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_general.md),
[`meta_geo()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_geo.md),
[`meta_google_scholar()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_google_scholar.md),
[`meta_name()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_name.md),
[`meta_tag()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_tag.md),
[`meta_viewport()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_viewport.md),
[`meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md)

## Examples

``` r
meta() %>%
  meta_social(
    title = "R for Data Science",
    description = "This book with teach you how to do data science with R",
    url = "https://r4ds.had.co.nz",
    image = "https://r4ds.had.co.nz/cover.png",
    image_alt = "The cover of the R4DS book",
    og_type = "book",
    og_author = c("Garrett Grolemund", "Hadley Wickham"),
    twitter_card_type = "summary",
    twitter_creator = "@hadley"
  )
#> <meta name="twitter:title" content="R for Data Science"/>
#> <meta name="twitter:description" content="This book with teach you how to do data science with R"/>
#> <meta name="twitter:url" content="https://r4ds.had.co.nz"/>
#> <meta name="twitter:image" content="https://r4ds.had.co.nz/cover.png"/>
#> <meta name="twitter:image:alt" content="The cover of the R4DS book"/>
#> <meta name="twitter:card" content="summary"/>
#> <meta name="twitter:creator" content="@hadley"/>
#> <meta name="twitter:site" content="@hadley"/>
#> <meta property="og:title" content="R for Data Science"/>
#> <meta property="og:description" content="This book with teach you how to do data science with R"/>
#> <meta property="og:url" content="https://r4ds.had.co.nz"/>
#> <meta property="og:image" content="https://r4ds.had.co.nz/cover.png"/>
#> <meta property="og:image:alt" content="The cover of the R4DS book"/>
#> <meta property="og:type" content="book"/>
#> <meta property="og:locale" content="en_US"/>
#> <meta property="article:author" content="Garrett Grolemund"/>
#> <meta property="article:author" content="Hadley Wickham"/>
```
