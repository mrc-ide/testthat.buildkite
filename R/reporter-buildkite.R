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

    ctxt_all = list(),

    initialize = function(...) {
      super$initialize(...)
    },

    add_result = function(context, test, result) {
      super$add_result(context, test, result)
      self$ctxt_all <- c(self$ctxt_all,
                         list(list(context = context, test = test, result = result)))
    },

    show_status = function(...) {
      super$show_status(...)
      browser()
      data <- super$status_data()
    }
  )
)

