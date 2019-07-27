describe("meta class", {

  it("has class meta", {
    expect_s3_class(meta(), "meta")
    expect_s3_class(meta(), "shiny.tag")
  })

  it("is_meta()", {
    expect_true(meta() %>% is_meta())
    expect_false(list() %>% is_meta())
  })

  it("as_meta()", {
    list(name = "theme-color") %>%
      as_meta() %>%
      expect_s3_class("meta")

    expect_error(as_meta(3), "numeric")
    expect_error(data.frame(a = 1, b = 2) %>% as_meta(), "data.frame")
  })

})
