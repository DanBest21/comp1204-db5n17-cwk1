#!/bin/bash

ls $1 | while read file; do 
	cat $1/$file | while read line; do 
		grep -E "<Author>";
	done | echo "${file%.*} $(wc -l)"
done | sort -n -r -k 2
