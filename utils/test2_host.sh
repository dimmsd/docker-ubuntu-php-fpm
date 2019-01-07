#!/bin/sh
set -e

# check SYSTEM TIMEZONE
# 0 is TEST PASS
# 1 is TEST FAILURE
result=$(docker exec -u $OWN_USER -it con-$FPM_IMAGE  /usr/local/bin/test2.sh | grep -q  $TIMEZONE)
exit $result
