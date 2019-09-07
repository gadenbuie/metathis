with_dir <- function(path, x) {
  owd <- setwd(path)
  on.exit(setwd(owd))
  eval(substitute(x))
}

test_that("blogdown is guessed correctly", {
  blogdown_dir <- file.path(tempdir(), "blogdown", "content", "post")
  dir.create(blogdown_dir, recursive = TRUE)
  dir.create(file.path(blogdown_dir, "..", "..", "layouts"))
  dir.create(file.path(blogdown_dir, "..", "..", "static"))
  cat('', file = file.path(blogdown_dir, "..", "..", "config.toml"))


  blogdown_exp <- normalizePath(file.path(tempdir(), "blogdown"))
  expect_equal(find_config(blogdown_dir), blogdown_exp)

  with_dir(blogdown_dir, expect_true(guess_blogdown()))


  cat('baseURL = "/"', file = file.path(blogdown_dir, "..", "..", "config.toml"))
  expect_equal(find_config(blogdown_dir), blogdown_exp)
  with_dir(blogdown_dir, expect_true(guess_blogdown()))

  expect_null(find_config(tempdir()))
  with_dir(tempdir(), expect_false(guess_blogdown()))

  cat("", file = file.path(tempdir(), "config.toml"))
  with_dir(tempdir(), expect_false(guess_blogdown()))

  unlink(file.path(tempdir(), "blogdown"), recursive = TRUE)
})
