#!/usr/bin/env bash

if [ ! -d "/var/www/html" ]; then
    mkdir -p /var/www/html;
fi
# cd /var/www/html;
# if [ -f "index.php" ]; then
#     rm index.php;
# fi
chmod -R 777 /var/www/html;
touch /var/www/html/info.php;
# echo "<?php phpinfo(); ?>" >> /var/www/html/info.php;

exec "$@"