#!/bin/bash
#Написать скрипт для бэкапа директории раз в день (использовать `tar` и `cron`).  

dir_path="$1" #Что копируем
backup_path="$2" #Куда копируем
current_date=$(date +%Y-%m-%d) #Текущая дата
backup_file="$backup_path/backup_$current_date.tar.gz" #Наименование готового архива
script_path="$(realpath "$0")" #Полный путь к скрипту
cron_job="0 3 * * * $script_path '$dir_path' '$backup_path'" #Джоба cron

#Базовые проверки
if [ ! -d "$dir_path" ]; then
    echo "ERROR: $dir_path не является директорией или ее не существует"
    exit 1
fi

if ! [ -d "$backup_path" ]; then 
    echo "Директория $backup_path не существует. Создадим ее."
    mkdir -p "$backup_path"
fi

#Добавляем задачу в cron
if ! crontab -l | grep -qF "$cron_job"; then
    (crontab -l ; echo "$cron_job") | crontab -
    echo "Задача добавлена в cron"
fi

#Проверем был ли бэкап (повторение задачи cron)
if [ ! -f "$backup_file" ]; then 
    if tar -czf "$backup_file" -C "$dir_path" .; then
        echo "Бэкап создан: $backup_file"
    else
        echo "Ошибка при создании бэкапа"
        exit 1
    fi
else
    echo "Бэкап за сегодня уже существует: $backup_file"
fi

exit 0