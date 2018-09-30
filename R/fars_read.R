#' Read FARS files in
#'
#' This function will read in fars data files
#'
#' @param filename A string reference to a filename to read in or the actual filename you want to read in
#'
#' @return This function will return a dataset corresponding to the file you
#' requested to be loaded
#'
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#'
#' @examples
#' \dontrun{fars_read("accident_2013.csv.bz2")}
#' \dontrun{fars_read(make_filename(2013))}
#'
#' @note Non-existent filenames will return an error
#'
#' @export
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}
