#!/bin/bash

for file in $1/*; do 
	echo "${file%.*} $(grep -E -c "<Author>" $file)"
done | sort -n -r -k 2
