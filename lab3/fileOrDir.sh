#!/usr/bin/bash

echo "enter file"
read dir

output=$(ls -la $dir)

if [[ $output == total* ]]; then
    echo "directory"
else
    echo "file"
fi