FROM ghcr.io/mlocati/php-extension-installer:2.7 AS php-extension-installer
FROM php:8.3-cli-alpine3.21

COPY --from=php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/install-php-extensions

RUN install-php-extensions bcmath zip @composer
