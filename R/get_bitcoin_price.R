#'Bitcoin price
#'
#'returns with fresh bitcoin price
#' @return numeric
#' @export
#' @importFrom binancer binance_coins_prices
#' @importFrom logger log_error log_info
#' @importFrom checkmate assert_number
get_bitcoin_price <- function(retried = 0) {
  tryCatch({
    #nem használtuk a data.table, hogy ne kelljen meg egy csomagot beolvasnia
    btcusd <- subset(binance_coins_prices(), symbol == 'BTC')$usd
    assert_number(btcusd, lower = 3000, upper = 10000)
    log_info('Current price of a BTC is {dollar(btcusd)}')
    btcusd
  },
  error = function(e) {
    log_error(e$message)
    if (retried > 5) {
      stop('gave up')
    }
    Sys.sleep(1 + retried^2)
    get_bitcoin_price(retried = retried + 1)
  }
  )
}
