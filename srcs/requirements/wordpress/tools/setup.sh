#!/usr/bin/env bash

if [ ! -d "/var/www/html" ]; then
    mkdir -p /var/www/html;
fi
cd /var/www/html;
if [ -f "index.php" ]; then
    rm index.php;
fi
chmod -R 777 /var/www/html;
touch /var/www/html/index.php;
echo "<?php phpinfo(); ?>" >> /var/www/html/index.php;

if [ ! -d "var/run/php/" ]; then
    mkdir -p var/run/php/;
fi
addgroup -g 99 nginx;
adduser -u 99 -G nginx -D nginx;

#CONFIGURATION FOR WORDPRESS
sleep 2;

cd /var/www/
tar -xzf ./wordpress-6.0.tar.gz
rm ./wordpress-6.0.tar.gz
mv wordpress//* html/
rm -rf wordpress
wp core download;
sleep 2;


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

exec "$@"