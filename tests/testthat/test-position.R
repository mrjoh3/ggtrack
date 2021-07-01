test_that("position inputs are correct", {
  expect_error(get_positions("ABC", 100))
  expect_error(get_positions("ABC", c(10, 50, 40)))
  expect_error(get_positions("CLQ", 100))
  expect_error(get_positions("CLQ", 50))
})

test_that("position data.frame is accurate", {
  pos <- get_positions("CLQ", c(10, 50, 40))
  expect_equal(nrow(pos), 3)
  expect_equal(sum(pos$position), 100)
  expect_true(all(pos$order %in% c('C','L','Q')))
})

test_that('position input can be lower or mixed case',{
  expect_s3_class(get_positions("qLC", c(10, 50, 40)), 'data.frame')
})
