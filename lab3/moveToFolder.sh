#!/usr/bin/bash

echo "Enter extention"
read ext
echo "Enter folder name"
read folder

mkdir $folder

for file in `find ./ -name *.$ext`
do
    mv $file ./$folder
done