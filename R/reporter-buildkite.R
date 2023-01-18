#' Test reporter: Buildkite format.
#'
#' This reporter is an extension of ParallelProgressReporter see
#' source https://github.com/r-lib/testthat/blob/main/R/reporter-progress.R#L386
#' The overriden functions here are modified versions of the functions
#' on the ParallelProgressReporter.
#'
#' This reporter gives us
#' * Regularly updates progress logs
#' * Time for each test file to run
#' * All errors and warnings
#'
#' This overrides some functions so that
#' * It is less chatty (updates every 1 second) so build log is not too long
#' * There is no spinner (as we are not running interactively)
#'
#' In the future we could extend this to
#' * Have more foldable sections
#' * Report time for every test within a file
#'
#' @export
#' @family reporters
BuildkiteReporter <- R6::R6Class(
  "BuidlkiteReporter",
  inherit = testthat::ParallelProgressReporter,
  public = list(

    initialize = function(...) {
      super$initialize(...)
      self$update_interval <- 1 ## Print a progress message every second
      self$min_time <- 0 ## Print run time for all test files
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

