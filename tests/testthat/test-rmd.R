test_that("knit_print() and include_meta() work in Rmd", {
  skip_if_not(rmarkdown::pandoc_available("1.12.3"))

  temp_html <- tempfile("metathis-rmd", fileext = ".html")
  test_rmd <- test_path("rmd", "test-metathis.Rmd")
  rmarkdown::render(test_rmd, output_file = temp_html, quiet = TRUE)
  out <- readLines(temp_html)

  has_string <- function(str, n = 1L) {
    sum(grepl(str, out, fixed = TRUE)) == n
  }

  expect_true(has_string('<meta method="KNIT_PRINT" />'))
  expect_true(has_string('<meta method="knit_print(2)" />'))
  expect_true(has_string('<meta method="INCLUDE_META()" />'))
})

test_that("Doesn't create empty directory for non self-contained RMarkdown", {
  skip_if_not(rmarkdown::pandoc_available("1.12.3"))

  temp_dir <- tempfile("metathis-rmd")
  dir.create(temp_dir)
  on.exit(unlink(temp_dir))

  test_rmd_src <- test_path("rmd", "test-not-self-contained.Rmd")
  test_rmd <- file.path(temp_dir, "test.Rmd")
  file.copy(test_rmd_src, test_rmd)
  expect_silent(rmarkdown::render(test_rmd, quiet = TRUE))
  out <- readLines(file.path(temp_dir, "test.html"))

  has_string <- function(str, n = 1L) {
    sum(grepl(str, out, fixed = FALSE)) == n
  }

  skip_if_not(has_package_version("rmarkdown", "2.9"))
  expect_true(has_string('<meta method="KNIT_PRINT" ?/?>'))
  expect_true(has_string('<meta method="knit_print\\(2\\)" ?/?>'))
  expect_true(has_string('<meta method="INCLUDE_META\\(\\)" ?/?>'))

  out_files <- dir(file.path(temp_dir, "test_files"))
  expect_false(any(grepl("^metathis", out_files)))
})
