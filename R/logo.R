

#' @title Add Logo to Tracker
#'
#' @param tracker
#' @param logo
#' @param height_tracker
#'
#' @importFrom tools file_ext
#' @import RCurl
#' @import png
#' @import jpeg
#'
#' @return
#' @export
#'
#' @examples
add_logo <- function(tracker, logo, height_tracker) {

  # check if url or file
  typ <- ifelse(grepl('http', logo), 'url', 'file')

  # check type of logo
  ext <- tolower(file_ext(logo))

  if (typ == 'url') {
    logo <- RCurl::getURLContent(logo)
  }

  if (ext == 'png') {
    logo_imported <- png::readPNG(logo)
  } else if (ext %in% c('jpg', 'jpeg')) {
    logo_imported <- jpeg::readJPEG(logo)
  } else {
    stop(paste0('Unable to Add filetype: ', ext))
  }

  lg <- grid::rasterGrob(logo_imported, just = 'right', height = unit(height_tracker, 'cm'), name = 'logo')

  tracker +
    annotation_custom(lg, xmin = .7, xmax = .9)

}
