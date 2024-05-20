# Please run this after running HW4_simulation_execute.slurm

rm(list=ls())
load("~/HW4_simulation.RData")
library(ggplot2)

# the plot we would like to make is:
#   how often each of the 25 methods get the maximal partial clique (over the trials)

# loop over the levels
df <- data.frame(
  implementation = rownames(result$result),
  value = result$result$num_largest_partial_clique)

p <- ggplot(data = df, aes(x = implementation, y=value)) +
  geom_bar(stat="identity")

ggplot2::ggsave(p, file = "~/UWBiostat561/vignettes/HW4_simulation_plot.png",
                height = 7, width = 9, units = "in")
