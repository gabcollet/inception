#!/usr/bin/env bash

#THIS IS ALL FOR TESTING PHP
# if [ ! -d "/var/www/html" ]; then
#     mkdir -p /var/www/html;
# fi
# cd /var/www/html;
# if [ -f "index.php" ]; then
#     rm index.php;
# fi
# chmod -R 777 /var/www/html;
# touch /var/www/html/index.php;
# echo "<?php phpinfo(); ?>" >> /var/www/html/index.php;

# if [ ! -d "var/run/php/" ]; then
#     mkdir -p var/run/php/;
# fi

#CREATING A USER FOR ACCESS TO MARIADB
addgroup -g 99 nginx;
adduser -u 99 -G nginx -D nginx;

#CONFIGURATION FOR WORDPRESS
for i in {0..30}; do
    if mariadb -hmariadb -u$MYSQL_USER -p$MYSQL_PASSWORD --database=$MYSQL_DATABASE <<<'SELECT 1;' &>/dev/null; then
        break
    fi
        sleep 2
done
if [ "$i" = 30 ]; then
    echo "Can't connect to database"
fi
if [ ! -f "/var/www/html/wp-config.php" ]; then
    echo INSTALLATION AND CONFIGURATION OF WORDPRESS;
    cd /var/www/
    tar -xzf ./wordpress-6.0.tar.gz
    rm ./wordpress-6.0.tar.gz
    mv wordpress//* html/
    rm -rf wordpress
    wp core download;

    wp config create --allow-root \
                    --dbname=$MYSQL_DATABASE \
                    --dbuser=$MYSQL_USER \
                    --dbpass=$MYSQL_PASSWORD \
                    --dbhost=$WP_DB_HOST \
                    --dbcharset="utf8" \
                    --dbcollate="utf8_general_ci" \
                    --path="/var/www/html"
    wp core install --allow-root \
                    --title="Wordpress" \
                    --admin_name="${MYSQL_USER}" \
                    --admin_password="${MYSQL_PASSWORD}" \
                    --admin_email="${MYSQL_EMAIL}" \
                    --skip-email \
                    --url="${DOMAIN_NAME}" \
                    --path="/var/www/html"
    wp user create --allow-root \
                    $WP_DB_USER \
                    $WP_EMAIL \
                    --role=author \
                    --user_pass=$WP_DB_PASSWORD \
                    --path="/var/www/html"

    echo "WORDPRESS INSTALLED SUCCESSFULLY"
fi

exec "$@"
