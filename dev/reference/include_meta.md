# Include Metadata Tags in HTML Document

Use `include_meta()` to explicitly declare the
[`meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md)
tags as an HTML dependency. In general, this is not required when
knitting to an HTML document. This function explicitly attaches an
[`htmltools::htmlDependency()`](https://rstudio.github.io/htmltools/reference/htmlDependency.html)
and may work in some unusual cases.

## Usage

``` r
include_meta(.meta)
```

## Arguments

- .meta:

  A `meta` object created by
  [`meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md)
  or
  [`as_meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md),
  or returned by a `meta_*()` object.

## Value

An
[`htmltools::htmlDependency()`](https://rstudio.github.io/htmltools/reference/htmlDependency.html)
containing the metadata tags to be included in the `<head>` of the HTML
document.

## See also

Other meta_actions:
[`write_meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/write_meta.md)

## Examples

``` r
meta() %>%
  meta_name("github-repo" = "gadenbuie/metathis") %>%
  include_meta()
#> 
```
