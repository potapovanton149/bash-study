#!/bin/bash
#Скрипт, который принимает список файлов и копирует их в директорию backup.

array=("$@")    #Берем все преданные аргументы массивом

#Проверяем,все ли переданные аргументы являются фалойм. Если нет, завершение скрипта

for file in "${array[@]}"; do
    if ! [ -f "$file" ]; then 
        echo "ERROR! Аргумент $file не является файлом. Проверьте и попробуйте снова."
        exit 1
    fi
done

#Далее итерируем массив и сохраняем все файлы в директорию backup в домащнем каталоге.
#Если такой директории нет, то создадим ее

if ! [ -d ~/backup ]; then
    mkdir ~/backup
fi 

for file in "${array[@]}"; do
    cp "$file" ~/backup
done

echo "Копирование завершено успешно"

exit 0