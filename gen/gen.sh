#!/bin/bash
# Alex Pinch, ChatGPT
# Last updated Feb. 1st 2023

# This script generates a Newick tree with a specified number of nodes
# Use this script to get a file to test my Shiny app, Newick Viewer

nodes=$1

# Start the tree string with a first node of a random branch length (1-10,000)
tree_str="(node_1:$(echo "scale=1; $RANDOM/10000" | bc))"

# Adding the rest of the nodes
for ((i=2; i<=nodes; i++)); do
  branch_length=$(echo "scale=1; $RANDOM/10000" | bc)
  tree_str="($tree_str,node_$i:$branch_length)"
done

# Adding the final semicolon
tree_str="$tree_str;"

echo $tree_str > example.nwk

# Removing any pesky blank lines
grep "\S" example.nwk