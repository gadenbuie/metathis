
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
  ) %>% 
  print()
#>   <meta name="viewport" content="width=device-width, initial-scale=1, orientation=auto"/>
#>   <meta name="description" content="This book will teach you how to do data science with R..."/>
#>   <meta name="generator" content="bookdown and GitBook 2.6.7"/>
#>   <meta name="github-repo" content="hadley/r4ds"/>
#>   <meta name="twitter:title" content="R for Data Science"/>
#>   <meta name="twitter:description" content="This book will teach you how to do data science with R..."/>
#>   <meta name="twitter:url" content="https://r4ds.had.co.nz"/>
#>   <meta name="twitter:image" content="https://r4ds.had.co.nz/cover.png"/>
#>   <meta name="twitter:image:alt" content="The cover of the R4DS book"/>
#>   <meta name="twitter:card" content="summary"/>
#>   <meta name="twitter:creator" content="@hadley"/>
#>   <meta name="twitter:site" content="@hadley"/>
#>   <meta name="og:title" content="R for Data Science"/>
#>   <meta name="og:description" content="This book will teach you how to do data science with R..."/>
#>   <meta name="og:url" content="https://r4ds.had.co.nz"/>
#>   <meta name="og:image" content="https://r4ds.had.co.nz/cover.png"/>
#>   <meta name="og:image:alt" content="The cover of the R4DS book"/>
#>   <meta name="og:type" content="book"/>
#>   <meta name="og:locale" content="en_US"/>
#>   <meta name="article:author" content="Garrett Grolemund"/>
#>   <meta name="article:author" content="Hadley Wickham"/>
```
