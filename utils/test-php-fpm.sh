#!/bin/sh
set -e

SCRIPT_NAME=/$2 \
SCRIPT_FILENAME=/$3 \
QUERY_STRING="full" \
REQUEST_METHOD=GET \
cgi-fcgi -bind -connect $1:9000

