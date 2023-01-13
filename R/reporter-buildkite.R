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
      self$update_interval <- 1
    },

    update = function(force = FALSE) {
      if (!force && !self$should_update()) return()

      message <- paste(
        testthat:::summary_line(self$n_fail, self$n_warn, self$n_skip, self$n_ok),
        if (length(self$files) > 0) "@" else "Starting up...",
        paste(testthat:::context_name(names(self$files)), collapse = ", ")
      )
      message <- testthat:::strpad(message, self$width)
      message <- cli::ansi_substr(message, 1, self$width)
      self$cat_tight(self$cr(), message)
    }
  )
)

