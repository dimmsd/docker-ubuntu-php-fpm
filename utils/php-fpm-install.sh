#!/bin/sh
set -e

echo "PHP Version is "$PHP_VERSION

apt-get -y install --no-install-recommends \
    bc \
    php$PHP_VERSION \
    php$PHP_VERSION-xdebug \
    php$PHP_VERSION-cli \
    php$PHP_VERSION-fpm \
    php$PHP_VERSION-cli \
    php$PHP_VERSION-xml \
    php$PHP_VERSION-json \
    php$PHP_VERSION-curl \
    php$PHP_VERSION-mysql \
    php$PHP_VERSION-sqlite3 \
    php$PHP_VERSION-pgsql \
    php$PHP_VERSION-mbstring \
    php$PHP_VERSION-intl \
    php$PHP_VERSION-gd \
    php$PHP_VERSION-bz2 \
    php$PHP_VERSION-zip \
    php$PHP_VERSION-opcache \
    php$PHP_VERSION-bcmath \
    php$PHP_VERSION-dom \
    php$PHP_VERSION-xmlwriter \
    php$PHP_VERSION-xmlrpc \
    php$PHP_VERSION-ldap

if [ `echo "$PHP_VERSION<7.2"|bc` -eq 1 ]; then
    apt-get -y install --no-install-recommends php$PHP_VERSION-mcrypt
fi