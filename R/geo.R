
#' Geotagging Metadata Tags
#'
#' @template describe-meta
#' @param icbm Latitude and longitude of geographic positions specified as
#'   `"lat, long"`. Can optionally be a length-two vector, i.e. `c(lat, long)`.
#' @param geo_position Latitude and longitude of geographic positions specified
#'   as `"lat;long"`. Can optionally be a length-two vector, i.e. `c(lat,
#'   long)`.
#' @param geo_region Name of the geographic region related to the page content,
#'   specified using [ISO-3166](http://en.wikipedia.org/wiki/ISO_3166)
#'   2-character country code and 2-character national subdivision. Example:
#'   `"US-NY"`.
#' @param geo_placename Name of the geographic place related to the page
#'   content. Example: `"Atlanta, Georgia"`.
#' @param ... Additional geotagging metadata keyword and value pairs, such as
#'   `geo.country`, `geo.a1`, ..., `geo.a3`, etc. Underscores in the keyword
#'   will be converted to periods, so you can also specify `geo_country` in
#'   place of `geo.country`.
#'
#' @references
#'   [ICBM on Wikipedia](https://en.wikipedia.org/wiki/ICBM_address#Modern_use),
#'   [Geotagging on Wikipedia](https://en.wikipedia.org/wiki/Geotagging#HTML_pages)
#'
#' @template describe-meta-return
#' @examples
#' meta() %>%
#'   meta_geo(
#'     icbm = c(50.167958, -97.133185),
#'     geo_position = c(50.167958, -97.133185),
#'     geo_placename = "Manitoba, Canada",
#'     geo_region = "ca-mb"
#'   )
#'
#' @export
meta_geo <- function(
  .meta = meta(),
  icbm = NULL,
  geo_position = NULL,
  geo_region = NULL,
  geo_placename = NULL,
  ...
) {
  assert_is_meta(.meta)

  geo_values <- list(
    ICBM            = icbm %??% collapse(icbm),
    "geo.position"  = geo_position %??% collapse(geo_position, ";"),
    "geo.region"    = geo_region,
    "geo.placename" = geo_placename,
    ...
  )

  meta_geo <-
    geo_values %>%
    names_replace_underscore(".") %>%
    collapse_single_string() %>%
    tag_meta_list()

  append_to_meta(.meta, meta_geo)
}
