

#' @title Add Tracking Footer
#'
#' @param gg ggplot object to track
#' @param qr_content \code{character} content passed to \link[qrencoder]{qrencode}. A time stamp is automatically added plus the current
#' git commit where available.
#' @param color character color of the QR code
#' @param caption \code{character} or \code{grob} to add to footer. Text can be
#' \code{html} or \code{md} and is passed directly to \link[gridtext]{richtext_grob}
#' @param logo file to add to footer as a logo
#' @param order
#' @param positions
#' @param logo_justification numeric between 0 and 1 passed to \link[grid]{rasterGrob}. See note below.
#' @param qr_justification numeric between 0 and 1 passed to \link[grid]{rasterGrob}. See note below.
#' @param height_plot integer centimeters
#' @param height_tracker integer centimeters
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
#' @import plotly
#'
#' @return
#' @export
#'
#' @examples
ggtrack <- function(gg,
                    qr_content,
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

  #class(tracker) <- c(class(tracker), 'ggtracker')

  tracker <- add_qr(tracker, qr_content, color, color_bg, height_tracker, pos, qr_justification)

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
    plotly::subplot(gg, tracker, nrows = 2, heights = plotly_heights)
  } else {
    gridExtra::grid.arrange(gg, tracker, heights = unit(c(height_plot, height_tracker + 1.5 ), "cm"))
  }


}






#' @title Define Tracker Base
#'
#' @param order
#' @param positions
#' @param height_tracker
#'
#' @return tracker
#' @export
#'
#' @examples
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
#' @param tracker
#' @param pos
#' @param height_tracker
#' @param contains character vector tracks what elements have been added to tracker
#'
#' @return
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
#' @param gg
#' @param tracker
#' @param height_plot
#'
#' @return
#' @export
#'
#' @examples
add_banner <- function(gg, tracker, height_plot = 7) {

  height_tracker <- tracker$height

  tracker$track <- tracker$track +
    theme(plot.margin=unit(c(.5, 0, .3, 0),"cm"))

  gridExtra::grid.arrange(gg, tracker$track, heights = unit(c(height_plot, height_tracker + 1.5 ), "cm"))

}



#' @title Modify Tracking Banner Theme
#'
#' @param tracker
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
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
#' @param tracker
#' @export
print.tracker <- function(tracker) {

  cat("ggtrack tracking banner\n")
  cat("=======================\n\n")
  cat(glue("banner height: {tracker$height} cm \n"))
  cat("\n\nincluded elements:\n   - ")
  cat(tracker$contains, sep = '\n   - ')
  cat('\nelement positions:\n\n')
  tracker$pos

}

#' @title Print Tracker Object
#'
#' @param tracker
#'
#' @return
#' @export
#'
#' @examples
plot.tracker <- function(tracker) {

  tracker$track +
    labs(title = 'ggtrack tracker banner',
         subtitle = "add to a ggplot using add_banner(plot, tracker)")
}
