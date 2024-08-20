#!/bin/bash

# Find all .py files and process each one
find $1 -type f -name "*.py" | while read -r file; do
    # Echo the relative file path
    echo "$file"
    # Add a new line
    echo
    # Cat the contents of the file
    cat "$file"
    # Add another new line for separation
    echo
done | wl-copy