#!/bin/bash
#Скрипт с функцией `search`, которая ищет слово в файле (аналог `grep`).

#Аллоцируем перменные. Принимаем два аргумента - слово и считывемый файл.
word=$1
file=$2
#Для строк из файла аллоцируем массив
declare -a array

#Пишем в массив файл построчно
while IFS= read -r line; do
  array+=("$line")
done < "$file"

#Функция, которая будет искать в передаемой строке подстроку
search() {
    if [[ "$1" == *"$word"* ]]; then
        return 0
    else 
        return 1
fi
}

#Итерируем массив и через функцию search() ищем подстроку
for line in "${array[@]}"; do
  search "$line"
  if [ $? -eq 0 ]; then
  echo "$line"
  fi
done

exit 0