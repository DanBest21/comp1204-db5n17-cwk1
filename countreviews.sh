#!/bin/bash

# For each file in the given file path:
for file in $1/*; do
        # Output the basename of the file followed by the number of <Author> tags in that 
	# file - which will represent the number of reviews.	
	echo "$(basename $file .dat) $(grep -E -c "<Author>" $file)"
# Once the loop is completed, feed the output via a pipeline into the sort command, which sorts
# numerically (-n), in reverse order/highest to lowest (-r) and the field which needs to be
# sorted (-k 2).
done | sort -n -r -k 2
