# Viewport Meta Tag

Create or add a viewport meta tag.

## Usage

``` r
meta_viewport(
  .meta = meta(),
  width = "device-width",
  initial_scale = "1",
  orientation = c("auto", "portrait", "landscape"),
  min_width = NULL,
  max_width = NULL,
  height = NULL,
  min_height = NULL,
  max_height = NULL,
  minimum_scale = NULL,
  maximum_scale = NULL,
  user_scalable = NULL,
  ...
)
```

## Arguments

- .meta:

  A `meta` object created by
  [`meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md)
  or
  [`as_meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md),
  or returned by a `meta_*()` object.

- width:

  Sets the width of initial viewport. `width` sets `min_width` and
  `max_width` and may contain two values; for example, the following are
  equivalent: `"300px 500px"` or `c("300px", "500px")`). The values may
  be a number with units, a percentage, or `"device-width"`. Pixels are
  assumed if no units are provided.

- initial_scale:

  Initial scale

- orientation:

  One of `"auto"`, `"portrait"`, `"landscape"`.

- min_width, max_width:

  Minimum and maximum initial viewport width. See `width` for more
  information. `width` is ignored if `min_width` or `max_width` are set.

- height, min_height, max_height:

  Sets height of initial viewport. Follows the same conventions as
  `width`, `min_width`, and `max_width`.

- minimum_scale:

  Minimum scale

- maximum_scale:

  Maximum scale

- user_scalable:

  User scalable

- ...:

  Additional name/value pairs

## Value

A `meta` object, or a set of `<meta>` HTML tags inside an HTML `<head>`
tag. For use in
[`rmarkdown::html_document()`](https://pkgs.rstudio.com/rmarkdown/reference/html_document.html),
[`shiny::runApp()`](https://rdrr.io/pkg/shiny/man/runApp.html), or other
HTML locations.

## References

[MDN: Viewport Meta
Tag](https://developer.mozilla.org/en-US/docs/Web/HTML/Viewport_meta_tag),

## See also

Other meta:
[`meta_apple_itunes_app()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_apple_itunes_app.md),
[`meta_apple_web_app()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_apple_web_app.md),
[`meta_general()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_general.md),
[`meta_geo()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_geo.md),
[`meta_google_scholar()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_google_scholar.md),
[`meta_name()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_name.md),
[`meta_social()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_social.md),
[`meta_tag()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_tag.md),
[`meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md)

## Examples

``` r
meta() %>%
  meta_viewport()
#> <meta name="viewport" content="width=device-width, initial-scale=1, orientation=auto"/>

meta() %>%
  meta_viewport(orientation = NULL)
#> <meta name="viewport" content="width=device-width, initial-scale=1"/>

meta() %>%
  meta_viewport(maximum_scale = 1)
#> <meta name="viewport" content="width=device-width, initial-scale=1, orientation=auto, maximum-scale=1"/>
```
