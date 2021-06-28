

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
  qr_matrix <- make_qr(qr_content, color)

  qr <- grid::rasterGrob(qr_matrix, interpolate = FALSE, x = 1, just = 'right', height = unit(height_tracker, 'cm'), name = 'qrcode')

  tracker +
    annotation_custom(qr, xmin = .85, xmax = 1)

}


#' @title Make QR
#'
#' @param qr_content
#' @param color
#' @param color_bg
#'
#' @return
#'
#' @examples
make_qr <- function(qr_content, color = 'black', color_bg = 'white') {

  g <- Sys.which('git')

  if (as.character(g) == '') {
    git <- 'noGit'
  } else {
    git <- strtrim(system("git rev-parse HEAD", intern=TRUE), 7)
  }


  qr_matrix <- qrencoder::qrencode(paste(qr_content,
                                         git,
                                         format(Sys.time(), '%Y%m%d-%H%M%S')))

  qr_matrix[qr_matrix == 1] <- color
  qr_matrix[qr_matrix == 0] <- color_bg

  return(qr_matrix)
}
















