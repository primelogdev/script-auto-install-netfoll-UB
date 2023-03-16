#!/bin/bash

# Генерируем случайную последовательность букв на латинице
ran=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 10 | head -n 1)

# Выводим приветственное сообщение и меню
echo "Welcome!"
echo "1 - Install git and python3"
echo "2 - Install Netfoll"
echo "3 - Exit"

# Читаем ввод пользователя
read choice

# Обрабатываем выбор пользователя
case $choice in
  1)
    # Устанавливаем git и python3
    sudo apt install git
    sudo apt install python3
    echo "Success!"
    echo "1 - To main menu"
    echo "2 - Exit"
    read subchoice
    case $subchoice in
      1)
bash "${PWD}/install.sh";;
      2)
        exit ;;
    esac
    ;;
  2)
    # Создаем директорию и клонируем репозиторий Hikka
    mkdir $ran
    cd $ran
    git clone https://github.com/MXRRI/Netfoll
    cd Netfoll
    echo "Netfoll installed successfully!"
    echo "Netfoll start command is cd $PWD && python3 -m hikka --root"
    echo "1 - Start Netfoll"
    echo "2 - Exit"
    read subchoice
    case $subchoice in
      1)
       python3 -m hikka --no-web;;
      2)
        exit ;;
    esac
    ;;
  3)
    exit ;;
  *)
    echo "Invalid choice. Please try again."
    exec "${0}" ;;
esac

