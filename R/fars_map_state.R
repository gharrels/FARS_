#' Plot accidents by year and state
#'
#' This function will create a map plot of accidents in a state for one year
#'
#' @param state.num integer value representing a state in the FARS dataset (valid inputs: 1-56)
#' @param year integer value representing the year you want accidents plotted for
#'
#' @return A map plot of accidents in one state for one year
#'
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points
#'
#' @note State numbers outside the valid range (see above) will throw an error
#' @note States with no accidents to plot will produce a warning message
#'
#' @examples
#' \dontrun{fars_map_state(1, 2013)}
#' \dontrun{fars_map_state(56, 2015)}
#'
#' @export
fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- dplyr::filter(data, STATE == state.num)
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
