FROM alpine:3.15

RUN apk update && \
    apk add php php-phar php7-json php-fpm php-iconv \
    php7-mysqli mariadb-client bash mysql mysql-client             

WORKDIR /var/www/

COPY ./conf/www.conf /etc/php7/php-fpm.d/www.conf
COPY ./tools/setup.sh /tmp/setup.sh
COPY ./tools/wordpress-6.0.tar.gz /var/www/wordpress-6.0.tar.gz
COPY ./tools/wp-cli.phar /var/www/wp-cli.phar

RUN chmod 777 /var/www/wp-cli.phar && mv /var/www/wp-cli.phar /usr/bin/wp
RUN chmod 777 /tmp/setup.sh

EXPOSE 9000

ENTRYPOINT [ "/tmp/setup.sh" ]

CMD [ "php-fpm7", "-F"]