
test_that("meta_description()", {
  expect_equal_meta(
    meta() %>% meta_description("A cool app"),
    '<meta name="description" content="A cool app"/>'
  )
})


test_that("meta_subject()", {
  expect_equal_meta(
    meta() %>% meta_subject("hot topics"),
    '<meta name="subject" content="hot topics"/>'
  )
})

test_that("meta_referrer()", {
  expect_equal_meta(
    meta() %>% meta_referrer("no-referrer"),
    '<meta name="referrer" content="no-referrer"/>'
  )
})

test_that("meta_robots()", {
  expect_equal_meta(
    meta() %>% meta_robots("nofollow"),
    '<meta name="robots" content="nofollow"/>'
  )
  expect_equal_meta(
    meta() %>% meta_robots(c("index", "follow")),
    '<meta name="robots" content="index,follow"/>'
  )
})

test_that("meta_theme_color()", {
  expect_equal_meta(
    meta() %>% meta_theme_color("#123456"),
    '<meta name="theme-color" content="#123456"/>'
  )
})

test_that("meta_general() errors appropriately", {
  expect_error(meta_general(1))
})
