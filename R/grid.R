

#' @title Add Tracking Footer
#'
#' @param gg ggplot object to track
#' @param qr_content \code{character} content passed to \link[qrencoder]{qrencode}. A time stamp is automatically added plus the current
#' git commit where available.
#' @param color character color of the QR code
#' @param color_bg character background color of QR code
#' @param caption \code{character} or \code{grob} to add to footer. Text can be
#' \code{html} or \code{md} and is passed directly to \link[gridtext]{richtext_grob}
#' @param logo file to add to footer as a logo
#' @param order \code{character} of \code{length} 3 defining placement
#' order for "caption" (C), "logo" (L) and "QR" (Q) code. Must be one of:
#' \itemize{
#'   \item{CLQ}
#'   \item{LCQ}
#'   \item{QLC}
#'   \item{CQL}
#' }
#' @param positions \code{numeric} \code{vector} of \code{length} 3,
#' defining the horizontal proportion of each container. The 3 numbers
#' must add to 100.
#' @param logo_justification numeric between 0 and 1 passed to \link[grid]{rasterGrob}. See note below.
#' @param qr_justification numeric between 0 and 1 passed to \link[grid]{rasterGrob}. See note below.
#' @param height_plot numeric plot height in cm.
#' @param height_tracker numeric tracker height in cm.
#' @param interactive logical use plotly for interactivity
#' @param plotly_heights numeric vector of length 2 to fix relative height of plot and tracking banner
#' @param ... options passed to \link[ggplot2]{theme} in order to style the tracker banner.
#'
#' @note For Justification you need to imagine each element in its own rectangle with a bottom
#' dimension of 0 to 1. If you want the logo or QR code on the right of the rectangle set justification
#' to 1, or 0 for left.
#'
#' @import ggplot2
#' @import grid
#' @import gridExtra
#'
#' @return grid
#' @export
#'
ggtrack <- function(gg,
                    qr_content = NULL,
                    color = 'black',
                    color_bg = 'white',
                    caption = NULL,
                    logo = NULL,
                    order = 'CLQ',
                    positions = c(55, 25, 20),
                    logo_justification = 1,
                    qr_justification = 1,
                    height_plot = 7,
                    height_tracker = 1.8,
                    interactive = FALSE,
                    plotly_heights = c(.8,.2),
                    ...) {


  # define size and order of 3 containers
  pos <- get_positions(order, positions)

  # build tracker as plot, this is the tracker object
  tracker <- ggplot(mapping = aes(x = 0:1, y = 1)) +
    theme_void() +
    theme(...)

  # setup qr
  if (!is.null(qr_content)) {
    tracker <- add_qr(tracker, qr_content, color, color_bg, height_tracker, pos, qr_justification)
  }

  # setup logo
  if (!is.null(logo)) {
    tracker <- add_logo(tracker, logo, height_tracker, pos, logo_justification)
  }

  # setup caption
  if (!is.null(caption)) {
    tracker <- add_caption(tracker, caption, pos)
  }

  # style tracker
  tracker <- tracker +
    theme(plot.margin=unit(c(.5, 0, .3, 0),"cm"))

  if (interactive) {
    #plotly::subplot(gg, tracker, nrows = 2, heights = plotly_heights)
    warning('interactive option currently unavailable')
  } else {
    gridExtra::grid.arrange(gg, tracker, heights = unit(c(height_plot, height_tracker + 1.5 ), "cm"))
  }


}






#' @title Define Tracker Base
#'
#' @param order \code{character} of \code{length} 3 defining placement
#' order for "caption" (C), "logo" (L) and "QR" (Q) code. Must be one of:
#' \itemize{
#'   \item{CLQ}
#'   \item{LCQ}
#'   \item{QLC}
#'   \item{CQL}
#' }
#' @param positions \code{numeric} \code{vector} of \code{length} 3,
#' defining the horizontal proportion of each container. The 3 numbers
#' must add to 100.
#' @param height_tracker numeric tracker height in cm.
#'
#' @return tracker
#' @export
#'
#' @examples
#' \dontrun{
#'   make_tracker()
#' }
make_tracker <- function(order = 'CLQ',
                         positions = c(55, 25, 20),
                         height_tracker = 1.8) {

  # define size and order of 3 containers
  pos <- get_positions(order, positions)

  # build tracker as plot, this is the tracker object
  tracker <- ggplot(mapping = aes(x = 0:1, y = 1)) +
    theme_void()

  mtrack <- obj_tracker(tracker, pos, height_tracker, 'background')

  return(mtrack)

}


#' @title Create Tracker Object
#'
#' @param tracker ggtrack tracker object
#' @param pos \code{numeric} \code{vector} of \code{length} 3,
#' defining the horizontal proportion of each container. The 3 numbers
#' must add to 100.
#' @param height_tracker numeric tracker height in cm.
#' @param contains character vector tracks what elements have been added to tracker
#'
#' @return tracker
#'
obj_tracker <- function(tracker, pos, height_tracker, contains) {

  if (is.null(tracker$contains)) {
    tracker <- list(track = tracker,
                    pos = pos,
                    height = height_tracker,
                    contains = contains)
    class(tracker) <- 'tracker'
  } else {
    tracker$contains <- c(tracker$contains, contains)
  }

  return(tracker)

}

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

  height_tracker <- tracker$height

  tracker$track <- tracker$track +
    theme(plot.margin=unit(c(.5, 0, .3, 0),"cm"))

  gridExtra::grid.arrange(gg, tracker$track, heights = unit(c(height_plot, height_tracker + 1.5 ), "cm"))

}



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

  tracker$track <- banner + theme(...)

  mtrack <- obj_tracker(tracker, position, height_tracker, 'theme')

  return(mtrack)

}



#' @title Print Tracker
#'
#' @param x ggtrack tracker object
#' @param ... print options
#'
#' @export
#' @examples
#' \dontrun{
#'   print(make_tracker())
#' }
print.tracker <- function(x, ...) {

  cat("ggtrack tracking banner\n")
  cat("=======================\n\n")
  cat(glue("banner height: {x$height} cm \n"))
  cat("\n\nincluded elements:\n   - ")
  cat(x$contains, sep = '\n   - ')
  cat('\nelement positions:\n\n')
  x$pos

}

#' @title Plot Tracker Object
#'
#' @param x ggtrack tracker object
#' @param ... plot options
#'
#' @export
#' @examples
#' \dontrun{
#'   plot(make_tracker())
#' }
plot.tracker <- function(x, ...) {

  x$track +
    labs(title = 'ggtrack tracker banner',
         subtitle = "add to a ggplot using add_banner(plot, tracker)")
}
