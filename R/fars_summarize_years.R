#' Summarize FARS data by month and year
#'
#' This function will summarize the number of fatal accidents by month and year
#'
#' @param years A vector input of the years you would like to see summarized
#'
#' @return A table containing data on the number of accidents by year and month
#'
#' @importFrom dplyr bind_rows group_by summarize
#' @importFrom tidyr spread
#'
#' @note Year inputs you do not have data for will return an error. If you submit a vector with
#' at least one valid input, then only a warning message will be generated.
#'
#' @examples
#' \dontrun{fars_summarize_years(c(2013,2014))}
#' \dontrun{fars_summarize_years(c(2013,2014,2015))}
#'
#' @export
fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}
