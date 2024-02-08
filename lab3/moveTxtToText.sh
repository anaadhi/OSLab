#!/usr/bin/bash

for file in `find ./* -name *.txt`
do
    new_file=$(echo $file | sed 's/\.txt$/\.text/')
    mv $file $new_file
done