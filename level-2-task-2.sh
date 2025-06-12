#!/bin/bash
#Скрипт, который принимает список файлов и копирует их в директорию backup.

array=\${@}
count=0

while [ $count -lt $# ]
do
    echo ${array[$count]}
    count=$((count+1))
done 

exit 0