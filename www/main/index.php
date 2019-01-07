<?php
echo 'TEST OK', PHP_EOL;
$pwu_data = posix_getpwuid(posix_geteuid());
echo 'PHP running under user ', $pwu_data['name'], PHP_EOL;
echo 'Default timezone is ', date_default_timezone_get() , PHP_EOL, PHP_EOL;
