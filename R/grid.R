

ggtrack <- function(gg, qr_content, color = 'black', height_plot = 10, height_tracker = 1.8, caption = NULL, logo = NULL) {

  # setup QR code
  qr_matrix <- qrcode::qrcode_gen(paste0(qr_content, ' ', format(Sys.time(), '%Y%m%d-%H%M%S')),
                                  plotQRcode = FALSE, dataOutput = TRUE)

  qr_matrix[qr_matrix == 1] <- color
  qr_matrix[qr_matrix == 0] <- 'white'

  qr <- grid::rasterGrob(qr_matrix, interpolate = FALSE, just = 'right', height = unit(height_tracker, 'cm'), name = 'qrcode')

  tracker <- ggplot(mapping = aes(x = 0:1, y = 1)) +
    theme_void() +
    annotation_custom(qr, xmin = .8, xmax = 1)

  # setup logo
  if (!is.null(logo)) {
    lg <- grid::rasterGrob(png::readPNG(RCurl::getURLContent(logo)), just = 'right', height = unit(height_tracker, 'cm'), name = 'logo')
    tracker <- tracker +
      annotation_custom(lg, xmin = .5, xmax = .8)
  }


  # style tracker
  tracker <- tracker +
    theme(plot.margin=unit(c(.5, 0, .3, 0),"cm"))

  gridExtra::grid.arrange(gg, tracker, heights = unit(c(height_plot, height_tracker + .8 ), "cm"))

}



