#!/bin/bash
#Написать интерактивный скрипт (меню с `select`).  

#Отображаем заголовок нашего ПО
show_header() {
    clear
    echo "ПОМОГАТОР 3000"
    echo
}

#Основное меню
main_menu() {
    PS3="Выберите действие:"
    options=(
        "Показать текущую дату и время"
        "Показать список файлов в текущей директории"
        "Выход"
    )

    show_header
    select opt in "${options[@]}"; do
        case $REPLY in
            1) show_date; break ;;
            2) show_files; break ;;
            3) exit 0 ;;
            *) echo "Неверный выбор. Попробуйте снова." ;;
        esac
    done
}

#Показыаем дату
show_date() {
    show_header
    echo "Текущая дата и время: $(date)"
    read -p "Нажмите Enter для продолжения..." -n 1
}

#Показываем список файлов текущей дериктории
show_files() {
    show_header
    ls -la
    read -p "Нажмите Enter для продолжения..." -n 1
}

#Циклично вызываем main_menu()
while true; do
    main_menu
done