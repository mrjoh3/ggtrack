




#' @title Modify Tracking Banner Theme
#'
#' @param tracker ggtrack tracker object
#' @param ... options passed to \link[ggplot2]{theme} in order to style the tracker banner
#'
#' @return tracker
#' @export
#'
#' @examples
#' \dontrun{
#'   make_tracker() %>% add_theme(plot.background = ggplot2::element_rect(fill = "red", size = 0))
#' }
add_theme <- function(tracker, ...) {

  height_tracker <- tracker$height
  position <- tracker$pos
  banner <- tracker$track
  git <- tracker$git
  ts <- tracker$ts

  tracker$track <- banner + theme(...)

  mtrack <- obj_tracker(tracker, 'theme')

  return(mtrack)

}

