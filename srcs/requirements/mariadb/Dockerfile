FROM alpine:3.15

RUN apk add --update mariadb mariadb-client && mkdir /run/mysqld

EXPOSE 3306

COPY ./tools/setup_mariadb.sh /tmp/setup_mariadb.sh

RUN chmod 777 /tmp/setup_mariadb.sh

ENTRYPOINT [ "/tmp/setup_mariadb.sh" ]

CMD ["mysqld", "--user=root", "--skip-networking=0"]