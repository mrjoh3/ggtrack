

pos <- get_positions("CLQ", c(10, 50, 40))


test_that("we can add a Caption to a plot", {

  cap <- ggplot(mapping = aes(x = 0:1, y = 1)) %>%
    add_caption('add to qr', position = pos)

  expect_type(cap, 'list')
  expect_s3_class(cap, 'gg')
  expect_s3_class(cap, 'ggplot')

})




test_that("we can add a Caption to a tracker", {
  cap <- make_tracker() %>%
    add_caption('add to qr')

  expect_type(cap, 'list')
  expect_s3_class(cap, 'tracker')

})
