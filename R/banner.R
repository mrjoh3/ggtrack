

#' @title Add Tracking Banner to Plot
#'
#' @param gg ggplot object to track
#' @param tracker ggtrack tracker object
#' @param height_plot numeric tracker height in cm.
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
add_banner <- function(gg, tracker, height_plot = 7) {

  if (missing(gg)) {
    gg <- ggplot() + theme_void()
    height_plot <- 0
  }

  height_tracker <- tracker$height

  tracker$track <- tracker$track +
    theme(plot.margin=unit(c(.5, 0, .3, 0),"cm"))

  gridExtra::grid.arrange(gg, tracker$track, heights = unit(c(height_plot, height_tracker + 1.5 ), "cm"))

}


