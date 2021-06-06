
#' Social Media Metadata
#'
#' Generate metadata tags for social media cards.
#'
#' @template describe-meta
#' @param title Content title
#' @param description Content description. If you have already used
#'   [meta_general()] to set the content's description, that description will
#'   automatically be used.
#' @param url Content URL
#' @param image Image url for card.
#' @param image_alt A description of what's in the image (not a caption)
#' @param image_width The width of the image in pixels
#' @param image_height The height of the image in pixels
#' @param og_site_name The name of the site hosting the content
#' @param og_type Open Graph card type, default is `"website"`. Other common
#'   options include `"article"`, `"book"`, or `"profile"`. The full list of
#'   valid options can be referenced at <https://ogp.me/>
#' @param og_locale The locale these tags are marked up in. Of the format `language_TERRITORY`. Default is `"en_US"`.
#' @param og_author Writers of the article. Multiple authors may be specified in
#'   a vector of character strings.
#' @param twitter_card_type One of `"summary"`, `"summary_large_image"`,
#'   `"app"`, or `"player"`.
#' @param twitter_creator `@username` for the content creator / author.
#' @param twitter_site `@username`` for the website used in the card footer.
#'   `twitter_creator` is used by default.
#' @param facebook_app_id The Facebook app ID. See the
#'   [Facebook Open Graph Markup](https://developers.facebook.com/docs/sharing/webmasters#markup)
#'   page for more information.
#' @param disable_pinterest If `TRUE`, adds a metadata tag disabling pins from
#'   your website. See the
#'   [Pinterest help center](https://help.pinterest.com/en/business/article/prevent-saves-to-pinterest-from-your-site)
#'   for more information.
#'
#' @references
#'   - [Open Graph](https://ogp.me/)
#'   - [Google Structured Data Testing Tool](https://search.google.com/structured-data/testing-tool)
#'   - [Facebook Sharing Debugger](https://developers.facebook.com/tools/debug/)
#'   - [Twitter Card Documentation](https://developer.twitter.com/en/docs/twitter-for-websites/cards/guides/getting-started)
#'   - [Twitter Card Validator](https://cards-dev.twitter.com/validator)
#'
#' @template describe-meta-return
#' @examples
#' meta() %>%
#'   meta_social(
#'     title = "R for Data Science",
#'     description = "This book with teach you how to do data science with R",
#'     url = "https://r4ds.had.co.nz",
#'     image = "https://r4ds.had.co.nz/cover.png",
#'     image_alt = "The cover of the R4DS book",
#'     og_type = "book",
#'     og_author = c("Garrett Grolemund", "Hadley Wickham"),
#'     twitter_card_type = "summary",
#'     twitter_creator = "@hadley"
#'   )
#'
#' @export
meta_social <- function(
  .meta = meta(),
  title = NULL,
  url = NULL,
  image = NULL,
  image_alt = NULL,
  image_width = NULL,
  image_height = NULL,
  description = NULL,
  twitter_card_type = c("summary", "summary_large_image", "app", "player"),
  twitter_creator = NULL,
  twitter_site = twitter_creator,
  og_type = "website",
  og_locale = "en_US",
  og_author = NULL,
  og_site_name = NULL,
  facebook_app_id = NULL,
  disable_pinterest = FALSE
) {
  assert_is_meta(.meta)
  twitter_card_type <- match.arg(twitter_card_type)

  description <- description %||% meta_find_description(.meta)

  social <- list(
    "twitter:title"       = title,
    "twitter:description" = description,
    "twitter:url"         = url,
    "twitter:image"       = image,
    "twitter:image:alt"   = image_alt,
    "twitter:image:width" = image_width,
    "twitter:image:height"= image_height,
    "twitter:card"        = twitter_card_type,
    "twitter:creator"     = twitter_creator,
    "twitter:site"        = twitter_site,
    "og:title"            = title,
    "og:description"      = description,
    "og:url"              = url,
    "og:image"            = image,
    "og:image:alt"        = image_alt,
    "og:image:width"      = image_width,
    "og:image:height"     = image_height,
    "og:type"             = og_type,
    "og:locale"           = og_locale,
    "og:site_name"        = og_site_name,
    "article:author"      = og_author %??% as.list(og_author),
    "fb:app_id"           = facebook_app_id
  )

  meta_social <-
    social %>%
    duplicate_vector_entries() %>%
    collapse_single_string() %>%
    purrr::imap(function(content, property) {
      if (grepl("^twitter:", property)) {
        tag_meta(name = property, content = content)
      } else {
        tag_meta(property = property, content = content)
      }
    }) %>%
    unname()

  if (disable_pinterest) {
    meta_social <- c(
      meta_social,
      list(tag_meta(
        name = "pinterest",
        content = "nopin",
        description = "Sorry, pins from this website are disabled."
      ))
    )
  }

  append_to_meta(.meta, meta_social)
}
