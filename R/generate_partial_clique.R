#' Generate a random adjacency matrix with a partial clique
#'
#' This function generates a random adjacency matrix with a partial clique,
#' where a specified fraction of nodes forms the partial clique, and the
#' specified edge density applies within the clique.
#'
#' @param n The total number of nodes in the graph.
#' @param clique_fraction The fraction of nodes (of the n nodes) that are part of the partial clique.
#' @param clique_edge_density The edge density among the nodes in the clique.
#'
#' @return An adjacency matrix representing the generated graph.
#'
#' @examples
#' n <- 8
#' clique_fraction <- 0.5
#' clique_edge_density <- 0.8
#' random_adj_matrix <- generate_partial_clique(n, clique_fraction, clique_edge_density)
#' print(random_adj_matrix)
#'
#' @export
generate_partial_clique <- function(n, clique_fraction, clique_edge_density) {
  # Check input conditions
  if (!(n > 0 && n%%1 == 0)) {
    stop("n must be a positive integer")
  }

  if (!(clique_fraction >= 0 && clique_fraction <= 1)) {
    stop("clique_fraction must be a single numeric between 0 and 1 (inclusive)")
  }

  if (!(clique_edge_density >= 0 && clique_edge_density <= 1)) {
    stop("clique_edge_density must be a single numeric between 0 and 1 (inclusive)")
  }

  # Initialize an empty adjacency matrix
  adj_mat <- matrix(0, nrow = n, ncol = n)

  # Determine the number of vertices in the partial clique
  clique_size <- ceiling(n * clique_fraction)

  # Determine the number of edges in partial clique
  clique_edges <- (clique_size * (clique_size - 1))/2

  # Determine which edges to connect to satisfy density
  clique_edges <- c(rep(1, ceiling(clique_edges * clique_edge_density)), rep(0, clique_edges - ceiling(clique_edges * clique_edge_density)))

  # Randomize which edges are connected
  clique_edges <- sample(clique_edges)

  # Generate a random partial clique
  clique <- sort(sample(1:n, clique_size))

  # Connect vertices within the clique with specified edge density
  counter = 1
  for (i in 1:clique_size) {
    v1 <- clique[i]
    for (j in 1:clique_size) {
      v2 <- clique[j]
      if (j > i) {
        adj_mat[v1, v2] <- clique_edges[counter]
        adj_mat[v2, v1] <- clique_edges[counter]
        counter <- counter + 1
      }
    }
  }

  diag(adj_mat) <- 1

  # Output the adjacency matrix
  return(list(adj_mat = adj_mat))
}
