#!/bin/bash
#Написать функцию, которая считает факториал числа

factorial() {
    if [ $1 -le 1 ]; then
        echo 1
    else
        prev=$(( $1 - 1 ))
        result=$(factorial $prev)
        echo $(( $1 * result ))
    fi
}

echo "Факториал $1: $result"

exit 0