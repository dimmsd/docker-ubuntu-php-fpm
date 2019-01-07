#!/bin/sh
set -e

# check PHP-FPM User
# 0 is TEST PASS
# 1 is TEST FAILURE

result=$(docker exec -u $OWN_USER -it con-$FPM_IMAGE  /usr/local/bin/test4.sh | grep -q  $OWN_USER)
exit $result
