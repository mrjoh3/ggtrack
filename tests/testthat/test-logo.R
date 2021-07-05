
pos <- get_positions("CLQ", c(10, 50, 40))

test_that("we can add a Logo to a plot", {

  # this should only ever occur in ggtrack function
  logo <- ggplot(mapping = aes(x = 0:1, y = 1)) %>%
    add_logo('files/ggtrack-logo.png', position = pos, height_tracker = 2, justification = 1)

  expect_type(logo, 'list')
  expect_s3_class(logo, 'gg')
  expect_s3_class(logo, 'ggplot')

})

test_that("we can add a Logo to a tracker", {
  logo <- make_tracker(add_git = FALSE) %>%
    add_logo('files/ggtrack-logo.png', justification = 1)

  expect_type(logo, 'list')
  expect_s3_class(logo, 'tracker')

})
