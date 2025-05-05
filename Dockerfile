FROM ghcr.io/mlocati/php-extension-installer:2.7 AS php-extension-installer
FROM php:8.3-cli-alpine3.21

RUN apk add --no-cache git

COPY --from=php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/install-php-extensions

RUN install-php-extensions bcmath zip @composer

RUN curl -SL https://www.1c-bitrix.ru/download/start_encode.tar.gz | tar -xzC /tmp
