test_that("meta_apple_itunes_app()", {
  expected <- '<meta name="apple-itunes-app" content="app-id=APP_ID,affiliate-data=AFFILIATE_ID,app-argument=SOME_TEXT"/>'
  tested <- meta_apple_itunes_app(
    app_id = "APP_ID",
    affiliate_id = "AFFILIATE_ID",
    `app-argument` = "SOME_TEXT"
  )

  expect_equal(tested %>% paste(), expected)
})
