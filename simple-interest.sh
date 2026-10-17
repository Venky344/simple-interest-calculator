
#!/bin/bash

echo "Simple Interest Calculator"

read -r -p "Enter principal amount: " principal
read -r -p "Enter annual interest rate (%): " rate
read -r -p "Enter time period (years): " time

if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] ||
   ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] ||
   ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Enter valid non-negative numbers."
    exit 1
fi

interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" \
    'BEGIN { printf "%.2f", p * r * t / 100 }')

total=$(awk -v p="$principal" -v i="$interest" \
    'BEGIN { printf "%.2f", p + i }')

echo "Simple Interest: $interest"
echo "Total Amount: $total"
