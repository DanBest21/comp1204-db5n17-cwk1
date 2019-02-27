#!/bin/bash

ls $1 | while read fn; do 
	cat $1/$fn | while read line; do 
		grep -E "<Author>";
	done | wc -l
done
