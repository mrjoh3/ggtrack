

#' @title Define Tracker Container Positions
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
#'
#' @return data.frame
#' @export
#'
#' @examples
#'
#' get_positions(order = 'CLQ', positions = c(55, 25, 20))
#'
get_positions <- function(order, positions) {

  order <- toupper(order)
  stopifnot(order %in% c('CLQ','LCQ','QLC','CQL'))
  stopifnot(sum(positions) == 100)
  stopifnot(length(positions) == 3)

  pos <- data.frame(order = unlist(strsplit(order, split = "")),
                    position = positions,
                    xmin = 0,
                    xmax = 1,
                    stringsAsFactors = FALSE)

  pos[1, 'xmax'] <- pos[2, 'xmin'] <- (positions[1] / 100)
  pos[2, 'xmax'] <- pos[3, 'xmin'] <- ((positions[1] + positions[2]) / 100)

  return(pos)

}
