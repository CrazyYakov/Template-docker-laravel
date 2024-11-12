#!/bin/bash

composer create-project laravel/laravel /var/www/app

composer install --working-dir=/var/www/app

php /var/www/app/artisan migrate

for fileConfig in /etc/supervisor/conf.d/*.conf; do
      supervisord -c $fileConfig
done

exec php-fpm