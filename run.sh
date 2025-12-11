#!/bin/bash
set -e   # Stop if any command fails

# Step 1: Build semantic tree
python src/build_tree.py --output tree.json

# Step 2: Run tree-based retrieval
python src/tree_retrieval.py \
    --tree tree.json \
    --queries queries/queries_val.jsonl \
    --output query_results_tree.jsonl

# Step 3: Run baseline
python helpers/flat_retrieval.py

echo "All outputs generated successfully!"
