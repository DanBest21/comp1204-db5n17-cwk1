#!/bin/bash

for file in $1/*; do 
	echo "$(basename $file .dat) $(grep -E -c "<Author>" $file)"
done | sort -n -r -k 2
