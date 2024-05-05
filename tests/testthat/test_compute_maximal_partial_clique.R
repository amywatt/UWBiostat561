context("Testing compute_maximal_partial_clique")

test_that("compute_maximal_partial_clique works", {
  set.seed(10)

  # Mock data and parameters for testing
  n <- 20
  clique_fraction <- c(0.2, 0.4, 0.6, 0.8, 0.2, 0.4, 0.6, 0.8, 0.2, 0.4, 0.6, 0.8)
  clique_edge_density <- c(0.2, 0.2, 0.2, 0.2, 0.5, 0.5, 0.5, 0.5, 0.8, 0.8, 0.8, 0.8)
  alpha1 <- 0.6
  alpha2 <- 0.9

  adj_mat_list <- c()
  res1 <- c()
  edge_density1 <- c()
  clique_idx1 <- c()
  res2 <- c()
  edge_density2 <- c()
  clique_idx2 <- c()

  for(i in 1:length(clique_fraction)){
    temp_adj_mat <- generate_partial_clique(n, clique_fraction[i], clique_edge_density[i])
    adj_mat_list <- c(adj_mat_list, list(temp_adj_mat$adj_mat))

    temp_max_clique1 <- compute_maximal_partial_clique(temp_adj_mat$adj_mat, alpha1)
    temp_max_clique2 <- compute_maximal_partial_clique(temp_adj_mat$adj_mat, alpha2)

    res1 <- c(res1, list(temp_max_clique1))
    edge_density1 <- c(edge_density1, temp_max_clique1$edge_density)
    clique_idx1 <- c(clique_idx1, list(temp_max_clique1$clique_idx))

    res2 <- c(res2, list(temp_max_clique2))
    edge_density2 <- c(edge_density2, temp_max_clique2$edge_density)
    clique_idx2 <- c(clique_idx2, list(temp_max_clique2$clique_idx))
  }

  # Test the output format
  expect_true(is.list(res1[[1]]))
  expect_true(is.numeric(res1[[1]]$clique_idx))
  expect_true(is.double(res1[[1]]$edge_density))

  # Test output satisfies edge density
  clique_idx <- res1[[1]]$clique_idx
  adj_mat <- adj_mat_list[[1]]
  m=length(clique_idx)
  expect_true((sum(adj_mat[clique_idx,clique_idx])-m)/2 >= alpha1*m*(m-1)/2)

  # Test the output format for list of mock data with different clique fractions
  for(i in 1:length(res1)) {
    res <- res1[[i]]
    adj_mat <- adj_mat_list[[i]]
    clique_idx <- res$clique_idx
    m=length(clique_idx)
    edge_density <- res$edge_density

    expect_true(is.list(res))
    expect_true(is.numeric(clique_idx))
    expect_true(is.double(edge_density))
    expect_true((sum(adj_mat[clique_idx,clique_idx])-m)/2 >= alpha1*m*(m-1)/2)
  }


  # Test edge densities different for different alpha
  expect_false(sum(edge_density1 == edge_density2) == length(edge_density1))

  # Test clique_idx different for different alpha
  expect_false(sum(unlist(lapply(seq_along(clique_idx1), function(i) identical(clique_idx1[[i]], clique_idx2[[i]])))) == length(clique_idx1))

  # Test edge densities different for same alpha different inputs
  expect_false(length(unique(edge_density1)) == 1)
  expect_false(length(unique(edge_density2)) == 1)

  # Test clique_idx different for same alpha different inputs
  expect_false(length(unique(clique_idx1)) == 1)
  expect_false(length(unique(clique_idx2)) == 1)

  # Test for errors for out of range alpha
  expect_error(compute_maximal_partial_clique(adj_mat_list[[1]], -1))

  # Test returned edge densities are within expected range
  expect_true(sum(unlist(lapply(seq_along(edge_density1), function(i) edge_density1[i] >= 0 && edge_density1[i] <= 1))) == length(edge_density1))
})
