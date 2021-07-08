
#' @title Estimate QR Size.
#'
#' @description A model predicting the required QR size based
#' on the number of bytes to be encoded. The model is generated in the
#' package vignette qr_calibrate
#'
#' @format A linear model
#'
"qr_mod"


#' @title Get QR Size
#'
#' @description Given a character string, calculate the minimum size
#' of a QR that will reliably scan off a computer monitor
#'
#' @param txt character to be encoded into the QR
#'
#' @return numeric size of QR in cm.
#' @export
#'
#' @examples
qr_size <- function(txt) {

  bts <- nchar(txt, 'bytes')
  pred <- predict(qr_mod, data.frame(bytes = bts))
  pred <- round(as.numeric(pred), 2)

  return(max(1.8, pred))
}
