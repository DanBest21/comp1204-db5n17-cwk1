#!/bin/bash

for file in $1/*; do
	total=0
	for score in $(grep "<Overall>" $file | sed 's/^.*<Overall>//; s/\r$//'); do
		total=$((total + score));
	done
	echo "$(basename $file .dat) $(echo $total $(grep -E -c "<Author>" $file) | awk '{printf("%.2f\n", $1/$2)}')";
done | sort -n -r -k 2
