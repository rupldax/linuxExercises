#!/bin/bash

mkdir -p five

for i in {1..5}; do
    mkdir -p five/dir$i
    for j in {1..4}; do
	for ((k=1; j<=j; k++)); do
	    echo "$j"
	done > fice/dir$i/file$j
    done
done
