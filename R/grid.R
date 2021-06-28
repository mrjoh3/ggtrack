

#' @title Add Tracking Footer
#'
#' @param gg ggplot object to track
#' @param qr_content character to encode into QR code
#' @param color character color of the QR code
#' @param height_plot integer centimeters
#' @param height_tracker integer centimeters
#' @param interactive logical use plotly for interactivity
#' @param caption character text to add to footer
#' @param logo file to add to footer as a logo
#' @param plotly_heights numeric vector of length 2 to fix relative height of plot and tracking banner
#'
#' @import ggplot2
#' @import grid
#' @import gridExtra
#' @import plotly
#'
#' @return
#' @export
#'
#' @examples
ggtrack <- function(gg, qr_content, color = 'black', height_plot = 10, height_tracker = 1.8, interactive = FALSE, caption = NULL, logo = NULL, plotly_heights = c(.8,.2)) {

  # build tracker as plot
  tracker <- ggplot(mapping = aes(x = 0:1, y = 1)) +
    theme_void()

  tracker <- add_qr(tracker, qr_content, color, height_tracker)

  # setup logo
  if (!is.null(logo)) {
    tracker <- add_logo(tracker, logo, height_tracker)
  }

  # setup caption
  if (!is.null(caption)) {
    tracker <- add_caption(tracker, caption)
  }

  # style tracker
  tracker <- tracker +
    theme(plot.margin=unit(c(.5, 0, .3, 0),"cm"))

  if (interactive) {
    plotly::subplot(gg, tracker, nrows = 2, heights = plotly_heights)
  } else {
    gridExtra::grid.arrange(gg, tracker, heights = unit(c(height_plot, height_tracker + 1.5 ), "cm"))
  }


}



