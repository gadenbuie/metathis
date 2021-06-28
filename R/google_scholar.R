#' Add Google Scholar Metadata
#'
#' Add biobliographic metadata to pages in the format expected by Google
#' Scholar. Please reference the
#' [Google Scholar Inclusion](https://scholar.google.com/intl/en/scholar/inclusion.html#indexing)
#' page for the most up-to-date information and instructions. Note that this
#' function adds the `citation_` prefix to all of its arguments; the `title`
#' argument becomes the `citation_title` `<meta>` tag.
#'
#' @examples
#' meta_google_scholar(
#'   title = c(
#'     "The testis isoform of the phosphorylase kinase catalytic subunit (PhK-T)",
#'     "plays a critical role in regulation of glycogen mobilization in developing lung"
#'   ),
#'   author = c(
#'     "Liu, Li",
#'     "Rannels, Stephen R.",
#'     "Falconieri, Mary",
#'     "Phillips, Karen S.",
#'     "Wolpert, Ellen B.",
#'     "Weaver, Timothy E."
#'   ),
#'   publication_date = "1996/05/17",
#'   journal_title = "Journal of Biological Chemistry",
#'   volume = 271,
#'   issue = 20,
#'   firstpage = 11761,
#'   lastpage = 11766,
#'   pdf_url = "http://www.example.com/content/271/20/11761.full.pdf"
#' )
#'
#' @template describe-meta
#' @param title The title of the paper.
#'
#'   The title tag must contain the title of the paper. Don't use it for the
#'   title of the journal or a book in which the paper was published, or for the
#'   name of your repository. This tag is required for inclusion in Google
#'   Scholar.
#' @param author A vector of author names.
#'
#'   The `author` tag, must contain the authors (and only the actual authors) of
#'   the paper. Don't use it for the author of the website or for contributors
#'   other than authors, e.g., thesis advisors. Author names can be listed
#'   either as "Smith, John" or as "John Smith". Put each author name in a
#'   separate tag and omit all affiliations, degrees, certifications, etc., from
#'   this field. At least one author tag is required for inclusion in Google
#'   Scholar.
#' @param publication_date The date the paper was published.
#'
#'   The `publication_date` tag must contain the date of publication, i.e., the
#'   date that would normally be cited in references to this paper from other
#'   papers. Don't use it for the date of entry into the repository - that
#'   should go into `online_date` instead. Provide full dates in the "2010/5/12"
#'   format if available; or a year alone otherwise. This tag is required for
#'   inclusion in Google Scholar.
#'
#' @param journal_title,conference_title,issn,isbn,volumn,issue,firstpage,lastpage
#'   For journal and conference papers, provide the remaining bibliographic
#'   citation data in the following tags: `journal_title` or `conference_title`,
#'   `issn`, `isbn`, `volume`, `issue`, `firstpage`, and `lastpage.` These
#'   fields must contain sufficient information to identify a reference to this
#'   paper from another document, which is normally all of: (a) journal or
#'   conference name, (b) volume and issue numbers, if applicable, and (c) the
#'   number of the first page of the paper in the volume (or issue) in question.
#'
#' @param dissertation_institution,technical_report_institution,technical_report_number
#'   For theses, dissertations, and technical reports, provide the remaining
#'   bibliographic citation data in the following tags:
#'   `dissertation_institution`, `technical_report_institution` for the name of
#'   the institution and `technical_report_number` for the number of the
#'   technical report. As with journal and conference papers, you need to
#'   provide sufficient information to recognize a formal citation to this
#'   document from another article.
#'
#' @param pdf_url The `<meta>` tags normally apply only to the exact page on
#'   which they're provided. If this page shows only the abstract of the paper
#'   and you have the full text in a separate file, e.g., in the PDF format,
#'   please specify the locations of all full text versions using `pdf_url`. The
#'   content of the tag is the absolute URL of the PDF file; for security
#'   reasons, it must refer to a file in the same subdirectory as the HTML
#'   abstract.
#'
#' @template describe-meta-return
#'
#' @references <https://scholar.google.com/intl/en/scholar/inclusion.html#indexing>
#' @export
meta_google_scholar <- function(
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
  dissertation_intitution = NULL,
  technical_report_institution = NULL,
  technical_report_number = NULL
) {
  assert_is_meta(.meta)

  assert_valid_google_scholar_date(publication_date)
  assert_valid_google_scholar_date(online_date)

  scholar <- list(
    title            = title,
    publication_date = publication_date,
    online_date      = online_date,
    journal_title    = journal_title,
    conference_title = conference_title,
    volume           = volume,
    issue            = issue,
    firstpage        = firstpage,
    lastpage         = lastpage,
    pdf_url          = pdf_url,
    issn             = issn,
    isbn             = isbn,
    dissertation_intitution      = dissertation_intitution,
    technical_report_institution = technical_report_institution,
    technical_report_number      = technical_report_number
  )
  names(scholar) <- paste0("citation_", names(scholar))

  for (aut in rev(author)) {
    scholar <- purrr::prepend(scholar, list(citation_author = aut))
  }
  idx_title <- which(names(scholar) == "citation_title")
  scholar <- c(scholar[idx_title], scholar[-idx_title])

  meta_scholar <-
    scholar %>%
    purrr::compact() %>%
    collapse_single_string() %>%
    purrr::imap(~ tag_meta(name = .y, content = .x)) %>%
    unname()

  append_to_meta(.meta, meta_scholar)
}

assert_valid_google_scholar_date <- function(x) {
  if (is.null(x)) return()
  x_name <- deparse(substitute(x))
  x <- as.character(x)

  if (length(x) > 1) {
    stop("`", x_name, "` must be a single value.", call. = FALSE)
  }

  valid_date_fmt <- "^\\d{4}(/\\d{1,2}/\\d{1,2})?$"

  if (!grepl(valid_date_fmt, x)) {
    stop("`", x_name, "` must be in YYYY or YYYY/MM/DD format.", call. = FALSE)
  }
}
