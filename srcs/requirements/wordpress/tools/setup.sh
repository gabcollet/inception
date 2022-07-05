#!/usr/bin/env bash

# while ! /tmp/wait-for-it.sh $WORDPRESS_DB_HOST "-s" "--timeout=50"; do
#   sleep 2
# done

# sed -i "s/WP_DB_NAME/$WP_DB_NAME/g" /tmp/wp-config.php
# sed -i "s/WP_DB_USER/$WP_DB_USER/g" /tmp/wp-config.php
# sed -i "s/WP_DB_PASSWORD/$WP_DB_PASSWORD/g" /tmp/wp-config.php
# sed -i "s/WP_DB_HOST/$WP_DB_HOST/g" /tmp/wp-config.php
# sed -i "s/WP_TABLE_PREFIX/$WP_TABLE_PREFIX/g" /tmp/wp-config.php

# FILE_HEALTH_CHECK=/var/www/html/index.php

# cp -f /tmp/wp-config.php /var/www/html/wp-config.php

# if [ ! -f "$FILE_HEALTH_CHECK" ]; then
#   # Download Wordpress into a temp directory, untar it and move it
#   wget https://wordpress.org/latest.tar.gz -P /tmp &> /dev/null
#   tar -xzvf /tmp/latest.tar.gz -C /var/www/html &> /dev/null
#   mv /var/www/html/wordpress/* /var/www/html
#   rm -rf /var/www/html/wordpress

#   cd /var/www/html
#   wp core install --url=localhost --title='Init' \
#                   --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email='gcollet@fake.com' &> /dev/null
#   wp user create $WP_GUEST eval@fake.com --role=editor --user_pass=$WP_GUEST_PASSWORD
#   echo "Wordpress successfully installed and initialized"
# fi

exec "$@"
