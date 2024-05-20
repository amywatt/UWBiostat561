context("Testing hw4_simulation")

test_that("hw4_simulation works", {

  # Mock data and parameters for testing
  set.seed(10)
  n_vec <- c(5)
  clique_fraction_vec <- c(0.6)
  clique_edge_density_vec <- c(0.6)
  alpha_vec <- c(0.75)
  trials <- 1
  imp_numbers <- c(23)
  res <- hw4_simulation(n_vec,
                        clique_fraction_vec,
                        clique_edge_density_vec,
                        alpha_vec,
                        trials,
                        imp_numbers)

  # Test the output 1) the output is a list, 2) output results table has same number of rows as implementations, 3) num tests is an integer
  expect_true(is.list(res))
  expect_true(is.data.frame(res$result))
  expect_true(is.integer(res$num_tests))

  # Test invalid input
  set.seed(10)
  n_vec <- c(5)
  clique_fraction_vec <- c(0.6)
  clique_edge_density_vec <- c(0.6)
  alpha_vec <- c(0.75)
  trials <- 1
  imp_numbers <- c()

  expect_error(hw4_simulation(n_vec,
                              clique_fraction_vec,
                              clique_edge_density_vec,
                              alpha_vec,
                              trials,
                              imp_numbers))

  set.seed(10)
  n_vec <- c(5)
  clique_fraction_vec <- c(0.6)
  clique_edge_density_vec <- c(0.6)
  alpha_vec <- c(0.75)
  trials <- -5
  imp_numbers <- c(23)

  expect_error(hw4_simulation(n_vec,
                              clique_fraction_vec,
                              clique_edge_density_vec,
                              alpha_vec,
                              trials,
                              imp_numbers))

  set.seed(10)
  n_vec <- c(5)
  clique_fraction_vec <- c(0.6)
  clique_edge_density_vec <- c(0.6)
  alpha_vec <- c(0.75)
  trials <- 0.5
  imp_numbers <- c(23)

  expect_error(hw4_simulation(n_vec,
                              clique_fraction_vec,
                              clique_edge_density_vec,
                              alpha_vec,
                              trials,
                              imp_numbers))
})
