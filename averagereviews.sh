#!/bin/bash

# For each file in the given file path:
for file in $1/*; do
	total=0
	i=0
	# For each rating found (i.e. the number after each <Overall> tag in the file):
	for rating in $(grep "<Overall>" $file | sed 's/^.*<Overall>//; s/\r$//'); do
		# Add the rating to the total and increment the i value.
		total=$((total + rating))
		i=$((i + 1));
	done
	# Get the name of the file without the extension and file path.
	name=$(basename $file .dat)
	# Calculate the overall rating and round it to two decimal places using awk, and then output this.
	awk -v name="$name" -v total="$total" -v i="$i" 'BEGIN{printf "%s %.2f\n", name, total/i}';
# Feed the output of the loop into a sort command.
done | sort -n -r -k 2
