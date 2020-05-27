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

  it("uses property for og:<x> tags", {
    x <- meta_social(
      title = "R for Data Science",
      description = "This book with teach you how to do data science with R",
      url = "https://r4ds.had.co.nz",
      image = "https://r4ds.had.co.nz/cover.png",
      image_alt = "The cover of the R4DS book",
      og_type = "book",
      og_author = c("Garrett Grolemund", "Hadley Wickham"),
      twitter_card_type = "summary",
      twitter_creator = "@hadley"
    ) %>%
      as.character()

    x_og <- grep("og:", x, value = TRUE)
    expect_equal(sum(grepl("property=\"og:", x_og)), length(x_og))
  })
})
