
`%||%` <- function(x, y) if (is.null(x)) y else x

`%??%` <- function(x, y) if (!is.null(x)) y

tag_meta <- function(...) htmltools::tag("meta", list(...))

tag_meta_list <- function(.list) {
  .list %>%
    purrr::imap(~ tag_meta(name = .y, content = .x)) %>%
    unname()
}

tag_meta_list_property <- function(.list) {
  .list %>%
    purrr::imap(~ tag_meta(property = .y, content = .x)) %>%
    unname()
}

collapse_single_string <- function(.list, sep = " ") {
  .list %>%
    purrr::compact() %>%
    vapply(collapse, "", sep = sep)
}

collapse <- function(x, sep = ", ") {
  paste(x, collapse = sep)
}

names_replace_underscore <- function(.list, replace = "-") {
  names(.list) <- gsub("_", replace, names(.list))
  .list
}

duplicate_vector_entries <- function(.list) {
  levels <- purrr::map_dbl(.list, purrr::vec_depth)

  if (!any(levels > 1)) {
    return(.list)
  }

  new_list <- list()
  for (i in seq_along(.list)) {
    if (levels[i] < 2) {
      new_list[[names(.list)[i]]] <- .list[[i]]
      next
    }
    flattened <- purrr::flatten(.list[i])
    names(flattened) <- rep(names(.list)[i], length(flattened))
    new_list <- c(new_list, flattened)
  }
  new_list
}

has_meta_with_property <- function(.meta, property = "name", value) {
  has_match <-
    .meta[[1]]$children %>%
    purrr::map("attribs") %>%
    purrr::map_lgl(~ {
      !is.null(.x[[property]]) && .x[[property]] == value
    })

  has_match
}
