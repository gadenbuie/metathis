test_that("meta_apple_itunes_app()", {
  expected <- '<meta name="apple-itunes-app" content="app-id=APP_ID,affiliate-data=AFFILIATE_ID,app-argument=SOME_TEXT"/>'
  tested <- meta_apple_itunes_app(
    app_id = "APP_ID",
    affiliate_id = "AFFILIATE_ID",
    `app-argument` = "SOME_TEXT"
  )

  expect_equal(tested %>% paste(), expected)

  expect_equal(
    meta_apple_itunes_app(),
    meta()
  )
})

describe("meta_apple_web_app()", {
  it("generally works", {
    expected <- c(
      '<meta name="apple-mobile-web-app-title" content="App Title"/>',
      '<meta name="apple-mobile-web-app-capable" content="yes"/>',
      '<meta name="apple-mobile-web-app-status-bar-style" content="black"/>'
    )

    expect_equal_meta(
      meta() %>% meta_apple_web_app(
        title = "App Title",
        capable = TRUE,
        status_bar_style = "black"
      ),
      expected
    )

    expect_equal_meta(
      meta() %>% meta_apple_web_app(capable = FALSE, status_bar_style = NULL),
      sub("yes", "no", expected[2], fixed = TRUE)
    )
  })

  it('errors when appropriate', {
    expect_error(meta_apple_web_app(status_bar_style = "white"))
    expect_error(meta_apple_web_app("a"))
  })
})
