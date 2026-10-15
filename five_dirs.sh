#!/bin/bash

mkdir -p five

for i in $(seq 5); do
    mkdir -p five/dir$i
    for j in $(seq 4); do
	for k in $(seq $j); do
	    echo "$j"
	done > five/dir$i/file$j
    done
done
