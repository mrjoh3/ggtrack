

#' @title Add QR Code to Tracker
#'
#' @param tracker
#' @param qr_content
#' @param color
#' @param height_tracker
#'
#' @import qrencoder
#' @return
#' @export
#'
#' @examples
add_qr <- function(tracker, qr_content, color, height_tracker) {

  # setup QR code
  qr_matrix <- qrencoder::qrencode(paste0(qr_content, ' ', format(Sys.time(), '%Y%m%d-%H%M%S')))

  qr_matrix[qr_matrix == 1] <- color
  qr_matrix[qr_matrix == 0] <- 'white'

  qr <- grid::rasterGrob(qr_matrix, interpolate = FALSE, just = 'right', height = unit(height_tracker, 'cm'), name = 'qrcode')

  tracker +
    annotation_custom(qr, xmin = .9, xmax = 1)

}
