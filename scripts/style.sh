#!/bin/bash

echo "Finding and formatting C and header files..."

# Find all C and header files, list them, and run clang-format
find src include -name "*.c" -o -name "*.h" | while read file; do
  echo "Processing file: $file"
  clang-format -i "$file"
done

echo "Formatting complete."