#!/bin/bash

workdir=/var/www/app;

if [ -z "$(ls -A $workdir)" ]; then
  composer create-project laravel/laravel $workdir
fi

composer install --working-dir=$workdir

php $workdir/artisan migrate

for fileConfig in /etc/supervisor/conf.d/*.conf; do
      supervisord -c $fileConfig
done

exec php-fpm