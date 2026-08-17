# Docker compose - шаблон

> Шаблон для развертывания Web - проекта.

Ниже представлен стэк технологии, которые чаще всего используются в проектах:
1. PHP
2. PostgreSQL 18
3. Nginx
4. Redis

## Установка шаблона

```bash
git clone https://github.com/CrazyYakov/Template-docker-laravel.git template-app

cd template-app

rm -rf .git
```

## Настройка контейнеров

Перед тем как поднять контейнера добавьте эти параметры в `.env` файл:
```dotenv
#COMMON
DOCKER_CONTAINER_NAME=template

#APP
DOCKER_PHP_VERSION=8.3
DOCKER_USER_ID=1000
DOCKER_GROUP_ID=1000

#DATABASE
DB_DATABASE=app
DB_USERNAME=user
DB_PASSWORD=p@$$w0Rd

DOCKER_PUBLIC_DB_PORT=5454
DOCKER_PUBLIC_SERVER_PORT=8000

#SERVER
DOCKER_SERVER_HOSTNAME="localhost"
DOCKER_SERVER_PORT=8000
```

Не забудьте добавить свой проект в шаблон. **УДАЧИ!**
