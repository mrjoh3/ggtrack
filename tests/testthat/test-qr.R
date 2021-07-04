
pos <- get_positions("CLQ", c(10, 50, 40))

test_that("we can create a QR matrix", {
  qr <- ggtrack:::make_qr('add to qr')

  expect_type(qr, 'character')
  expect_equal(unique(qr[1,]), c('black','white'))
  expect_equal(dim(qr), c(25,25))

})


test_that("we can add a QR to a plot", {

  qr <- ggplot(mapping = aes(x = 0:1, y = 1)) %>%
    add_qr('add to qr', justification = 1, height_tracker = 2, position = pos)

  expect_type(qr, 'list')
  expect_s3_class(qr, 'gg')
  expect_s3_class(qr, 'ggplot')

})




test_that("we can add a QR to a tracker", {
  qr <- make_tracker() %>%
    add_qr('add to qr', justification = 1)

  expect_type(qr, 'list')
  expect_s3_class(qr, 'tracker')

})
