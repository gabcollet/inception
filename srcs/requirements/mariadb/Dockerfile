FROM debian:buster

RUN apt-get update
RUN apt-get dist-upgrade -yq
RUN apt-get install -yq mariadb-server
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/

EXPOSE 3306

HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

CMD ["mysqld"]
