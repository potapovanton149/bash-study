#!/bin/bash
#Логировать все запуски скрипта в файл `script.log`.  

#Логировать будем в домашнюю директорию
log_file="$HOME/script.log"

#Проверяем что файл script.log сущестует, если нет - создадим
if ! [ -f "$log_file" ]; then 
    touch "$HOME/script.log"
fi

#Функция логирования. Пишем время и переданнык аргументы
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" >> "$log_file"
}

# Логируем начало работы
log "Скрипт запущен: $0 $*"
log "Пользователь: $(whoami)"
log "Рабочая директория: $(pwd)"

#Основаня лошика скрипта
echo "Скрипт выполнялся иии... завершился успешно"

# Логируем завершение
log "Скрипт успешно завершен"

exit 0