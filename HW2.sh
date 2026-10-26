#!/bin/bash
# 1
#текст для пользователя
echo "Введи параметр -u или -l: "
read bukva
echo "Введи слово:"
read word
#Условие для определния регистра
if [[ $bukva == "-u"* ]]; then
 echo "Регистр верхний:" ${word^^}
elif [[ $bukva == "-l"* ]]; then
 echo "Регистр нижний:" ${word,,}
elif [ $bukva != "-u"* ] || [ $bukva != "-l" ]; then
 echo "Ошибка"
fi

#2

echo "Путь до файла: "
read file_path
echo "Исходный формат: "
read base_format
echo "Желаемый формат"
read result_format
if [ $base_format == ".txt" ] || [ $base_format == ".pdf" ] || [ $base_format == ".doc" ]; then
 echo ${file_path//$base_format/$result_format}
else
 echo "Введённый Вами формат не поддерживается"
 echo "Поддерживаемые файлы: .txt, .pdf и .doc"
fi

#3
echo "Введите три значения или слова: "
read -r -a parametrs_enter
if [[ ${#parametrs_enter[@]} -ne 3 ]]; then
 echo "Error"
else
 echo "Start analysis"
fi

#4

#проверяем передан ли аргумент(путь до файла и файл)
if [ $# -ne 1 ]; then
  echo "Ошибка, файл не найден.Укажите путь до файла"
  exit 1
fi
FILE="$1"
#Проверяем существует ли данный ФАЙЛ
if [ ! -f "$FILE" ]; then
  echo "Ошибка: файл не найден: $FILE"
  exit 2
fi
#Проверяем FASTA-файл или нет
case "$(head -n 1 "$FILE")" in
  ">"*)
    echo "Данный файл является FASTA-файлом"
    ;;
  *)
    echo "Ошибка. Данный файл не является FASTA-файлом "
esac

#5

#проверяем передан ли аргумент(путь до файла и файл)
if [ $# -ne 1 ]; then
  echo "Ошибка, файл не найден.Укажите путь до файла"
  exit 1
fi

FILE_1="$1"

#Возьмём отдельно только имя файла
LINK=$(basename "$FILE_1")

#Проверяем существует ли данный ФАЙЛ
if [ ! -f "$FILE_1" ]; then
  echo "Ошибка: файл не найден: $FILE_1"
else
#Создаём мягкую ссылку
  ln -s "$FILE_1" "$LINK"
fi
echo "Мягкая ссылка на файл $FILE_1 создана"
echo "$LINK -> $FILE_1"

#6

#проверяем передан ли аргумент(путь до файла и файл)
if [ $# -ne 1 ]; then
  echo "Ошибка, файл не найден.Укажите путь до файла"
  exit 1
fi

FILE_first="$1"
param="$2"

if [ ! -f "$FILE_first" ]; then
  echo "Ошибка: файл не существует"

elif [ "$param" != "rat" ] || [ "$param" != "mouse" ] ||\
  [ "$param" != "human" ] || [ "$param" != "fly" ]; then
  echo "Ошибка: Организм не поддерживается."
  echo "Поддерживаемые организмы: human, rat, mouse, fly"

else
echo "Обрабатываю $FILE_first"

#7

#Проверка того, что аргумент передан
if [ $# -ne 1 ]; then
  echo "Ошибка: укажите путь"
  exit 1
fi

TARGET="$1"

#Существует ли файл или директория
if [ ! -e "$TARGET" ]; then
  echo "Ошибка: не существует: $TARGET"
  exit 2
fi

#Условия на директорию или файл
if [ -d "$TARGET" ]; then
  echo "Это директория. Вложения: "
  ls -l "$TARGET"
else
  echo "Файл. Информация о файле"
  ls -l "$TARGET"
  echo "Число строк: $(wc -l < "$TARGET")"
fi
