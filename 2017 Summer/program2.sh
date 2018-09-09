#!/bin/bash

# program2: receives an integer from user and conducts calculations.
# it then saves the result to a file.

MIN_VAL=1
MAX_VAL=100
TOTAL=0

while true; do
clear
read -p "Enter selection [1-100] > "
if [[ $REPLY =~ ^-?[0-9]+$ ]]; then
if [ $REPLY -ge $MIN_VAL -a $REPLY -le $MAX_VAL ]; then
break
else
continue
fi
else
echo "Invalid iput." >&2 
fi
done
for (( i=1; i < $REPLY+1; i=i+1)); do
echo $((TOTAL+= $((i%5))))
done
echo "Sum of numbers is" $TOTAL >> results.txt
echo "Sum of numbers is" $TOTAL
