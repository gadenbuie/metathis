# Changelog

## metathis (development version)

## metathis 1.1.4

CRAN release: 2023-07-11

- Fixed a usage of numeric package version as requested by CRAN.

- Removed a link in the docs to the now-defunct Twitter Card validator.

## metathis 1.1.3

CRAN release: 2023-03-12

- Fix S3 method signatures to resolve recent CRAN warnings
  ([\#30](https://github.com/gadenbuie/metathis/issues/30)).

## metathis 1.1.2

CRAN release: 2022-08-11

- Fix link to `<meta>` tag docs on MDN
  ([@IndrajeetPatil](https://github.com/IndrajeetPatil),
  [\#25](https://github.com/gadenbuie/metathis/issues/25))

- Rebuild documentation for CRAN

## metathis 1.1.1

CRAN release: 2021-06-29

- Fixed an issue that caused metathis to fail for versions of rmarkdown
  \<= 2.8

## metathis 1.1.0

CRAN release: 2021-06-28

- Fixed an issue with the Twitter image `<meta>` tag (thanks
  [@llrs](https://github.com/llrs),
  [\#19](https://github.com/gadenbuie/metathis/issues/19)).

- Added
  [`meta_google_scholar()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_google_scholar.md)
  to help create the `<meta>` tags expected by [Google
  Scholar](https://scholar.google.com/intl/en/scholar/inclusion.html#indexing)
  ([\#5](https://github.com/gadenbuie/metathis/issues/5)).

- metathis no longer creates an empty folder in the directory where
  dependencies sourced via htmltools are saved when using
  non-stand-alone documents.

## metathis 1.0.3

CRAN release: 2020-09-10

- Fixed an issue with open graph social media `<meta>` tags
  ([\#10](https://github.com/gadenbuie/metathis/issues/10))

## metathis 1.0.2

CRAN release: 2020-03-01

*metathis* package released!
