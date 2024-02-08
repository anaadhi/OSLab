#!/usr/bin/bash

read num

for(( i=2; i < num / 2 + 1;i++ )) 
do 
    if [[ $(($num % i)) -eq 0 ]]
    then
        echo "not prime"
        exit 0
    fi
done

echo "prime"