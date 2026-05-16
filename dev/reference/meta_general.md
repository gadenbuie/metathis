# General Metadata Tags

Generate metadata tags for general website properties.

## Usage

``` r
meta_general(
  .meta = meta(),
  application_name = NULL,
  theme_color = NULL,
  description = NULL,
  robots = NULL,
  generator = NULL,
  subject = NULL,
  rating = NULL,
  referrer = NULL
)

meta_description(.meta = meta(), description)

meta_subject(.meta = meta(), subject)

meta_referrer(.meta = meta(), referrer)

meta_robots(.meta = meta(), robots)

meta_theme_color(.meta = meta(), theme_color)
```

## Arguments

- .meta:

  A `meta` object created by
  [`meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md)
  or
  [`as_meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md),
  or returned by a `meta_*()` object.

- application_name:

  Name of web application (only should be used if the website is used as
  an app).

- theme_color:

  Theme Color for Chrome, Firefox OS and Opera, e.g. `"#00589a"`.

- description:

  Short description of the document (limit to 150 characters), This
  content *may* be used as a part of search engine results.

- robots:

  Control the behavior of search engine crawling and indexing, e.g.
  `"index,follow"`. Valid names are `"index"`, `"noindex"`, `"follow"`,
  `"nofollow"`. May be a vector or a single string with comma-separated
  values.

  See <https://www.robotstxt.org/meta.html> for more information.

- generator:

  Identify the software used to build the document (i.e. - WordPress,
  Dreamweaver).

- subject:

  Short description of your document's subject.

- rating:

  Gives a general age rating based on the document's content, e.g.
  `"General"`.

- referrer:

  Allows control over how referrer information is passed, .e.g.
  `"no-referrer"`. Valid values include `"no-referrer"`,
  `"no-referrer-when-downgrade"`, `"same-origin"`, `"origin"`,
  `"strict-origin"`, `"origin-when-cross-origin"`,
  `"strict-origin-when-cross-origin"`, or `"unsafe-url"`.

## Value

A `meta` object, or a set of `<meta>` HTML tags inside an HTML `<head>`
tag. For use in
[`rmarkdown::html_document()`](https://pkgs.rstudio.com/rmarkdown/reference/html_document.html),
[`shiny::runApp()`](https://rdrr.io/pkg/shiny/man/runApp.html), or other
HTML locations.

## See also

Other meta:
[`meta_apple_itunes_app()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_apple_itunes_app.md),
[`meta_apple_web_app()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_apple_web_app.md),
[`meta_geo()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_geo.md),
[`meta_google_scholar()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_google_scholar.md),
[`meta_name()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_name.md),
[`meta_social()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_social.md),
[`meta_tag()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_tag.md),
[`meta_viewport()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_viewport.md),
[`meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md)

## Examples

``` r
meta() %>%
  meta_general(
    application_name = "Application Name",
    theme_color = "#4285f4",
    description = "A description of this page",
    robots = "index,follow",
    generator = "R-Shiny",
    subject = "Awesome R projects",
    rating = "General",
    referrer = "no-referrer"
  )
#> <meta name="application-name" content="Application Name"/>
#> <meta name="theme-color" content="#4285f4"/>
#> <meta name="description" content="A description of this page"/>
#> <meta name="robots" content="index,follow"/>
#> <meta name="generator" content="R-Shiny"/>
#> <meta name="subject" content="Awesome R projects"/>
#> <meta name="rating" content="General"/>
#> <meta name="referrer" content="no-referrer"/>
```
