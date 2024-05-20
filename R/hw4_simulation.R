#' Simulation for computing maximum partial clique in various implementations
#'
#' This function takes in inputs to generate random adjacency matrices with varying number of nodes, partial clique fractions, and edge densities.
#' These matrices are used to test which implementations of compute maximum partial clique return the largest valid clique most frequently.
#'
#' @param n_vec vector of inputs for number of nodes in adjacency matrix generation
#' @param clique_fraction_vec vector of inputs for clique fraction in adjacency matrix generation
#' @param clique_edge_density_vec vector of inputs for edge density in adjacency matrix generation
#' @param alpha_vec vector of alpha values to use when computing maximum partial clique
#' @param trials number of trials per parameterization of adjacency matrix
#' @param imp_numbers vector of implementations of compute_maximum_partial_clique
#'
#' @return a list with dataframe with implementation number and number of times each implementation calculated the largest valid partial clique and the number of tests run
#' @export
#'
#' @examples
#' n_vec <- c(15)
#' clique_fraction_vec <- c(0.6, 0.9)
#' clique_edge_density_vec <- c(0.6, 0.9)
#' alpha_vec <- c(0.75, 0.95)
#' trials <- 1
#' imp_numbers <- c(23)
#'
#' hw4_simulation(n_vec, clique_fraction_vec, clique_edge_density_vec, alpha_vec, trials, imp_numbers)
hw4_simulation <- function(n_vec,
                       clique_fraction_vec,
                       clique_edge_density_vec,
                       alpha_vec,
                       trials,
                       imp_numbers) {

  ## Check inputs
  stopifnot(is.vector(n_vec),
            !is.null(n_vec),
            is.vector(clique_fraction_vec),
            !is.null(clique_fraction_vec),
            is.vector(clique_edge_density_vec),
            !is.null(clique_edge_density_vec),
            is.vector(alpha_vec),
            !is.null(alpha_vec),
            is.numeric(trials),
            isTRUE(trials%%1 == 0),
            isTRUE(trials > 0),
            is.vector(imp_numbers),
            !is.null(imp_numbers),
            is.numeric(imp_numbers),
            isTRUE(sum(imp_numbers > 0) == length(imp_numbers)))

  ## Initiate df to store results of compute partial clique for all the implementations
  ncol <- length(n_vec) * length(clique_fraction_vec) * length(clique_edge_density_vec) * length(alpha_vec) * length(trials)
  results_df <- data.frame(matrix(nrow = length(imp_numbers), ncol = ncol))
  valid_clique_sizes_df <- data.frame(matrix(nrow = length(imp_numbers), ncol = ncol))
  rownames(results_df) <- paste0("implementation ", imp_numbers)
  rownames(valid_clique_sizes_df) <- paste0("implementation ", imp_numbers)

  ## Initiate a counter
  trial_num <- 1

  for(n in n_vec){
    for(clique_fraction in clique_fraction_vec) {
      for(clique_edge_density in clique_edge_density_vec) {
        for(a in alpha_vec) {
          for(t in 1:trials) {
            ## Rename column of results df
            colnames(results_df)[trial_num] <- paste0("n: ", n, "; f: ", clique_fraction, "; d: ", clique_edge_density, "; a: ", a)
            colnames(valid_clique_sizes_df)[trial_num] <- paste0("n: ", n, "; f: ", clique_fraction, "; d: ", clique_edge_density, "; a: ", a)

            ## Increment counter
            trial_num <- trial_num + 1

            ## Generate partial clique
            partial_clique <- UWBiostat561::generate_partial_clique(n = n,
                                                                    clique_fraction = clique_fraction,
                                                                    clique_edge_density = clique_edge_density)
            adj_mat <- partial_clique$adj_mat

            ## Calculate max partial clique for each method and store the results
            for(imp in imp_numbers) {
              result <- UWBiostat561::compute_maximal_partial_clique_master(adj_mat = partial_clique$adj_mat,
                                                                            alpha = a,
                                                                            number = imp,
                                                                            time_limit = 30)
              results_df[[imp, trial_num - 1]] <- list(result)
              ifelse(result$valid,
                     valid_clique_sizes_df[[paste0("implementation ", imp), trial_num - 1]] <- length(result$clique_idx),
                     valid_clique_sizes_df[[paste0("implementation ", imp), trial_num - 1]] <- NA)
            }
          }
        }
      }
    }
  }

  ## Calculate the largest valid partial clique sizes for each trial
  max_vals <- sapply(valid_clique_sizes_df, max, na.rm = TRUE)
  valid_clique_sizes_df <- rbind(valid_clique_sizes_df, max_vals)
  rownames(valid_clique_sizes_df)[nrow(valid_clique_sizes_df)] <- "max"

  num_largest_partial_clique <- c()

  ## Count how many times each implementation returned the largest partial clique
  for(imp in 1:length(imp_numbers)) {
    num_largest_partial_clique <- c(num_largest_partial_clique, sum(ifelse(is.na(valid_clique_sizes_df[imp,]), 0, valid_clique_sizes_df[imp,]) == max_vals))
  }

  num_largest_partial_clique <- c(num_largest_partial_clique, NA)

  valid_clique_sizes_df$num_largest_partial_clique <- num_largest_partial_clique

  ## Get the last col and remove max_val row to return
  result <- (valid_clique_sizes_df[-nrow(valid_clique_sizes_df), ])[ncol(valid_clique_sizes_df)]

  return(list(result = result, num_tests = ncol))
}
