#!/bin/bash
REPO_PATH="/c/Users/admin/Desktop/test_new/inav-configurator-8.0.1/inav-configurator-8.0.1" # Замените на путь к вашему репозиторию
BRANCH_NAME="main"                                  # Основная ветка репозитория

# Переходим в директорию репозитория
cd "$REPO_PATH" || exit

# Проверяем наличие изменений
if git diff-index --quiet HEAD --; then
    echo "Нет изменений для коммита."
    exit 0
fi

# Добавляем все изменения
git add .

# Получаем текущую дату для формирования сообщения коммита
DATE_STRING=$(date "+%Y-%m-%d")

# Создаём коммит с сообщением, содержащим текущую дату
git commit -m "Автоматическая фиксация изменений на текущую дату ${DATE_STRING}"

# Отправляем изменения на удалённый сервер
git push origin "${BRANCH_NAME}"