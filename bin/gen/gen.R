# Alex Pinch
# Last updated Feb. 1st 2023

# The plan for this script is to randomly generate many Newick trees and plot them
# Ideally, this will be a function within the Shiny app

library(ggplot2)
set.seed(6464);
tree <- rtree(60)
ggtree(tree, layout="circular", branch.length="none")