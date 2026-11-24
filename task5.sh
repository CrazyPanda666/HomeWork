#!/bin/bash
# Скрипт выводит студентов с оценкой выше заданного порога.

file=$1
threshold=$2

# 1. Проверка: переданы ли оба аргумента
if [[ -z "$file" ]] || [[ -z "$threshold" ]]; then
  echo "Использование: ./task5.sh файл_с_оценками.txt порог"
  echo "Пример: ./task5.sh grades.txt 80"
  exit 1
fi

# 2. Проверка: существует ли файл
if [[ ! -f "$file" ]]; then
  echo "Ошибка: файл '$file' не найден."
  exit 1
fi

echo "=== Студенты с оценкой выше $threshold ==="

# 3. Читаем файл построчно, сразу разбивая на 3 переменные
while read -r name grade subject; do
  
  # 4. Проверяем, что в колонке 'grade' действительно число (пропускаем заголовок)
  if [[ "$grade" =~ ^[0-9]+$ ]]; then
    
    # 5. Сравниваем оценку с порогом
    if [[ $grade -gt $threshold ]]; then
      echo "✅ $name: $grade баллов по предмету '$subject'"
    fi
    
  fi
  
done < "$file"
