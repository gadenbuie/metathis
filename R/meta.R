#' Initialize a List of HTML Metadata Tags
#'
#' @export
meta <- function() {
  as_meta(list())
}

#' Include Metadata Tags in HTML Document
#'
#' Use `include_meta()` to explicitly declare the [meta()] tags as an HTML
#' dependency. In general, this is not required when knitting to an HTML
#' document. In some non-standard cases, such as with \pkg{xaringan} slides
#' this is necessary.
#'
#' @template describe-meta
#' @return An [htmltools::htmlDependecy()] containing the metadata tags to be
#'   included in the `<head>` of the HTML document.
#' @export
include_meta <- function(.meta) {
  assert_is_meta(.meta)

  htmltools::tagList(
    htmltools::htmlDependency(
      "metathis",
      version = metathis_version,
      src = system.file(package = "metathis"),
      head = .meta %>% as.character() %>% htmltools::HTML()
    )
  )
}


#' Create name/content metadata tag pairs
#'
#' Creates metadata tag pairs where the arguments are the name values and their
#' values are content values.
#'
#' @template describe-meta
#' @param ... Name (argument names) and content (argument value) pairs.
#' @examples
#' meta() %>%
#'   meta_name("github-repo" = "hadley/r4ds")
#'
#' @template describe-meta-return
#' @export
meta_name <- function(.meta = meta(), ...) {
  assert_is_meta(.meta)

  name_meta <- list(...) %>%
    collapse_single_string() %>%
    tag_meta_list()

  append_to_meta(.meta, name_meta)
}

#' Create a metadata tag for attribute/value pairs
#'
#' Creates a `<meta>` tag for attribute value pairs, where argument names
#' correspond to attribute names.
#'
#' @template describe-meta
#' @param ... Attribute names and values as `attribute = value`. Values must be
#'   a single character string.
#' @examples
#' meta() %>%
#'   meta_tag(
#'     "http-equiv" = "Content-Security-Policy",
#'     content = "default-src 'self'"
#'   )
#'
#' @template describe-meta-return
#' @export
meta_tag <- function(.meta = meta(), ...) {
  assert_is_meta(.meta)
  attrs <- list(...)

  len_gt_1 <- purrr::keep(attrs, ~ length(.) > 1)
  if (length(len_gt_1)) {
    stop(
      "All values must be length 1: '",
      paste0(names(len_gt_1), collapse = "', '"),
      "'"
    )
  }

  append_to_meta(.meta, list(tag_meta(...)))
}

#' @export
is_meta <- function(x) {
  inherits(x, "meta")
}

assert_is_meta <- function(x, var = ".meta") {
  if (!is_meta(x)) {
    stop("`", var, "` must be a meta object from meta() or as_meta()")
  } else {
    invisible(TRUE)
  }
}

#' @title Convert a list to a `meta` obect.
#' @export
as_meta <- function(x) UseMethod("as_meta", x)

#' @export
as_meta.list <- function(x) {
  structure(
    x,
    class = c("meta", "shiny.tag.list", "list")
  )
}

#' @export
as_meta.default <- function(x) {
  x_class <- paste(class(x), collapse = ", ")
  stop(
    "I don't know how to convert an object of class '",
    x_class,
    "' into a list of <meta> tags"
  )
}

#' @export
as_meta.data.frame <- function(x) {
  NextMethod()
}

#' @export
print.meta <- function(.meta) {
   as.character(.meta) %>% cat()
}

#' @export
knit_print.meta <- function(.meta, ...) {
  assert_is_meta(.meta)

  if (!grepl("html", knitr::opts_knit$get("out.format"))) {
    warning(
      "knitr output format is not HTML. Use `include_meta()` to ensure ",
      "that the <meta> tags are properly included in the <head> output ",
      "(if possible).",
      call. = FALSE
    )
  }

  htmltools::tagList(
    htmltools::htmlDependency(
      "metathis",
      version = metathis_version,
      src = system.file(package = "metathis"),
      head = .meta %>% as.character()
    )
  )
}

#' @export
as.character.meta <- function(.meta) {
  .meta %>% purrr::map_chr(paste) %>% collapse("\n")
}

append_to_meta <- function(.meta, list = NULL) {
  assert_is_meta(.meta)
  as_meta(append(.meta, list))
}

prepend_to_meta <- function(.meta, list = NULL) {
  assert_is_meta(.meta)
  as_meta(purrr::prepend(.meta, list))
}
