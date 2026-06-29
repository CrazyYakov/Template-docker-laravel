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
APP_ENV="dev" # or production
CONTAINER_NAME=template

#APP
PHP_VERSION=8.3
USER_ID=1000
GROUP_ID=1000

#DATABASE
DB_DATABASE=app
DB_USERNAME=user
DB_PASSWORD=p@$$w0Rd

#SERVER
SERVER_HOSTNAME="localhost"
PORT=8000
```

Не забудьте добавить свой проект в шаблон. **УДАЧИ!**
