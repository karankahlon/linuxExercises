#!/bin/bash

cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d , -f 7 | { sum=0; numVals=0;  while read n; do sum=$(($sum + $n)); numVals=$(($numVals + 1)); done; bc -l <<< "$sum / $numVals";}
