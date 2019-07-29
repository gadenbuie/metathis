
#' General Metadata Tags
#'
#' Generate metadata tags for general website properties.
#'
#' @template describe-meta
#' @param application_name Name of web application (only should be used if the
#'   website is used as an app).
#' @param theme_color Theme Color for Chrome, Firefox OS and Opera, e.g.
#'   `"#00589a"`.
#' @param description Short description of the document (limit to 150
#'   characters), This content *may* be used as a part of search engine results.
#' @param robots Control the behavior of search engine crawling and indexing,
#'   e.g. `"index,follow"`. Valid names are `"index"`, `"noindex"`, `"follow"`,
#'   `"nofollow"`. May be a vector or a single string with comma-separated
#'   values.
#'
#'   See <https://www.robotstxt.org/meta.html> for more information.
#' @param generator Identify the software used to build the document (i.e. -
#'   WordPress, Dreamweaver).
#' @param subject Short description of your document's subject.
#' @param rating Gives a general age rating based on the document's content,
#'   e.g. `"General"`.
#' @param referrer Allows control over how referrer information is passed, .e.g.
#'   `"no-referrer"`. Valid values include `"no-referrer"`,
#'   `"no-referrer-when-downgrade"`, `"same-origin"`, `"origin"`,
#'   `"strict-origin"`, `"origin-when-cross-origin"`,
#'   `"strict-origin-when-cross-origin"`, or `"unsafe-url"`.
#'
#' @template describe-meta-return
#' @examples
#' meta() %>%
#'   meta_general(
#'     application_name = "Application Name",
#'     theme_color = "#4285f4",
#'     description = "A description of this page",
#'     robots = "index,follow",
#'     generator = "R-Shiny",
#'     subject = "Awesome R projects",
#'     rating = "General",
#'     referrer = "no-referrer"
#'   )
#'
#' @export
meta_general <- function(
  .meta = meta(),
  application_name = NULL,
  theme_color = NULL,
  description = NULL,
  robots = NULL,
  generator = NULL,
  subject = NULL,
  rating = NULL,
  referrer = NULL
) {
  assert_is_meta(.meta)

  general <- list(
    application_name = application_name,
    theme_color      = theme_color,
    description      = description,
    robots           = robots %??% collapse(robots, ","),
    generator        = generator,
    subject          = subject,
    rating           = rating,
    referrer         = referrer
  )

  meta_general <-
    general %>%
    names_replace_underscore("-") %>%
    collapse_single_string() %>%
    tag_meta_list()

  append_to_meta(.meta, list = meta_general)
}


#' @rdname meta_general
#' @export
meta_description <- function(.meta = meta(), description) {
  meta_general(.meta, description = description)
}

#' @rdname meta_general
#' @export
meta_subject <- function(.meta = meta(), subject) {
  meta_general(.meta, subject = subject)
}


#' @rdname meta_general
#' @export
meta_referrer <- function(.meta = meta(), referrer) {
  meta_general(.meta, referrer = referrer)
}

#' @rdname meta_general
#' @export
meta_robots <- function(.meta = meta(), robots) {
  meta_general(.meta, robots = robots)
}

#' @rdname meta_general
#' @export
meta_theme_color <- function(.meta = meta(), theme_color) {
  meta_general(.meta, theme_color = theme_color)
}
