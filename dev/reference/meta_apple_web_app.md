# Apple Web App Meta Tags

Apple Web App Meta Tags

## Usage

``` r
meta_apple_web_app(
  .meta = meta(),
  title = NULL,
  capable = NULL,
  status_bar_style = c("default", "black", "black-translucent")
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

  Launch Icon Title

- capable:

  Enables standalone (full-screen) mode if TRUE

- status_bar_style:

  Status bar appearance. has no effect unless standalone more is enabled
  (see `capable`).

  "If content is set to default, the status bar appears normal. If set
  to black, the status bar has a black background. If set to
  black-translucent, the status bar is black and translucent. If set to
  default or black, the web content is displayed below the status bar.
  If set to black-translucent, the web content is displayed on the
  entire screen, partially obscured by the status bar. The default value
  is default."

## Value

A `meta` object, or a set of `<meta>` HTML tags inside an HTML `<head>`
tag. For use in
[`rmarkdown::html_document()`](https://pkgs.rstudio.com/rmarkdown/reference/html_document.html),
[`shiny::runApp()`](https://rdrr.io/pkg/shiny/man/runApp.html), or other
HTML locations.

## References

<https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariHTMLRef/Articles/MetaTags.html>

## See also

Other meta:
[`meta_apple_itunes_app()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_apple_itunes_app.md),
[`meta_general()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_general.md),
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
  meta_apple_web_app(
    title = "My Fancy App",
    capable = TRUE,
    status_bar_style = "black-translucent"
  )
#> <meta name="apple-mobile-web-app-title" content="My Fancy App"/>
#> <meta name="apple-mobile-web-app-capable" content="yes"/>
#> <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
```
