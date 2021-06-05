

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
# fig <- plot_ly(x = 0:1)
#
# ggplotly(tracker) %>%
#   layout(
#     images = list(
#       list(source = logo,
#            xref = "paper",
#            yref = "paper",
#            x= .5,
#            sizex = 0.2,
#            sizey = 0.2,
#            opacity = 0.8
#       )))
#
#
#
# fig <- plotly_empty(x=1:10, y=1)
# #fig <- fig %>% add_lines()
# fig <- fig %>%
#   layout(
#     images = list(
#       list(source = 'https://images.plot.ly/language-icons/api-home/matlab-logo.png',
#            xref = "paper",
#            yref = "y",
#            x= 5,
#            y= 1,
#            sizex = 3,
#            sizey = 3,
#            opacity = 1
#       ),
#
#       list(source = "https://www.r-project.org/logo/Rlogo.png",
#            xref = "paper",
#            yref = "y",
#            x = 8,
#            y = 1,
#            sizex = 3,
#            sizey = 3,
#            opacity = 1
#       )
#     )
#   )
#
# fig
#

# p = plotly_empty(x = 1, y = 1) %>%
#   layout(
#     images = list(list(
#       source = raster2uri(q, interpolate = FALSE),
#       xref = "paper",
#       yref = "paper",
#       x = .9, y = 0,
#       sizex = 0.5, sizey = 0.5,
#       xanchor = "left", yanchor = "bottom"
#     ))
#   )
#

















