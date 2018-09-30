require(testthat)
library(FARS)

test_that("fars_read throws an error with invalid input", {
  expect_that(fars_read(make_filename(9999)), throws_error())
})
