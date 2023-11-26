#!/bin/bash

mkdir -p /run/php

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp config create --dbhost=${HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --allow-root

wp core install --url=localhost --title=${TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_PASS_ADMIN} --admin_email=${EMAIL} --allow-root

wp user create  ${WP_USER} ${WP_EMAIL_USER} --user_pass=${WP_USER_PASS} --role=subscriber --allow-root

exec /usr/sbin/php-fpm7.4 -F
