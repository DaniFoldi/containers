FROM php:8.1-fpm-alpine as app
RUN docker-php-ext-install mysqli \
  docker-php-ext-enable mysqli