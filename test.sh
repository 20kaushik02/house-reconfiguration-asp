#!/bin/bash

proj_dir='.'

input_dir="$proj_dir/simpleInstances"
output_dir="$proj_dir/output"

rm -r $output_dir
mkdir -p $output_dir

for f in $(ls $input_dir); do
	clingo "$proj_dir/hrp_soln.asp" "$input_dir/$f" -t 10 | tee >(fold -w 80 > "$output_dir/${f}_soln.txt") 2>&1
done
