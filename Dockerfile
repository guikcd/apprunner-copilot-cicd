FROM composer as vendor


WORKDIR /tmp/

COPY composer.json composer.json
COPY composer.lock composer.lock


RUN composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist


FROM php:8.1

COPY . /var/www/html
COPY --from=vendor /tmp/vendor/ /var/www/html/vendor/
