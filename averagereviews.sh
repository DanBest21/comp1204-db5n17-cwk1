#!/bin/bash

for file in $1/*; do
	echo "$(basename $file .dat) $(grep -E "<Overall>" $file)"
done | sort -n -r -k 2
