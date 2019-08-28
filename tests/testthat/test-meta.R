test_that("test-meta", expect_true(TRUE))

describe("meta class", {

  it("has class meta", {
    expect_s3_class(meta(), "meta")
    expect_s3_class(meta(), "shiny.tag.list")
  })

  it("is_meta()", {
    expect_true(meta() %>% is_meta())
    expect_false(list() %>% is_meta())
  })

  it("assert_is_meta", {
    expect_true(assert_is_meta(meta()))
    expect_error(asser_is_meta(list()))
  })

  it("as_meta()", {
    list(name = "theme-color") %>%
      as_meta() %>%
      expect_s3_class("meta")

    expect_error(as_meta(3), "numeric")
    expect_error(data.frame(a = 1, b = 2) %>% as_meta(), "data.frame")
  })

  it("print.meta", {
    expect_equal(capture.output(print(meta_tag(a = "a"))), '<meta a="a"/>')
  })
})

describe("meta_name()", {
  it("creates <meta> tags with name/content pairs", {
    exp <- '<meta name="github-repo" content="hadley/r4ds"/>'
    expect_equal_meta(meta_name("github-repo" = "hadley/r4ds"), exp)

    exp2 <- c(
      "<meta name=\"A\" content=\"a\"/>",
      "<meta name=\"B\" content=\"b\"/>"
    )
    expect_equal_meta(meta_name("A" = "a", "B" = "b"), exp2)
  })

  it("concatenates if length(content) > 1", {
    exp <- '<meta name="value" content="a b"/>'
    expect_equal_meta(meta_name(value = c("a", "b")), exp)
  })
})

describe("meta_tag()", {
  it("creates <meta> tags with attribute = value pairs", {
    exp <- '<meta A="a" B="b"/>'
    expect_equal_meta(meta_tag(A = "a", B = "b"), exp)
  })

  it("errors if length(value) > 1", {
    expect_error(meta_tag(A = c('a', 'b')))
  })
})
