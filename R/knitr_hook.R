







#' @title Tracker Knitr Hook
#'
#' @param x plot object
#' @param options knitr options
#'
#' @return
#' @export
#'
#' @examples
# ggtrack_hook <- function(x, options) {
#   plot <- knit_hooks$get('plot')
#   add_banner(plot, options$ggtrack)
# }
ggtrack_hook = function(before, options, envir) {
  if (before) {
    ## code to be run before a chunk
  } else {
    ## code to be run after a chunk
    class(envir$gg)
    add_banner(envir$gg, options$ggtrack)
  }
}
