

#' @title Add Caption to Tracker
#'
#' @param tracker
#' @param caption
#'
#' @importFrom gridtext richtext_grob
#' @importFrom ggplot2 annotation_custom
#'
#' @return
#' @export
#'
#' @examples
add_caption <- function(tracker, caption) {

  if (is.character(caption)) {
    tg <- richtext_grob(caption, x = 0, hjust = 0, name = 'caption')
    #tg <- grid::roundrectGrob()
  } else if ('grob' %in% class(caption)) {
    tg <- caption
  } else {
    stop('A caption needs to be either text or a "grob"')
  }

  tracker +
    annotation_custom(tg, xmin = 0, xmax = .6, )

}
