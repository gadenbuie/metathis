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
#' document. This function explicitly attaches an [htmltools::htmlDependency()]
#' and may work in some unusual cases.
#'
#' @template describe-meta
#' @return An [htmltools::htmlDependency()] containing the metadata tags to be
#'   included in the `<head>` of the HTML document.
#'
#' @family meta_actions
#'
#' @export
include_meta <- function(.meta) {
  assert_is_meta(.meta)

  htmltools::tagList(metaDependency(.meta))
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

#' @rdname as_meta
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

#' @title metathis Object Checks and Coercions
#'
#' @description Functions to check if an object is a \pkg{metathis} obect or to
#'   coerce an object into a metathis object.
#' @param x A list or metathis object
#' @export
as_meta <- function(x) UseMethod("as_meta", x)

#' @export
as_meta.list <- function(x) {
  head <- htmltools::tags$head()
  head$children <- x
  structure(list(head), class = c("meta", "shiny.tag.list", "list"))
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
as.character.meta <- function(x, ...) {
  x[[1]]$children %>% purrr::map_chr(as.character)
}

#' @export
print.meta <- function(x, ...) {
  cat(collapse(x, "\n"))
}

#' @export
knit_print.meta <- function(.meta, ...) {
  assert_is_meta(.meta)

  # nocov start
  if (!grepl("html", knitr::opts_knit$get("rmarkdown.pandoc.to"))) {
    warning(
      "knitr output format is not HTML. Use `include_meta()` to ensure ",
      "that the <meta> tags are properly included in the <head> output ",
      "(if possible).",
      call. = FALSE
    )
  }

  if (guess_blogdown()) {
    warning(
      "{metathis} can't directly include <meta> tags inside blogdown posts ",
      "because the mechanism for including tags in the <head> section of a ",
      "page depends on the Hugo template. ",
      "If you see this message but are not rendering a blogdown post, you can ",
      "use metathis::include_meta() to avoid this check. ",
      "See ?meta for more information.",
      call. = FALSE
    )
    return(collapse(.meta, "\n"))
  }
  #nocov end

  # Thank you: https://github.com/haozhu233/kableExtra/blob/master/R/print.R#L56
  knitr::asis_output("", meta = list(metaDependency(.meta)))
}

append_to_meta <- function(.meta, .list = NULL) {
  assert_is_meta(.meta)
  .meta[[1]]$children <- append(.meta[[1]]$children, .list)
  .meta
}

prepend_to_meta <- function(.meta, .list = NULL) {
  assert_is_meta(.meta)
  .meta[[1]]$children <- purrr::prepend(.meta[[1]]$children, .list)
  .meta
}

metaDependency <- function(.meta) {
  assert_is_meta(.meta)

  htmltools::htmlDependency(
    paste0("metathis", "-", random_id()),
    version = metathis_version,
    src = system.file(package = "metathis"),
    head = .meta %>% paste()
  )
}

random_id <- function(n = 6) {
  c(letters[1:6], 0:9) %>%
    sample(8, replace = TRUE) %>%
    collapse("")
}

guess_blogdown <- function() {
  blogdown_root <- find_config(getwd())
  if (is.null(blogdown_root)) return(FALSE)

  # Check for blogdown config files and confirm if they contain "baseURL"
  config_files <- dir(blogdown_root, "config[.](yaml|toml|json)", full.names = TRUE)
  if (length(config_files)) {
    for (config in config_files) {
      if (grepl("baseURL", collapse(readLines(config, warn = FALSE)))) {
        return(TRUE)
      }
    }
  }

  # Check if config file + "content" + "layouts" + "static"
  blogdown_files <- dir(blogdown_root, "content|layouts|static")
  if (length(blogdown_files) == 3 && length(config_files)) {
    return(TRUE)
  }

  FALSE
}

find_config <- function(path) {
  if (length(dir(path, "config[.](yaml|toml|json)"))) {
    return(path)
  }

  path_up <- normalizePath(file.path(path, ".."))
  if (path == path_up) return(NULL)
  find_config(path_up)
}
