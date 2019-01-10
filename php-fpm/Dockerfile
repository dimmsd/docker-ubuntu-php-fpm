ARG UBUNTU_VERSION
FROM dimmsd/ubuntu-base:$UBUNTU_VERSION
MAINTAINER Dimm <tirri@yandex.ru>
ARG DEBIAN_FRONTEND=noninteractive
ARG PHP_VERSION

ENV PHP_VERSION=$PHP_VERSION

COPY ./utils/* /usr/local/bin/

RUN chmod +x /usr/local/bin/php-fpm-install.sh \
    && chmod +x /usr/local/bin/* \
    && apt-key update \
    && apt-get -y update \
    && /usr/local/bin/php-fpm-install.sh \
    && mkdir -p /var/www/default \
    && mkdir -p /var/www/main \
    && mkdir -p /run/php-fpm \
# Disable XDEBUG for cli
    && phpdismod -s cli xdebug \
# Install composer
    && /usr/local/bin/install-composer.sh \
# clean
    && apt-get -y autoremove \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && mkdir -p /tmp/xdebug \
    && mkdir -p /tmp/log-fpm \
# configure PHP-FPM
    && sed -i '/daemonize /c daemonize = no' /etc/php/$PHP_VERSION/fpm/php-fpm.conf \
    && sed -i '/^pid /c pid = /run/php-fpm.pid' /etc/php/$PHP_VERSION/fpm/php-fpm.conf \
    && sed -i '/error_log /c error_log = /tmp/log-fpm/error.log' /etc/php/$PHP_VERSION/fpm/php-fpm.conf \
    && sed -i '/^listen /c listen = 0.0.0.0:9000' /etc/php/$PHP_VERSION/fpm/pool.d/www.conf \
    && sed -i 's/^listen.allowed_clients/;listen.allowed_clients/' /etc/php/$PHP_VERSION/fpm/pool.d/www.conf \
    && sed -i '/^;pm.status_path/c pm.status_path = /status' /etc/php/$PHP_VERSION/fpm/pool.d/www.conf \
    && sed -i '/^;access.log/c access.log = /tmp/log-fpm/$pool.access.log' /etc/php/$PHP_VERSION/fpm/pool.d/www.conf

COPY ./php-fpm/ini/xdebug.ini /etc/php/$PHP_VERSION/mods-available/xdebug.ini

EXPOSE 9000

WORKDIR /var/www/main

CMD ["/usr/local/bin/php-fpm-foreground.sh"]

ARG COMMIT
ENV LAST_COMMIT=$COMMIT