#' Viewport Meta Tag
#'
#' Create or add a viewport meta tag.
#'
#' @references
#'   [MDN: Viewport Meta Tag](https://developer.mozilla.org/en-US/docs/Mozilla/Mobile/Viewport_meta_tag),
#'   [W3C Viewport Meta Element Specification](https://drafts.csswg.org/css-device-adapt/#viewport-meta)
#'
#' @template describe-meta
#' @param width Sets the width of initial viewport. `width` sets `min_width` and
#'   `max_width` and may contain two values; for example, the following are
#'   equivalent: `"300px 500px"` or `c("300px", "500px")`). The values may be
#'   a number with units, a percentage, or `"device-width"`. Pixels are assumed
#'   if no units are provided.
#' @param min_width,max_width Minimum and maximum initial viewport width. See
#'   `width` for more information. `width` is ignored if `min_width` or
#'   `max_width` are set.
#' @param height,min_height,max_height Sets height of initial viewport. Follows
#'   the same conventions as `width`, `min_width`, and `max_width`.
#' @param initial_scale Initial scale
#' @param orientation One of `"auto"`, `"portrait"`, `"landscape"`.
#' @param minimum_scale Minimum scale
#' @param maximum_scale Maximum scale
#' @param user_scalable User scalable
#' @param ... Additional name/value pairs
#'
#' @template describe-meta-return
#' @export
meta_viewport <- function(
  .meta = meta(),
  width = "device-width",
  initial_scale = "1",
  orientation = c("auto", "portrait", "landscape"),
  min_width = NULL,
  max_width = NULL,
  height = NULL,
  min_height = NULL,
  max_height = NULL,
  minimum_scale = NULL,
  maximum_scale = NULL,
  user_scalable = NULL,
  ...
) {

  assert_is_meta(.meta)

  has_minmax_width <- !vapply(list(min_width, max_width), is.null, FALSE)
  has_minmax_height <- !vapply(list(min_height, max_height), is.null, FALSE)

  if (has_minmax_width && !is.null(width)) {
    warning("Ignoring `width` because one of `min_width` or `max_width` was provided")
    width <- NULL
  }

  if (has_minmax_height && !is.null(height)) {
    warning("Ignoring `height` because one of `min_height` or `max_height` was provided")
    height <- NULL
  }

  orientation <- match.arg(orientation)

  content <- c(
    width           = if (is.null(min_width) && is.null(max_width)) width,
    "initial-scale" = initial_scale,
    orientation     = orientation,
    "minimum-scale" = minimum_scale,
    "maximum-scale" = maximum_scale,
    "user-scalable" = user_scalable,
    "min-width"     = min_width,
    "max-width"     = max_width,
    height          = if (is.null(min_height) && is.null(max_height)) height,
    "min-height"    = min_height,
    "max-height"    = max_height,
    ...
  )

  content <- paste(names(content), content, sep = "=", collapse = ", ")

  stopifnot(length(content) == 1)

  # viewport tag has to come first in list of meta tags
  meta_new <- tag_meta(name = "viewport", content = content)

  prepend_to_meta(.meta, list(meta_new))
}
