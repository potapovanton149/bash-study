#!/bin/bash
#Скрипт, который проверяет, существует ли файл /etc/passwd. Если да – вывести его первые 5 строк.

if [ -f "/etc/passwd" ]; then 
    echo "Файл /etc/passwd существует, первые пять строк файла:"
    echo
    head -n 5 /etc/passwd
else
    echo "Файл /etc/passwd не существует"
fi

exit 0