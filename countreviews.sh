#!/bin/bash

# For each file in the given file path:
for file in $1/*; do
        # Output the basename of the file, and the number of reviews (number of <Author> tags).	
	echo "$(basename $file .dat) $(grep -E -c "<Author>" $file)"
# Feed the output of the loop into a sort command.
done | sort -n -r -k 2
