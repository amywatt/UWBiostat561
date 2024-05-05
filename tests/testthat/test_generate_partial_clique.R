context("Testing generate_partial_clique")

test_that("generate_partial_clique works", {

  # Mock data and parameters for testing
  set.seed(10)
  n <- 10
  clique_fraction <- 0.5
  clique_edge_density <- 0.8
  res <- generate_partial_clique(n, clique_fraction, clique_edge_density)

  # Test the output 1) the output is a list, 2) the adj_mat element of the list is a matrix, 3) the dimension of the matrix is 10 by 10
  expect_true(is.list(res))
  expect_true(is.matrix(res$adj_mat))
  expect_true(all(dim(res$adj_mat) == c(10,10)))

  # Test if the matrix has the correct dimensions
  expect_equal(nrow(res$adj_mat), n)
  expect_equal(ncol(res$adj_mat), n)

  # Test if the matrix is symmetric
  expect_true(all.equal(res$adj_mat, t(res$adj_mat)))

  # Test if all values are either 0 or 1
  expect_true(all(res$adj_mat == 0 | res$adj_mat == 1))

  # Test invalid input
  expect_error(generate_partial_clique(-8, 0.9, 0.9))
  expect_error(generate_partial_clique(8.8, 0.9, 0.9))
  expect_error(generate_partial_clique(2, 1.2, 0.9))
  expect_error(generate_partial_clique(2, 0.9, 1.9))
})
