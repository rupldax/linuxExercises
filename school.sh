#!/bin/bash

cat Property_Tax_Roll.csv |
grep "MADISON SCHOOLS" |
cut -d ',' -f 7 |
{
    sum=0
    count=0

    while read -r value
    do
        sum=$((sum + value))
        count=$((count + 1))
    done

    if [[ $count -gt 0 ]]
    then
        awk -v s="$sum" -v n="$count" 'BEGIN {print s/n}'
    else
        echo "No matching properties found" >&2
    fi
}
