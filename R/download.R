

#' @title Tracker Download Link
#'
#' @description Save tracker object to file and render link or button for user download
#'
#' @param tracker tracker object to be saved
#' @param filename character vector, where length > 1, path is generated using \link[base]{file.path}
#' @param link_text character text to appear on the page
#' @param type character must be one of "link" or "button".
#' @param render Boolean, render in-place or save for later
#'
#' @return html of the link object
#' @export
#'
#' @examples
make_download <- function(tracker, filename, ext = 'png', link_text = 'download', type = c('link','button'), render = TRUE) {

  if (missing(filename)) {
    filename <- paste0('chart_', format(Sys.time(), '%Y%m%d-%H%M%S'), '.', ext)
  } else {
    filename <- paste0(file.path(filename), '_', format(Sys.time(), '%Y%m%d-%H%M%S'), '.', ext)
  }

  ggsave(filename, tracker, device = ext)

  type <- match.arg(type, choices = type)

  if (type == 'link') {
    link <- htmltools::a(href = filename,
                         download = basename(filename),
                         link_text)
  } else if (type == 'button'){
    link <- htmltools::a(href = filename,
                         download = basename(filename),
                         glue::glue('<button class="btn"><i class="fa fa-download"></i> {link_text}</button>'))
  }

  if (render){
    cat(as.character(link))
  }

  return(link)

}

