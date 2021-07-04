
gg <- ggplot(mapping = aes(x = 1:10, y = rnorm(10))) +
  geom_bar(stat = 'identity')

test_that("Download generates a file and link with basic API", {

  api_basic <- ggtrack(gg,
                       qr_content = 'text content here')

  dl_basic <- make_download(api_basic,
                      save_file = c('files', 'basic_ggtrack'),
                      download_file = c('files', 'basic_ggtrack'),
                      type = 'button',
                      date = 'delete',
                      render = FALSE)

  expect_true(file.exists('files/basic_ggtrack_delete.png'))
  expect_type(dl_basic, 'character')

  # does the link contain the correct URL and type
  expect_equal(as.character(strcapture('href="(.*?)"', dl_basic, proto = 'c')),
               "files/basic_ggtrack_delete.png")
  expect_equal(as.character(strcapture('button type="(.*?)"', dl_basic, proto = 'c')),
               'submit')

  expect_true(file.remove("files/basic_ggtrack_delete.png"))
})


test_that("Download generates a file and link with advanced API", {

  adv <- make_tracker() %>%
    add_logo('files/ggtrack-logo.svg', 1) %>%
    add_qr('some text', justification = 1) %>%
    add_caption('some text') %>%
    add_theme(plot.background = element_rect(fill = "#ff9955", size = 0))

  api_adv <- gg %>%
    add_banner(adv)

  dl_adv <- make_download(api_adv,
                            save_file = c('files', 'adv_ggtrack'),
                            download_file = c('files', 'adv_ggtrack'),
                            type = 'link',
                            date = 'delete',
                            render = FALSE)

  expect_true(file.exists('files/adv_ggtrack_delete.png'))
  expect_s3_class(dl_adv, 'shiny.tag')

  # does the link contain the correct URL and type
  expect_equal(as.character(strcapture('href="(.*?)"', as.character(dl_adv), proto = 'c')),
               "files/adv_ggtrack_delete.png")
  expect_true(is.na(strcapture('button type="(.*?)"', as.character(dl_adv), proto = 'c')))

  expect_true(file.remove("files/adv_ggtrack_delete.png"))
})


