context("rpv")

test_that("rpv produces points scattered uniformly at random in the unit simplex", {
  methods = c("normalization", "trigonometric", "simplex", "iterative", "exponential")
  ds = 2:4
  n = 100L
  for (method in methods) {
    for (d in ds) {
      rnds = rpv(n, d, method = method, shuffle = TRUE)
      checkmate::expect_matrix(rnds, nrows = n, ncols = d, any.missing = FALSE, all.missing = FALSE)
      testthat::expect_true(all(abs(rowSums(rnds) - 1) < 0.0001))
    }
  }
})
