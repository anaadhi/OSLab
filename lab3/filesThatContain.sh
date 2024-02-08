#!/usr/bin/bash
echo "enter string"
read string
echo "Enter path"
read path


for file in `grep $string $path/* -l`
do
    basename $file
done