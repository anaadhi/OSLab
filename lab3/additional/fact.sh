#!/usr/bin/bash

read num

res=1

for (( i=1; i <= num; i++ )); do
    (( res*=i ))
done

echo $res