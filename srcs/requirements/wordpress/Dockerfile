FROM alpine:3.15

RUN apk update && \
    apk add php-fpm 
    # apk add php-mysqli && \
    # apk add mariadb-client && \
    # apk add bash

# RUN mkdir -p var/run/php/

# ============================================
# Copy settings into the container and create the socket's directory
# COPY ./conf/php/www.conf /etc/php8/php-fpm.d
# RUN mkdir var/run/php/ && \
#     \
#     # Create a group and an user to be used by wordpress
#     addgroup -g 99 student && \
#     adduser -u 99 -G student -D student && \
#     \
#     # Make sure the website's directory is created
#     mkdir -p /var/www/html

# #Fix an issue with the PATH by doing a symbolic link
# RUN ln -s /usr/bin/php8 /usr/bin/php && \
#     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &> /dev/null && \
#     chmod +x wp-cli.phar && \
#     cp wp-cli.phar /usr/bin/wp &> /dev/null

# WORKDIR /var/www/html

# # Copying config files into the container
# COPY ./conf/php/wordpress.ini /etc/php8/fpm/conf.d
# COPY ./conf/php/php-fpm.conf /etc/php8/
# COPY ./conf/php/php.ini /etc/php8/
# COPY ./conf/php/www.conf /etc/php8/php-fpm.d

# COPY ./conf/wp-config.php /tmp/wp-config.php
# ============================================

# COPY ./tools/setup.sh /tmp/setup.sh
# COPY ./tools/wait-for-it.sh /tmp/wait-for-it.sh

# RUN chmod 777 /tmp/setup.sh
# RUN chmod 777 /tmp/wait-for-it.sh

EXPOSE 9000

# ENTRYPOINT [ "/tmp/setup.sh" ]

CMD [ "php-fpm7", "-F"]