#' Create a filename reference
#'
#' This function will create a FARS filename reference for the year specified
#'
#' @param year A numeric input for the years you want to read in FARS data for
#'
#' @return This function will return a string for a filename corresponding to the year input
#'
#' @examples
#' \dontrun{make_filename(2013)}
#'
#' @export
make_filename <- function(year) {
  year <- as.integer(year)
  sprintf("accident_%d.csv.bz2", year)
}
