#!/usr/bin/env bash
# Output date in format: 30 ago 2026 (Portuguese short month names)
set -euo pipefail

# Portuguese abbreviated month names (lowercase as in example)
months=(jan fev mar abr mai jun jul ago set out nov dez)

day=$(date +"%-d")
month_num=$(date +"%-m")
# year=$(date +"%Y")

# Convert month_num to zero-based index safely (handle leading zeros)
idx=$((10#$month_num - 1))
month=${months[$idx]}

# echo "$day $month $year"
echo "$day $month"
