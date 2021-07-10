

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
