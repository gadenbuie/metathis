# Add Google Scholar Metadata

Add bibliographic metadata to pages in the format expected by Google
Scholar. Please reference the [Google Scholar
Inclusion](https://scholar.google.com/intl/en/scholar/inclusion.html#indexing)
page for the most up-to-date information and instructions. Note that
this function adds the `citation_` prefix to all of its arguments; the
`title` argument becomes the `citation_title` `<meta>` tag.

## Usage

``` r
meta_google_scholar(
  .meta = meta(),
  title,
  author,
  publication_date,
  online_date = NULL,
  journal_title = NULL,
  conference_title = NULL,
  volume = NULL,
  issue = NULL,
  firstpage = NULL,
  lastpage = NULL,
  pdf_url = NULL,
  issn = NULL,
  isbn = NULL,
  dissertation_institution = NULL,
  technical_report_institution = NULL,
  technical_report_number = NULL
)
```

## Arguments

- .meta:

  A `meta` object created by
  [`meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md)
  or
  [`as_meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md),
  or returned by a `meta_*()` object.

- title:

  The title of the paper.

  The title tag must contain the title of the paper. Don't use it for
  the title of the journal or a book in which the paper was published,
  or for the name of your repository. This tag is required for inclusion
  in Google Scholar.

- author:

  A vector of author names.

  The `author` tag, must contain the authors (and only the actual
  authors) of the paper. Don't use it for the author of the website or
  for contributors other than authors, e.g., thesis advisors. Author
  names can be listed either as "Smith, John" or as "John Smith". Put
  each author name in a separate tag and omit all affiliations, degrees,
  certifications, etc., from this field. At least one author tag is
  required for inclusion in Google Scholar.

- publication_date, online_date:

  The date the paper was published in the journal (`publication_date`)
  or published online (`online_date`).

  The `publication_date` tag must contain the date of publication, i.e.,
  the date that would normally be cited in references to this paper from
  other papers. Don't use it for the date of entry into the repository -
  that should go into `online_date` instead. Provide full dates in the
  "2010/5/12" format if available; or a year alone otherwise. This tag
  is required for inclusion in Google Scholar.

- journal_title, conference_title, issn, isbn, volume, issue, firstpage,
  lastpage:

  For journal and conference papers, provide the remaining bibliographic
  citation data in the following tags: `journal_title` or
  `conference_title`, `issn`, `isbn`, `volume`, `issue`, `firstpage`,
  and `lastpage.` These fields must contain sufficient information to
  identify a reference to this paper from another document, which is
  normally all of: (a) journal or conference name, (b) volume and issue
  numbers, if applicable, and (c) the number of the first page of the
  paper in the volume (or issue) in question.

- pdf_url:

  The `<meta>` tags normally apply only to the exact page on which
  they're provided. If this page shows only the abstract of the paper
  and you have the full text in a separate file, e.g., in the PDF
  format, please specify the locations of all full text versions using
  `pdf_url`. The content of the tag is the absolute URL of the PDF file;
  for security reasons, it must refer to a file in the same subdirectory
  as the HTML abstract.

- dissertation_institution, technical_report_institution,
  technical_report_number:

  For theses, dissertations, and technical reports, provide the
  remaining bibliographic citation data in the following tags:
  `dissertation_institution`, `technical_report_institution` for the
  name of the institution and `technical_report_number` for the number
  of the technical report. As with journal and conference papers, you
  need to provide sufficient information to recognize a formal citation
  to this document from another article.

## Value

A `meta` object, or a set of `<meta>` HTML tags inside an HTML `<head>`
tag. For use in
[`rmarkdown::html_document()`](https://pkgs.rstudio.com/rmarkdown/reference/html_document.html),
[`shiny::runApp()`](https://rdrr.io/pkg/shiny/man/runApp.html), or other
HTML locations.

## References

<https://scholar.google.com/intl/en/scholar/inclusion.html#indexing>

## See also

Other meta:
[`meta_apple_itunes_app()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_apple_itunes_app.md),
[`meta_apple_web_app()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_apple_web_app.md),
[`meta_general()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_general.md),
[`meta_geo()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_geo.md),
[`meta_name()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_name.md),
[`meta_social()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_social.md),
[`meta_tag()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_tag.md),
[`meta_viewport()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta_viewport.md),
[`meta()`](https://pkg.garrickadenbuie.com/metathis/dev/reference/meta.md)

## Examples

``` r
meta_google_scholar(
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
#> <meta name="citation_title" content="The testis isoform of the phosphorylase kinase catalytic subunit (PhK-T) plays a critical role in regulation of glycogen mobilization in developing lung"/>
#> <meta name="citation_author" content="Liu, Li"/>
#> <meta name="citation_author" content="Rannels, Stephen R."/>
#> <meta name="citation_author" content="Falconieri, Mary"/>
#> <meta name="citation_author" content="Phillips, Karen S."/>
#> <meta name="citation_author" content="Wolpert, Ellen B."/>
#> <meta name="citation_author" content="Weaver, Timothy E."/>
#> <meta name="citation_publication_date" content="1996/05/17"/>
#> <meta name="citation_journal_title" content="Journal of Biological Chemistry"/>
#> <meta name="citation_volume" content="271"/>
#> <meta name="citation_issue" content="20"/>
#> <meta name="citation_firstpage" content="11761"/>
#> <meta name="citation_lastpage" content="11766"/>
#> <meta name="citation_pdf_url" content="http://www.example.com/content/271/20/11761.full.pdf"/>
```
