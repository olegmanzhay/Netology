#!/bin/bash

# Имя контейнера базы данных
DB_CONTAINER="shvirtd-example-python-db-1"
NETWORK="shvirtd-example-python_backend"

# Логин и пароль для MySQL (лучше получать из переменной окружения)
MYSQL_ROOT="root"
MYSQL_ROOT_PASSWORD="YtReWq4321"


# Имя базы данных
DB_NAME="example"

DOCKER_BIN="/usr/bin/docker"
MYSQLDUMP_IMAGE="schnitzler/mysqldump"

# Дата для имени файла резервной копии
DATE=$(date "+%Y%m%d_%H%M%S")

# Папка для сохранения резервных копий
BACKUP_DIR="/home/admin-oleg/Desktop/Netology/shvirtd-example-python/backup"

# Создаём директорию для резервных копий, если её ещё нет
if [[ ! -d "$BACKUP_DIR" ]]; then
  mkdir -p "$BACKUP_DIR"
fi


#!/bin/bash

echo "Starting Backup Script..."
echo "Current working directory: $(pwd)"
echo "Docker version: $($DOCKER_BIN --version)"
echo "Network Name: $NETWORK"
echo "Backup Directory: $BACKUP_DIR"

# Ваша существующая логика резервного копирования остается неизменной

# Команда для резервного копирования (перенаправляем прямо в контейнер)
    docker run \
    --rm --entrypoint "" \
    --network $NETWORK \
    -v ./backup:/backup \
    schnitzler/mysqldump \
    mysqldump --opt -h $DB_CONTAINER  -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD "--result-file=/backup/$DATE-$DB_NAME.sql" $DB_NAME


echo "Резервная копия выполнена!"