ARG PHP_VERSION=8.3

FROM php:${PHP_VERSION}-fpm-alpine AS base

ARG APP_HOME=/var/www/app
WORKDIR ${APP_HOME}

RUN apk add --no-cache \
    bash \
    git \
    unzip \
    zip \
    libzip-dev \
    freetype \
    libjpeg-turbo \
    libpng \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    postgresql-dev \
    curl \
    icu-dev \
    oniguruma-dev \
    $PHPIZE_DEPS \
    linux-headers

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install pdo pdo_pgsql pgsql gd opcache bcmath && \
    pecl install redis && \
    docker-php-ext-enable pdo_pgsql pgsql gd redis opcache

COPY . ${APP_HOME}

RUN if [ -f composer.json ]; then \
      composer install --no-interaction --prefer-dist --no-progress --optimize-autoloader --no-dev; \
    fi && \
    mkdir -p storage bootstrap/cache public && \
    chown -R www-data:www-data ${APP_HOME}

USER www-data

EXPOSE 9000

CMD ["php-fpm"]
