test_that("meta_google_scholar()", {
  expected <- '<meta name="citation_title" content="The testis isoform of the phosphorylase kinase catalytic subunit (PhK-T) plays a critical role in regulation of glycogen mobilization in developing lung">
<meta name="citation_author" content="Liu, Li">
<meta name="citation_author" content="Rannels, Stephen R.">
<meta name="citation_author" content="Falconieri, Mary">
<meta name="citation_author" content="Phillips, Karen S.">
<meta name="citation_author" content="Wolpert, Ellen B.">
<meta name="citation_author" content="Weaver, Timothy E.">
<meta name="citation_publication_date" content="1996/05/17">
<meta name="citation_journal_title" content="Journal of Biological Chemistry">
<meta name="citation_volume" content="271">
<meta name="citation_issue" content="20">
<meta name="citation_firstpage" content="11761">
<meta name="citation_lastpage" content="11766">
<meta name="citation_pdf_url" content="http://www.example.com/content/271/20/11761.full.pdf">'

  meta <- meta_google_scholar(
    title = c(
      "The testis isoform of the phosphorylase kinase catalytic subunit (PhK-T)",
      "plays a critical role in regulation of glycogen mobilization in developing lung"
    ),
    author = c(
      "Liu, Li",
      "Rannels, Stephen R.",
      "Falconieri, Mary",
      "Phillips, Karen S.",
      "Wolpert, Ellen B.",
      "Weaver, Timothy E."
    ),
    publication_date = "1996/05/17",
    journal_title = "Journal of Biological Chemistry",
    volume = 271,
    issue = 20,
    firstpage = 11761,
    lastpage = 11766,
    pdf_url = "http://www.example.com/content/271/20/11761.full.pdf"
  )

  meta_chr <- gsub("/>", ">", format(meta))
  expect_equal(meta_chr, expected)
})

test_that("meta_google_scholar() catches common errors", {
  expect_error(meta_google_scholar(title = "foo"))
  expect_error(meta_google_scholar(title = "a", author = "b", publication_date = "2019-01-01"))
  expect_error(meta_google_scholar(title = "a", author = "b", publication_date = 2000, online_date = "1/1/2021"))
})
