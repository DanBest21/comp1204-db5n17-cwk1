#!/bin/bash

# For each file in the given file path:
for file in $1/*; do
	total=0
	i=0
	for rating in $(grep "<Overall>" $file | sed 's/^.*<Overall>//; s/\r$//'); do
		total=$((total + rating))
		i=$((i + 1));
	done
	name=$(basename $file .dat)
	echo | awk -v name="$name" -v total="$total" -v i="$i" '{printf "%s %.2f\n", name, total/i}';
done | sort -n -r -k 2
