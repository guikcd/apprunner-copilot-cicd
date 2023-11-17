#!/bin/bash
# https://docs.aws.amazon.com/apprunner/latest/dg/service-source-code-php.html

set -o monitor

trap exit SIGCHLD

# Start nginx 
nginx -g 'daemon off;' &

# Start php-fpm
php-fpm -F &

wait
