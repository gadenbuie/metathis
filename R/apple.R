##
## <!-- Disable automatic detection and formatting of possible phone numbers -->
## <meta name="format-detection" content="telephone=no">
##
## <!-- Launch Icon (180x180px or larger) -->
## <link rel="apple-touch-icon" href="/path/to/apple-touch-icon.png">
##
## <!-- Launch Screen Image -->
## <link rel="apple-touch-startup-image" href="/path/to/launch.png">
##
## <!-- Launch Icon Title -->
## <meta name="apple-mobile-web-app-title" content="App Title">
##
## <!-- Enable standalone (full-screen) mode -->
## <meta name="apple-mobile-web-app-capable" content="yes">
##
## <!-- Status bar appearance (has no effect unless standalone mode is enabled) -->
## <meta name="apple-mobile-web-app-status-bar-style" content="black">
##
## <!-- iOS app deep linking -->
## <meta name="apple-itunes-app" content="app-id=APP-ID, app-argument=http/url-sample.com">
## <link rel="alternate" href="ios-app://APP-ID/http/url-sample.com">
##
## [Configuring Web Applications](https://developer.apple.com/library/content/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html)


#' Apple Web App Meta Tags
#'
#' @template describe-meta
#' @template describe-meta-return
#' @param title Launch Icon Title
#' @param capable Enables standalone (full-screen) mode if TRUE
#' @param status_bar_style Status bar appearance. has no effect unless
#'   standalone more is enabled (see `capable`).
#'
#'   "If content is set to default, the status bar appears normal. If set to
#'   black, the status bar has a black background. If set to black-translucent,
#'   the status bar is black and translucent. If set to default or black, the
#'   web content is displayed below the status bar. If set to black-translucent,
#'   the web content is displayed on the entire screen, partially obscured by
#'   the status bar. The default value is default."
#'
#' @references
#' <https://developer.apple.com/library/archive/documentation/AppleApplications/Reference/SafariHTMLRef/Articles/MetaTags.html>
#'
#' @examples
#' meta() %>%
#'   meta_apple_web_app(
#'     title = "My Fancy App",
#'     capable = TRUE,
#'     status_bar_style = "black-translucent"
#'   )
#' @export
meta_apple_web_app <- function(
  .meta = meta(),
  title = NULL,
  capable = NULL,
  status_bar_style = c("default", "black", "black-translucent")
) {
  assert_is_meta(.meta)

  apple <- list(
    title            = title,
    capable          = capable %??% ifelse(capable[[1]], "yes", "no"),
    status_bar_style = status_bar_style %??% match.arg(status_bar_style)
  )

  names(apple) <- paste0("apple-mobile-web-app-", names(apple))

  meta_apple <-
    apple %>%
    names_replace_underscore("-") %>%
    collapse_single_string() %>%
    tag_meta_list()

  append_to_meta(.meta, meta_apple)
}

#' Apple Smart Banner Meta Tag
#'
#' @template describe-meta
#' @template describe-meta-return
#' @param app_id Apple app ID
#' @param affiliate_id Apple affiliate ID
#' @param ... Additional name=value pairs.
#'
#' @section Example:
#'
#' ```
#' # <!-- Smart App Banner -->
#' <meta name="apple-itunes-app" content="app-id=APP_ID,affiliate-data=AFFILIATE_ID,app-argument=SOME_TEXT">
#' ```
#'
#' @export
meta_apple_itunes_app <- function(
  .meta = meta(),
  app_id = NULL,
  affiliate_id = NULL,
  ...
) {

  assert_is_meta(.meta)

  args <- c(
    list(`app-id` = app_id, `affiliate-data` = affiliate_id),
    list(...)
  )
  args <- purrr::compact(args)
  if (!length(args)) {
    return(.meta)
  }

  content <- args %>%
    purrr::imap_chr(~ paste0(.y, "=", .x)) %>%
    collapse(",")

  meta_new <- tag_meta(name = "apple-itunes-app", content = content)

  append_to_meta(.meta, list(meta_new))
}
