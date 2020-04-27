#'forint exchange rate
#'
#'returns the exchange rate in forint of one dollar
#' @return numeric
#' @export
#' @importFrom httr GET
get_usdhuf <- function() {
  usdhuf <- content(GET('https://api.exchangeratesapi.io/latest?base=USD'))$rates$HUF
  log_info('Current USD/HUF rate is {usdhuf}')
  usdhuf
}
