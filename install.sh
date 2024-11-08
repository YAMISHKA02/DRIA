#!/bin/bash

# Функция для вывода текста оранжевым цветом (в терминале будет отображаться как желтый)
show() {
    # ANSI код для желтого цвета: \033[33m
    # Сброс цвета: \033[0m
    echo -e "\033[33m$1\033[0m"
}

# ASCII-арт "LEVEL UP"
show ".-----------------------------------------------."
show "| _     _______     _______ _       _   _ ____  |"
show "|| |   | ____\ \   / / ____| |     | | | |  _ \ |"
show "|| |   |  _|  \ \ / /|  _| | |     | | | | |_) ||"
show "|| |___| |___  \ V / | |___| |___  | |_| |  __/ |"
show "||_____|_____|  \_/  |_____|_____|  \___/|_|    |"
show "| _   _  ___  ____  _____ ____                  |"
show "|| \ | |/ _ \|  _ \| ____/ ___|                 |"
show "||  \| | | | | | | |  _| \___ \                 |"
show "|| |\  | |_| | |_| | |___ ___) |                |"
show "||_| \_|\___/|____/|_____|____/                 |"
show "'-----------------------------------------------'"

# Задержка 3 секунды
sleep 3

# Обновление пакетов
show "Обновление пакетов..."
sudo apt update -y && sudo apt upgrade -y

# Проверка и установка Ollama, если не установлен
if ! command -v ollama &>/dev/null; then
  show "Установка Ollama..."
  curl -fsSL https://ollama.com/install.sh | sh
else
  show "Ollama уже установлен."
fi

# Скачивание и установка dkn-compute-launcher
cd $HOME
if [ ! -f "dkn-compute-node.zip" ]; then
  show "Скачивание dkn-compute-launcher..."
  curl -L -o dkn-compute-node.zip https://github.com/firstbatchxyz/dkn-compute-launcher/releases/latest/download/dkn-compute-launcher-linux-amd64.zip
else
  show "dkn-compute-launcher уже скачан."
fi

show "Распаковка dkn-compute-launcher..."
unzip -o dkn-compute-node.zip
cd dkn-compute-node

# Запуск dkn-compute-launcher
show "Запуск dkn-compute-launcher..."
./dkn-compute-launcher
