test_that("can create buildkite reporter", {
  reporter <- BuildkiteReporter$new()
  expect_s3_class(reporter, c("BuildkiteReporter", "Reporter", "R6"))
})
