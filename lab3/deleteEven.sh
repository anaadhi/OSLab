#!/bin/bash

input_file="counting.txt"

sed 'n;d' "$input_file" > "$input_file"
