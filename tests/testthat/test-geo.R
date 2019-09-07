test_that("meta_geo()", {
  exp_geo <- c(
    '<meta name="ICBM" content="50.167958, -97.133185"/>',
    '<meta name="geo.position" content="50.167958;-97.133185"/>',
    '<meta name="geo.region" content="ca-mb"/>',
    '<meta name="geo.placename" content="Manitoba, Canada"/>'
  )

  expect_equal_meta(
    meta() %>%
      meta_geo(
        icbm = c(50.167958, -97.133185),
        geo_position = c(50.167958, -97.133185),
        geo_placename = "Manitoba, Canada",
        geo_region = "ca-mb"
      ),
    exp_geo
  )

  expect_equal(
    meta_geo(icbm = c(50.167958, -97.133185)),
    meta_geo(icbm = "50.167958, -97.133185")
  )

  expect_equal(
    meta_geo(geo_position = c(50.167958, -97.133185)),
    meta_geo(geo_position = "50.167958;-97.133185")
  )

})
