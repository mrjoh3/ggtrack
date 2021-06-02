

#' @title Add Caption to Tracker
#'
#' @param tracker
#' @param caption
#'
#' @importFrom grid textGrob
#' @importFrom ggplot2 annotation_custom
#'
#' @return
#' @export
#'
#' @examples
add_caption <- function(tracker, caption) {

  if (is.character(caption)) {
    tg <- grid::textGrob(caption, just = c(0,0), name = 'caption')
  } else if ('grob' %in% class(caption)) {
    tg <- caption
  } else {
    stop('A caption needs to be either text or a "grob"')
  }

  tracker +
    annotation_custom(tg, xmin = 0, xmax = .7)

}
