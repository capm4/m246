FROM webdevops/php-apache:8.2-alpine

ARG ARG_WEB_DOCUMENT_ROOT=/app/pub
ARG ARG_fpm__global__error_log=/var/log/php_error.log
ARG ARG_LOG_STDOUT=/var/log/access_log
ARG ARG_LOG_STDERR=/var/log/error_log
ARG ARG_ROOT_PASSWORD="Docker!"

COPY ./ /app
WORKDIR /app

# Install Magento dependencies
RUN composer install --no-interaction --no-plugins --no-scripts

# Set file permissions
# RUN chown -R application:application /app
