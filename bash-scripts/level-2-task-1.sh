#!/bin/bash
#Вывести все четные числа от 1 до 20.

num=0

while [ $num -lt 20 ]
do
    num=$((num+2))
    echo $num
done 

exit 0