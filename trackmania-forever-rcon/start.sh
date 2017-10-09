#!/bin/bash


# backgrounds itself
php-fpm7.0 --fpm-config /etc/php/7.0/fpm/php-fpm.conf

exec nginx -c /etc/nginx/nginx.conf -g "daemon off;"

