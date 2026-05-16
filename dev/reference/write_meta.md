# Write Metadata Tags to a File

Write your metadata tags to an HTML file that can be manually included
in your page.

## Usage

``` r
write_meta(.meta, path = "meta.html", append = FALSE)
```

## Arguments

- .meta:

  A `meta` object created by
  [`meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md)
  or
  [`as_meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md),
  or returned by a `meta_*()` object.

- path:

  The file to write into, defaults to `"meta.html"`.

- append:

  logical. Only used if the argument `file` is the name of file (and not
  a connection or `"|cmd"`). If `TRUE` output will be appended to
  `file`; otherwise, it will overwrite the contents of `file`.

## Value

Returns `.meta` invisibly.

## See also

Other meta_actions:
[`include_meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/include_meta.md)

## Examples

``` r
meta_html_snippet <- tempfile("metathis_example", fileext = ".html")

meta() %>%
  meta_name("package" = "metathis") %>%
  write_meta(meta_html_snippet)

readLines(meta_html_snippet, warn = FALSE)
#> [1] "<meta name=\"package\" content=\"metathis\"/>"
```
