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

#' @param format_detection Disable automatic detection and formatting of
#'   possible phone numbers in Safari and iOS. Set to `FALSE` to disable
meta_apple <- function(
  .meta = meta(),
  format_detection = NULL
) {
  # format_detection = if (!is.null(format_detection) && !format_detection) {
  #   "telephone:no"
  # }
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
