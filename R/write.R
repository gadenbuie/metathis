#' Write Metadata Tags to a File
#'
#' Write your metadata tags to an HTML file that can be manually included in
#' your page.
#'
#' @template describe-meta
#' @param path The file to write into, defaults to `"meta.html"`.
#' @inheritParams base::cat
#'
#' @return Returns `.meta` invisibly.
#'
#' @family meta_actions
#'
#' @examples
#' meta_html_snippet <- tempfile("metathis_example", fileext = ".html")
#'
#' meta() %>%
#'   meta_name("package" = "metathis") %>%
#'   write_meta(meta_html_snippet)
#'
#' readLines(meta_html_snippet, warn = FALSE)
#'
#' @export
write_meta <- function(.meta, path = "meta.html", append = FALSE) {
  .meta %>%
    as.character() %>%
    cat(file = path, sep = "\n", append = append)

  invisible(.meta)
}
