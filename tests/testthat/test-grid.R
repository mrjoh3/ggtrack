
gg <- ggplot(mapping = aes(x = 1:10, y = rnorm(10))) +
  geom_bar(stat = 'identity')

test_that("We can add a QR code", {
  qr_test <- ggtrack(gg,
                     qr_content = 'text content here',
                     add_git = FALSE)
  expect_s3_class(qr_test, "gtable")
  expect_s3_class(qr_test, "gTree")
  expect_s3_class(qr_test, "grob")
  expect_s3_class(qr_test, "gDesc")

  expect_length(qr_test$heights, 2)
  expect_equal(as.numeric(qr_test$heights[1]), 7)
  expect_equal(as.numeric(qr_test$heights[2]), 3.3)
})


test_that("We can add a Logo from URL", {
  qr_logo <- ggtrack(gg,
                     logo = 'https://www.r-project.org/logo/Rlogo.png',
                     add_git = FALSE)
  expect_s3_class(qr_logo, "gtable")
  expect_s3_class(qr_logo, "gTree")
  expect_s3_class(qr_logo, "grob")
  expect_s3_class(qr_logo, "gDesc")

  expect_length(qr_logo$heights, 2)
  expect_equal(as.numeric(qr_logo$heights[1]), 7)
  expect_equal(as.numeric(qr_logo$heights[2]), 3.3)
})


test_that("We can add a PNG Logo from file", {
  qr_logo <- ggtrack(gg,
                     logo = 'files/ggtrack-logo.png',
                     add_git = FALSE)
  expect_s3_class(qr_logo, "gtable")
  expect_s3_class(qr_logo, "gTree")
  expect_s3_class(qr_logo, "grob")
  expect_s3_class(qr_logo, "gDesc")

  expect_length(qr_logo$heights, 2)
  expect_equal(as.numeric(qr_logo$heights[1]), 7)
  expect_equal(as.numeric(qr_logo$heights[2]), 3.3)
})



test_that("We can add a JPEG Logo from file", {
  qr_logo <- ggtrack(gg,
                     logo = 'files/ggtrack-logo.jpg',
                     add_git = FALSE)
  expect_s3_class(qr_logo, "gtable")
  expect_s3_class(qr_logo, "gTree")
  expect_s3_class(qr_logo, "grob")
  expect_s3_class(qr_logo, "gDesc")

  expect_length(qr_logo$heights, 2)
  expect_equal(as.numeric(qr_logo$heights[1]), 7)
  expect_equal(as.numeric(qr_logo$heights[2]), 3.3)
})




test_that("We can add a SVG Logo from file", {
  qr_logo <- ggtrack(gg,
                     logo = 'files/ggtrack-logo.svg',
                     add_git = FALSE)
  expect_s3_class(qr_logo, "gtable")
  expect_s3_class(qr_logo, "gTree")
  expect_s3_class(qr_logo, "grob")
  expect_s3_class(qr_logo, "gDesc")

  expect_length(qr_logo$heights, 2)
  expect_equal(as.numeric(qr_logo$heights[1]), 7)
  expect_equal(as.numeric(qr_logo$heights[2]), 3.3)
})



test_that("We can add a Logo and a QR", {
  qr_logo <- ggtrack(gg,
                     qr_content = 'text content here',
                     logo = 'files/ggtrack-logo.svg',
                     add_git = FALSE)
  expect_s3_class(qr_logo, "gtable")
  expect_s3_class(qr_logo, "gTree")
  expect_s3_class(qr_logo, "grob")
  expect_s3_class(qr_logo, "gDesc")

  expect_length(qr_logo$heights, 2)
  expect_equal(as.numeric(qr_logo$heights[1]), 7)
  expect_equal(as.numeric(qr_logo$heights[2]), 3.3)
})


test_that("We can add a Caption", {
  qr_logo <- ggtrack(gg,
                     caption = 'text to display',
                     add_git = FALSE)
  expect_s3_class(qr_logo, "gtable")
  expect_s3_class(qr_logo, "gTree")
  expect_s3_class(qr_logo, "grob")
  expect_s3_class(qr_logo, "gDesc")

  expect_length(qr_logo$heights, 2)
  expect_equal(as.numeric(qr_logo$heights[1]), 7)
  expect_equal(as.numeric(qr_logo$heights[2]), 3.3)
})


test_that("We can add a Caption and a QR", {
  qr_logo <- ggtrack(gg,
                     qr_content = 'text content here',
                     caption = 'text to display',
                     add_git = FALSE)
  expect_s3_class(qr_logo, "gtable")
  expect_s3_class(qr_logo, "gTree")
  expect_s3_class(qr_logo, "grob")
  expect_s3_class(qr_logo, "gDesc")

  expect_length(qr_logo$heights, 2)
  expect_equal(as.numeric(qr_logo$heights[1]), 7)
  expect_equal(as.numeric(qr_logo$heights[2]), 3.3)
})



test_that("We can add a Caption, logo and a QR", {

  qr_logo <- ggtrack(gg,
                     qr_content = 'text content here',
                     logo = 'files/ggtrack-logo.svg',
                     caption = 'text to display',
                     add_git = FALSE)
  expect_s3_class(qr_logo, "gtable")
  expect_s3_class(qr_logo, "gTree")
  expect_s3_class(qr_logo, "grob")
  expect_s3_class(qr_logo, "gDesc")

  expect_length(qr_logo$heights, 2)
  expect_equal(as.numeric(qr_logo$heights[1]), 7)
  expect_equal(as.numeric(qr_logo$heights[2]), 3.3)
})


test_that('element order can be rearranged', {
  pos <- ggtrack(gg,
                 order = 'LCQ',
                 positions = c(25, 55, 20),
                 qr_content = 'For all your image tracking needs: https://github.com/mrjoh3/ggtrack',
                 logo = 'https://www.r-project.org/logo/Rlogo.png',
                 caption = 'Lots of extra info, or a fancy <span style="color:blue">"grob"</span>.',
                 logo_justification = 0,
                 add_git = FALSE)

  expect_s3_class(pos, "gtable")
  expect_s3_class(pos, "gTree")
  expect_s3_class(pos, "grob")
  expect_s3_class(pos, "gDesc")

  expect_length(pos$heights, 2)
  expect_equal(as.numeric(pos$heights[1]), 7)
  expect_equal(as.numeric(pos$heights[2]), 3.5)

})


test_that('element size can be modified', {
  pos <- ggtrack(gg,
                 order = 'LCQ',
                 positions = c(60, 10, 30),
                 qr_content = 'For all your image tracking needs: https://github.com/mrjoh3/ggtrack',
                 logo = 'https://www.r-project.org/logo/Rlogo.png',
                 caption = 'Lots of extra info, or a fancy <span style="color:blue">"grob"</span>.',
                 logo_justification = 0,
                 add_git = FALSE)

  expect_s3_class(pos, "gtable")
  expect_s3_class(pos, "gTree")
  expect_s3_class(pos, "grob")
  expect_s3_class(pos, "gDesc")

  expect_length(pos$heights, 2)
  expect_equal(as.numeric(pos$heights[1]), 7)
  expect_equal(as.numeric(pos$heights[2]), 3.5)

})


test_that('tracker theme can be modified', {
  thm <- ggtrack(gg,
                 qr_content = 'some text',
                 logo = 'files/ggtrack-logo.svg',
                 caption = 'some text',
                 plot.background = element_rect(fill = "#f0f0f0", size = 0),
                 add_git = FALSE)

  expect_s3_class(thm, "gtable")
  expect_s3_class(thm, "gTree")
  expect_s3_class(thm, "grob")
  expect_s3_class(thm, "gDesc")

  expect_length(thm$heights, 2)
  expect_equal(as.numeric(thm$heights[1]), 7)
  expect_equal(as.numeric(thm$heights[2]), 3.3)

})
