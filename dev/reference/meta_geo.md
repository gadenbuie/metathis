# Geotagging Metadata Tags

Geotagging Metadata Tags

## Usage

``` r
meta_geo(
  .meta = meta(),
  icbm = NULL,
  geo_position = NULL,
  geo_region = NULL,
  geo_placename = NULL,
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

- icbm:

  Latitude and longitude of geographic positions specified as
  `"lat, long"`. Can optionally be a length-two vector, i.e.
  `c(lat, long)`.

- geo_position:

  Latitude and longitude of geographic positions specified as
  `"lat;long"`. Can optionally be a length-two vector, i.e.
  `c(lat, long)`.

- geo_region:

  Name of the geographic region related to the page content, specified
  using [ISO-3166](https://en.wikipedia.org/wiki/ISO_3166) 2-character
  country code and 2-character national subdivision. Example: `"US-NY"`.

- geo_placename:

  Name of the geographic place related to the page content. Example:
  `"Atlanta, Georgia"`.

- ...:

  Additional geotagging metadata keyword and value pairs, such as
  `geo.country`, `geo.a1`, ..., `geo.a3`, etc. Underscores in the
  keyword will be converted to periods, so you can also specify
  `geo_country` in place of `geo.country`.

## Value

A `meta` object, or a set of `<meta>` HTML tags inside an HTML `<head>`
tag. For use in
[`rmarkdown::html_document()`](https://pkgs.rstudio.com/rmarkdown/reference/html_document.html),
[`shiny::runApp()`](https://rdrr.io/pkg/shiny/man/runApp.html), or other
HTML locations.

## References

[ICBM on
Wikipedia](https://en.wikipedia.org/wiki/ICBM_address#Modern_use),
[Geotagging on
Wikipedia](https://en.wikipedia.org/wiki/Geotagging#HTML_pages)

## See also

Other meta:
[`meta_apple_itunes_app()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_apple_itunes_app.md),
[`meta_apple_web_app()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_apple_web_app.md),
[`meta_general()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_general.md),
[`meta_google_scholar()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_google_scholar.md),
[`meta_name()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_name.md),
[`meta_social()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_social.md),
[`meta_tag()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_tag.md),
[`meta_viewport()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_viewport.md),
[`meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md)

## Examples

``` r
meta() %>%
  meta_geo(
    icbm = c(50.167958, -97.133185),
    geo_position = c(50.167958, -97.133185),
    geo_placename = "Manitoba, Canada",
    geo_region = "ca-mb"
  )
#> <meta name="ICBM" content="50.167958, -97.133185"/>
#> <meta name="geo.position" content="50.167958;-97.133185"/>
#> <meta name="geo.region" content="ca-mb"/>
#> <meta name="geo.placename" content="Manitoba, Canada"/>
```
