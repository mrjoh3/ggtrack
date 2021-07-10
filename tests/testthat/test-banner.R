
track <- make_tracker() %>%
  add_logo('files/ggtrack-logo.svg', 1) %>%
  add_qr('for_QR', justification = 1) %>%
  add_caption('for_Caption') %>%
  add_theme(plot.background = element_rect(fill = "#ff9955", size = 0))

gg <- ggplot(mapping = aes(x = 1:10, y = rnorm(10))) +
  geom_bar(stat = 'identity') +
  theme_minimal()


test_that("we can add a tracking banner", {
  tbn <- gg %>%
    add_banner(track)

  expect_s3_class(tbn, "gtable")
  expect_s3_class(tbn, "gTree")
  expect_s3_class(tbn, "grob")
  expect_s3_class(tbn, "gDesc")

  expect_length(tbn$heights, 2)
  expect_equal(as.numeric(tbn$heights[1]), 7)
  expect_equal(as.numeric(tbn$heights[2]), 3.4)
})


test_that("we can add a tracking banner without a plot", {
  tbn <- add_banner(tracker = track)

  expect_s3_class(tbn, "gtable")
  expect_s3_class(tbn, "gTree")
  expect_s3_class(tbn, "grob")
  expect_s3_class(tbn, "gDesc")

  expect_length(tbn$heights, 2)
  expect_equal(as.numeric(tbn$heights[1]), 0)
  expect_equal(as.numeric(tbn$heights[2]), 3.4)
})
