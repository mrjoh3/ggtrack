

#' @title Add Banner to Interactive Chart
#'
#' @description Interactive and SVG plots are made using a combination
#' of \link[ggiraph] and \link[patchwork]. This is a very simple wrapper
#' for ..., in some instances it may be easier to use \link[ggiraff]
#' directly. See ggiraff documentation and examples at:
#' https://davidgohel.github.io/ggiraph/articles/offcran/examples.html
#'
#' @param gg ggplot object, interactivity needs to be added via elements such as \link[ggiraph]{geom_point_interactive}
#' @param tracker ggtrack tracker object
#' @param plot_height numeric height of the main plot panel in cm.
#' @param width_svg numeric svg width in inches, passed to \link[ggiraph]{girafe}
#' @param height_svg numeric svg width in inches, passed to \link[ggiraph]{girafe}
#' @param options list passed to \link[ggiraph]{girafe} options
#'
#' @importFrom ggiraph girafe
#' @import patchwork
#'
#' @return ggiraph svg object
#' @export
#'
#' @examples
add_banner_interactive <- function(gg, tracker, plot_height = 7, width_svg = 8, height_svg = 4, options) {

  girafe(code = print(gg / tracker$track +
                      plot_layout(heights = unit(c(plot_height, tracker$height), 'cm'))),
         width_svg = width_svg, height_svg = height_svg,
         options = options)

}
