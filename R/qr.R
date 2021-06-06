

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

  qr_matrix <- qrencoder::qrencode(paste0(qr_content, ' ', format(Sys.time(), '%Y%m%d-%H%M%S')))

  qr_matrix[qr_matrix == 1] <- color
  qr_matrix[qr_matrix == 0] <- color_bg

  return(qr_matrix)
}


#
#
# p1 = plotly_empty(x = 1, y = 1) %>%
#   layout(
#     images = list(list(
#       source = raster2uri(q, interpolate = FALSE),
#       xref = "paper",
#       yref = "paper",
#       x = .5, y = .5,
#       sizex = 0.1, sizey = 0.1,
#       xanchor = "left", yanchor = "bottom"
#     ))
#   ) %>% layout(margin=list(l=10, r=10, b=0, t=0),
#                xaxis=list(showticklabels=FALSE, ticks=""),
#                yaxis=list(showticklabels=FALSE, ticks=""))
#
#
# p2<-plotly_empty(x = 1, y = 1) %>%
#   layout(
#     images = list(list(
#       source = 'https://images.plot.ly/language-icons/api-home/python-logo.png',
#       xref = "paper",
#       yref = "paper",
#       x = .5, y = .5,
#       sizex = 0.1, sizey = 0.1,
#       xanchor = "left", yanchor = "bottom"
#     ))
#   ) %>% layout(margin=list(l=10, r=10, b=0, t=0),
#                xaxis=list(showticklabels=FALSE, ticks=""),
#                yaxis=list(showticklabels=FALSE, ticks=""))
#














