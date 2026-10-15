#!/bin/bash

if [[ $# -lt 1 || $# -gt 2 ]]; then
    echo "usage: $0 <column> [file.csv]" 1>&2
    exit 1
fi

column=$1
file=${2:-/dev/stdin}

cut -d',' -f"$column" "$file" | tail -n +2 | {
    sum=0
    count=0

    while read -r n; do
        sum=$(echo "$sum + $n" | bc)
        count=$((count + 1))
    done

    if [[ $count -eq 0 ]]; then
        echo "Error: no data rows" >&2
        exit 1
    fi

    mean=$(echo "scale=4; $sum / $count" | bc)
    echo "$mean"
}
