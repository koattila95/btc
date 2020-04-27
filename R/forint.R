#'forint formatter
#'
#'takes a number and returns as a nicely formatted string
#' @param x number
#' @return string
#' @export
#' @importFrom scales dollar
forint <- function(x) {
  dollar(x, prefix = '', suffix =' Ft')
}
