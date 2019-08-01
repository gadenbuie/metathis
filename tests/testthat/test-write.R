describe("write_meta()", {

  it("writes to a file", {
    meta <- meta_tag(method = "test") %>% meta_viewport()
    tmp <- tempfile(fileext = ".html")
    write_meta(meta, tmp)
    expect_equal(readLines(tmp), as.character(meta))
  })

  it("appends to a file", {
    tmp <- tempfile(fileext = ".html")
    meta1 <- meta_tag(method = "first") %>% write_meta(tmp)
    meta2 <- meta_tag(method = "second") %>% write_meta(tmp, append = TRUE)
    expect_equal(
      readLines(tmp),
      c(as.character(meta1), as.character(meta2))
    )
  })

})
