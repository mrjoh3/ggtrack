
gg <- ggplot(mapping = aes(x = 1:10, y = rnorm(10))) +
  geom_bar(stat = 'identity')



test_that("We can add a QR code", {
  qr_test <- ggtrack(gg, qr_content = 'text content here')
  expect_equal(2 * 2, 4)
})


test_that("We can add a Logo from URL", {
  qr_logo <- ggtrack(gg,
                     qr_content = 'text content here',
                     logo = 'https://www.r-project.org/logo/Rlogo.png')
  expect_equal(2 * 2, 4)
})

