

#' @title Add Tracking Footer
#'
#' @param gg ggplot object to track
#' @param qr_content \code{character} content passed to \link[qrencoder]{qrencode}. A time stamp is automatically added plus the current
#' git commit where available.
#' @param color character color of the QR code
#' @param caption \code{character} or \code{grob} to add to footer. Text can be
#' \code{html} or \code{md} and is passed directly to \link[gridtext]{richtext_grob}
#' @param logo file to add to footer as a logo
#' @param order
#' @param positions
#' @param height_plot integer centimeters
#' @param height_tracker integer centimeters
#' @param interactive logical use plotly for interactivity

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
ggtrack <- function(gg, qr_content, color = 'black', caption = NULL, logo = NULL, order = 'CLQ', positions = c(55, 25, 20), height_plot = 10, height_tracker = 1.8, interactive = FALSE, plotly_heights = c(.8,.2)) {

  # define size and order of 3 containers
  pos <- get_positions(order, positions)

  # build tracker as plot, this is the tracker object
  tracker <- ggplot(mapping = aes(x = 0:1, y = 1)) +
    theme_void()

  class(tracker) <- c(class(tracker), 'ggtracker')

  tracker <- add_qr(tracker, qr_content, color, height_tracker, pos)

  # setup logo
  if (!is.null(logo)) {
    tracker <- add_logo(tracker, logo, height_tracker, pos)
  }

  # setup caption
  if (!is.null(caption)) {
    tracker <- add_caption(tracker, caption, pos)
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



