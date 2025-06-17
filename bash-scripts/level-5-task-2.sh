#!/bin/bash
#Скрипт, который мониторит доступность сайта (проверка `HTTP 200`).  

URL="$1" #URL для проверки
timeout=10  #Таймаут проверки в секундах

#Функция отправки алерта если статус не != 2**. Реализовано через wall для уведомления всех пользователей
#для простоты,но можно также запилить уведомление в телеграм или по почте
send_alert() {
    local message="$(date '+%Y-%m-%d %H:%M:%S') WARNING! Сайт $URL недоступен: $1"
    wall "$message"
    echo "$message"
}

#Функция, которая проверяет достуспность по curl
check_site() {
    local response
    
    #Используем curl с таймаутом и проверкой только заголовков. В устройство dev/null пишем все кроме статус кода
    response=$(curl -I -s -o /dev/null -w "%{http_code}" --connect-timeout $timeout "$URL")

    #Проверяем код возврата после проверки сайта
    local exit_code=$?
    
    #Если не 0, то считаем что подлючение не удалось
    if [ $exit_code -ne 0 ]; then
        send_alert "Ошибка подключения (curl code: $exit_code) или передан некорректный URL"
        return 1
    fi
    
    #Проверяем какой статус верну culr
    if [[ "$response" =~ ^2 ]]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - INFO! Сайт доступен, HTTP $response"
        return 0
    else
        send_alert "HTTP код $response"
        return 1
    fi
}

#Основной вызов фкнциии
check_site

#Код возврата в зависимости от обстановки
exit $?