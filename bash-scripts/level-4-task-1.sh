#!/bin/bash
#Найти все процессы `java` и убить их.

#Проверяем,есть ли вообще активные процессы
if ! pgrep java >/dev/null; then
    echo "Java процессы отсутствуют. Делать нечего."
    exit 0
fi 

echo "Поиск всех Java-процессов..."
ps -ef | grep java | grep -v grep
echo 

echo "Инициируем завершение процессов..."
pkill java
#Даем время для завершения
sleep 2
echo

#Проверяем все ли грохнули. Если нет,возвращаем ошибку
if pgrep java >/dev/null; then
    echo "Остались процессы, которые не удвлось завершить:"
    ps -ef | grep java | grep -v grep
    exit 1
else
    echo "Все Java-процессы завершены"
    exit 0
fi