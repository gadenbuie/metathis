test_that("knit_print() and include_meta() work in Rmd", {
  skip_if_not(rmarkdown::pandoc_available("1.12.3"))

  temp_html <- tempfile("metathis-rmd", fileext = ".html")
  rmarkdown::render("rmd/test-metathis.Rmd", output_file = temp_html, quiet = TRUE)
  out <- readLines(temp_html)

  has_string <- function(str, n = 1L) {
    sum(grepl(str, out, fixed = TRUE)) == n
  }

  expect_true(has_string('<meta method="KNIT_PRINT" />'))
  expect_true(has_string('<meta method="knit_print(2)" />'))
  expect_true(has_string('<meta method="INCLUDE_META()" />'))
})
