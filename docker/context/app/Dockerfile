FROM php:8.3-fpm-alpine

ARG COMPOSER_URL
ARG USER_NAME
ARG USER_ID
ARG APP_ENV="dev"

RUN apk update && apk add --no-cache \
    zip \
    libzip-dev \
    freetype \
    libjpeg-turbo \
    libpng \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    supervisor \
    curl \
    $PHPIZE_DEPS \
    linux-headers

RUN docker-php-ext-install mysqli pdo pdo_mysql && \
    docker-php-ext-enable mysqli pdo pdo_mysql

RUN curl -sS ${COMPOSER_URL} | php -- --install-dir=/usr/local/bin --filename=composer


COPY ./entrypoint.sh /var/www/entrypoint.sh

RUN if [ ${APP_ENV} == "dev" ]; then \
      apk add --no-cache $PHPIZE_DEPS linux-headers; \
      pecl install xdebug && docker-php-ext-enable xdebug;  \
    fi

EXPOSE 9000

RUN addgroup -g ${USER_ID} -S ${USER_NAME}  \
    && adduser -u ${USER_ID} -D -S ${USER_NAME} ${USER_NAME}

USER ${USER_NAME}

COPY ./config/supervisord/*.conf /etc/supervisor/conf.d/

CMD php-fpm