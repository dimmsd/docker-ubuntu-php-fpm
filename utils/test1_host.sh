#!/bin/sh
set -e

# check PHP Version
# 0 is TEST PASS
# 1 is TEST FAILURE
result=$(docker exec -u $OWN_USER -it con-$FPM_IMAGE  /usr/local/bin/test1.sh | grep -q  "PHP $PHP_VERSION")
exit $result
