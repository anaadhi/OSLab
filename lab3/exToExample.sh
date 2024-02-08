#!/usr/bin/bash

for file in `ls`
do
    cat $file | sed 's/^ex:|\.ex:/Example:/g' > $file
done