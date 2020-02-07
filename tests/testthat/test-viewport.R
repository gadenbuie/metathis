# test_that()

describe("meta_viewport()", {
  default_viewport <- '<meta name="viewport" content="width=device-width, initial-scale=1, orientation=auto"/>'
  it("creates a viewport meta tag", {
    expect_equal_meta(meta_viewport(), default_viewport)
  })

  it("always comes first", {
    expect_equal_meta(
      meta() %>%
        meta_general(description = "defined first") %>%
        meta_viewport(),
      c(
        default_viewport,
        '<meta name="description" content="defined first"/>'
      )
    )
  })

  it("errors if everything is NULL", {
    expect_error(meta_viewport(meta(), NULL, NULL, NULL))
  })

  it("warns if too many width or height arguments are set", {
    expect_warning(meta_viewport(width = "100px", min_width = "100px"))
    expect_warning(meta_viewport(width = "100px", max_width = "100px"))
    expect_warning(meta_viewport(height = "100px", min_height = "100px"))
    expect_warning(meta_viewport(height = "100px", max_height = "100px"))
  })
})
