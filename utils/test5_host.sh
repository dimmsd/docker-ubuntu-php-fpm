#!/bin/sh
set -e

# check PHP-FPM Timezone
# 0 is TEST PASS
# 1 is TEST FAILURE

result=$(docker exec -u $OWN_USER -it con-$FPM_IMAGE  /usr/local/bin/test5.sh | grep -q  $TIMEZONE)
exit $result
