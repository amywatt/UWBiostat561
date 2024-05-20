rm(list=ls())
set.seed(10)
library(UWBiostat561)

n_vec <- c(5, 10)
clique_fraction_vec <- c(0.6, 0.9)
clique_edge_density_vec <- c(0.6, 0.9)
alpha_vec <- c(0.75)
trials <- 1
imp_numbers <- c(23)

result <- hw4_simulation(n_vec, clique_fraction_vec, clique_edge_density_vec, alpha_vec, trials, imp_numbers)

# it's always useful to save the date and R session info
date_of_run <- Sys.time()
session_info <- devtools::session_info()

save(result,
     date_of_run, session_info,
     file = "~/HW4_simulation.RData")
