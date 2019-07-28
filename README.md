
<!-- README.md is generated from README.Rmd. Please edit that file -->

# htmlmeta

<!-- badges: start -->

<!-- badges: end -->

htmlmeta makes it easy to add HTML `<meta>` tags to your [R
Markdown](https://rmarkdown.rstudio.com) or
[blogdown](https://bookdown.org/yihui/blogdown) pages and
[Shiny](https://shiny.rstudio.com) apps.

## Installation

You can install the released version of htmlmeta from
[Github](https://github.com/gadenbuie/htmlmeta) with:

``` r
devtools::install_github("gadenbuie/htmlmeta")
```

## Example

This is a basic example that re-creates the metadata tags for the [R for
Data Science](https://r4ds.had.co.nz/) book.

``` r
library(htmlmeta)

meta() %>%
  meta_general(
    description = "This book will teach you how to do data science with R...",
    generator = "bookdown and GitBook 2.6.7"
  ) %>% 
  meta_name("github-repo" = "hadley/r4ds") %>% 
  meta_viewport() %>% 
  meta_social(
    title = "R for Data Science",
    url = "https://r4ds.had.co.nz",
    image = "https://r4ds.had.co.nz/cover.png",
    image_alt = "The cover of the R4DS book",
    og_type = "book",
    og_author = c("Garrett Grolemund", "Hadley Wickham"),
    twitter_card_type = "summary",
    twitter_creator = "@hadley"
  )
#> Warning in knit_print.meta(x, ...): knitr output format is not HTML. Use
#> `include_meta()` to ensure that the <meta> tags are properly included in
#> the <head> output (if possible).
```
