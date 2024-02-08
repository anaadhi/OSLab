#!/usr/bin/bash

echo "enter BASIC TA"
read basic TA

res=`echo "$basic + $TA + 0.1 * $basic" | bc`
echo $res