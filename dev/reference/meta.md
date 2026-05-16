# Initialize a List of HTML Metadata Tags

Initialize a *metathis* object (i.e. a list of HTML metadata tags), test
if an object is a *metathis* object, or coerce a list of `meta` tags to
be a *metathis* object.

## Usage

``` r
meta()

is_meta(x)

as_meta(x)
```

## Arguments

- x:

  A list or metathis object

## Value

A `meta` object, or a set of `<meta>` HTML tags inside an HTML `<head>`
tag. For use in
[`rmarkdown::html_document()`](https://pkgs.rstudio.com/rmarkdown/reference/html_document.html),
[`shiny::runApp()`](https://rdrr.io/pkg/shiny/man/runApp.html), or other
HTML locations.

## Functions

- `is_meta()`: Test if an objects is a *metathis* object

- `as_meta()`: Convert a list of meta tags into a *metathis* object.

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
[`meta_viewport()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_viewport.md)

## Examples

``` r
meta() %>%
  meta_viewport() %>%
  is_meta()
#> Warning: `prepend()` was deprecated in purrr 1.0.0.
#> ℹ Please use append(after = 0) instead.
#> ℹ The deprecated feature was likely used in the metathis package.
#>   Please report the issue at <https://github.com/gadenbuie/metathis/issues>.
#> [1] TRUE

list_of_meta_tags <- list(
  htmltools::tags$meta(github = "gadenbuie"),
  htmltools::tags$meta(twitter = "grrrck")
)

as_meta(list_of_meta_tags)
#> <meta github="gadenbuie"/>
#> <meta twitter="grrrck"/>
```
