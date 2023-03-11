#!/bin/bash

directory_path="data/references/simulation_short_read"
output_directory="data/processed"

echo "Calculating abundance sums for files in $directory_path..."

report_file="$output_directory/report_abundance.tsv"
rm -f "$report_file"

for file in "$directory_path"/abundance*.tsv; do
    if [[ -f $file ]]; then
        file_name=$(basename "$file")
        read_sum=$(awk '{sum += $2} END {print sum}' "$file")
        echo -e "$file_name\t$read_sum" >> "$report_file"
    fi
done

echo "Report generated at $report_file"
