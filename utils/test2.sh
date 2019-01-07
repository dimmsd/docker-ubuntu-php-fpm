#!/bin/sh
set -e

ls /usr/share/zoneinfo/$TIMEZONE | xargs md5sum | grep $(md5sum /etc/localtime | cut -d' ' -f1)