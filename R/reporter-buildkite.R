#' Test reporter: Teamcity format.
#'
#' This reporter will output results in the Teamcity message format.
#' For more information about Teamcity messages, see
#' http://confluence.jetbrains.com/display/TCD7/Build+Script+Interaction+with+TeamCity
#'
#' @export
#' @family reporters
BuildkiteReporter <- R6::R6Class(
  "BuidlkiteReporter",
  inherit = testthat::ParallelProgressReporter,
  public = list(
    initialize = function(...) {
      super$initialize(...)
    }
  )
)

