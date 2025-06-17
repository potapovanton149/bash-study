#!/bin/bash
#Заменить все вхождения слова "error" на "WARNING" в лог-файле (`sed`). 

#Принимаем файл в виде аргумента
file=$1

#Заменяем "error" на "WARNING
sed 's/error/WARNING/g' $1

echo "Замена завершена"
exit 0