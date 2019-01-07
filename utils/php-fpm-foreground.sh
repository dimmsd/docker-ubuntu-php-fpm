#!/bin/sh
set -e

if [ ! -z "$TIMEZONE" ]
then
    # set php timezone
    echo "date.timezone = $TIMEZONE" > /etc/php/${PHP_VERSION}/fpm/conf.d/tz.ini
    echo "date.timezone = $TIMEZONE" > /etc/php/${PHP_VERSION}/cli/conf.d/tz.ini

    # set system timezone
    rm /etc/localtime
    ln -s /usr/share/zoneinfo/$TIMEZONE /etc/localtime
fi

# create user
if [ ! -z "$OWN_GID" ] && [ ! -z "$OWN_UID" ] && [ ! -z "$OWN_USER" ]; then
if ! id -u $OWN_GID > /dev/null 2>&1; then
    groupadd -g ${OWN_GID} ${OWN_USER}
fi
if ! id -u $OWN_UID > /dev/null 2>&1; then
    useradd -ms /bin/bash -g ${OWN_GID} -u ${OWN_UID} ${OWN_USER}
    gpasswd -a ${OWN_USER} www-data
fi
fi

if id -u $OWN_USER > /dev/null 2>&1; then
    sed -i "/^user /c user = ${OWN_USER}" /etc/php/$PHP_VERSION/fpm/pool.d/www.conf
    sed -i "/^group /c group = ${OWN_USER}" /etc/php/$PHP_VERSION/fpm/pool.d/www.conf
fi

exec /usr/sbin/php-fpm$PHP_VERSION