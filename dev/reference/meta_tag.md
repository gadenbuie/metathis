# Create a metadata tag for attribute/value pairs

Creates a `<meta>` tag for attribute value pairs, where argument names
correspond to attribute names.

## Usage

``` r
meta_tag(.meta = meta(), ...)
```

## Arguments

- .meta:

  A `meta` object created by
  [`meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md)
  or
  [`as_meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md),
  or returned by a `meta_*()` object.

- ...:

  Attribute names and values as `attribute = value`. Values must be a
  single character string.

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
[`meta_general()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_general.md),
[`meta_geo()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_geo.md),
[`meta_google_scholar()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_google_scholar.md),
[`meta_name()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_name.md),
[`meta_social()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_social.md),
[`meta_viewport()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_viewport.md),
[`meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md)

## Examples

``` r
meta() %>%
  meta_tag(
    "http-equiv" = "Content-Security-Policy",
    content = "default-src 'self'"
  )
#> <meta http-equiv="Content-Security-Policy" content="default-src &#39;self&#39;"/>
```
