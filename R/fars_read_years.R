#' Read in multiple years of FARS data
#'
#' This function summarizes fatal accidents by month and year based on multiple FARS datafiles
#'
#' @param years A vector input of the years you would like to import data for
#'
#' @return A list with each element containing a list of fatal accidents with the variables month and year
#'
#' @note Any year inputs that you do not have data for will generate a warning message.
#'
#' @importFrom dplyr mutate select
#'
#' @examples
#' \dontrun{fars_read_years(c(2013,2014))}
#' \dontrun{fars_read_years(c(2013,2014,2015))}
#'
#' @export
fars_read_years <- function(years) {
  lapply(years, function(year) {
    file <- make_filename(year)
    tryCatch({
      dat <- fars_read(file)
      dplyr::mutate(dat, year = year) %>%
        dplyr::select(MONTH, year)
    }, error = function(e) {
      warning("invalid year: ", year)
      return(NULL)
    })
  })
}
