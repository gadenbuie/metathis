test_that("meta_social()", expect_true(TRUE))

describe("meta_social()", {
  it("finds description if already set", {
    .meta <- meta() %>%
      meta_description("test description") %>%
      meta_social(
        twitter_card_type = NULL,
        og_type = NULL,
        og_locale = NULL
      )

    expect_true(sum(grepl("description", paste(.meta))) == 3)
  })

  it("uses first description if already set", {
    expect_warning(
      .meta <- meta() %>%
        meta_description("abcdefg123456") %>%
        meta_description("not used for social") %>%
        meta_social(
          twitter_card_type = NULL,
          og_type = NULL,
          og_locale = NULL
        )
    )

    expect_true(sum(grepl("abcdefg123456", paste(.meta))) == 3)
  })

  it("disables pinterest", {
    .meta <- meta() %>%
      meta_social(disable_pinterest = TRUE)

    expect_true(
      any(grepl("pinterest.+nopin", paste(.meta)))
    )
  })

  it("duplicates vector entries", {
    .meta <- meta() %>%
      meta_social(
        og_author = c("Apple", "Banana")
      ) %>%
      paste()

    expect_true(sum(grepl("article:author", .meta)) == 2)
    expect_true(sum(grepl("Apple", .meta)) == 1)
    expect_true(sum(grepl("Banana", .meta)) == 1)
  })
})
