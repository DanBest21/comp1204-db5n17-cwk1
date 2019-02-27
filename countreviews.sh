#!/bin/bash

cat $1 | while read line; do grep -E "<Author>"; done | wc -l
