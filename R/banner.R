

#' @title Add Tracking Banner to Plot
#'
#' @param gg ggplot object to track
#' @param tracker ggtrack tracker object
#' @param height_plot numeric tracker height in cm.
#' @param banner_layout plot_layout object created by \link[patchwork]{plot_layout}. Only
#' required where input is a `patchwork` object. Must include a banner height element
#' that is available from the `ggtrack` object via `$height`. The banner is added to
#' the patchwork object via `/`.
#'
#' @import patchwork
#' @importFrom ggplot2 margin
#'
#' @return tracker
#' @export
#'
#' @examples
#'
#' \dontrun{
#'
#'   track <- make_tracker()
#'
#'   ggplot() %>%
#'     add_banner(track)
#'
#' }
add_banner <- function(gg, tracker, height_plot = 7, banner_layout = NULL) {

  if (missing(gg)) {
    gg <- ggplot() + theme_void()
    height_plot <- 0
  }

  height_tracker <- tracker$height

  tracker$track <- tracker$track +
    theme(plot.margin = margin(.5, 0, .3, 0, "cm"),
          axis.text = element_blank(),
          axis.title = element_blank(),
          panel.border = element_blank())

  if (is.null(banner_layout)) {
    banner_layout <- plot_layout(heights = unit(c(height_plot, height_tracker), 'cm'))
  }

  #gridExtra::grid.arrange(gg, tracker$track, heights = unit(c(height_plot, height_tracker + 1.5 ), "cm"))
  (gg) / tracker$track +
          banner_layout

}


