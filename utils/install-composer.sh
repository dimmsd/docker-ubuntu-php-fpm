#!/bin/sh
set -e

cd /tmp

EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig --no-check-certificate)
wget https://getcomposer.org/installer -O composer-setup.php --no-check-certificate -q
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")
if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi
php composer-setup.php --install-dir=/usr/local/bin --filename=composer --quiet
rm composer-setup.php
