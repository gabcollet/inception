#!/usr/bin/env sh

DB_DIR=/var/lib/mysql/$MYSQL_DATABASE

if [ ! -d "/var/lib/mysql/mysql" ]; then
  mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=root --rpm --skip-test-db > /dev/null
fi

if [ -d $DB_DIR ]; then
  echo "$MYSQL_DATABASE ALREADY EXISTS."
else
  echo "$MYSQL_DATABASE DOES NOT EXIST; CREATING $MYSQL_DATABASE"
  touch /tmp/init.sql
  echo "FLUSH PRIVILEGES;" > /tmp/init.sql
  echo "ALTER USER root@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> /tmp/init.sql
  echo "CREATE DATABASE $MYSQL_DATABASE;" >> /tmp/init.sql
  echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> /tmp/init.sql
  echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';" >> /tmp/init.sql
  echo "FLUSH PRIVILEGES;" >> /tmp/init.sql
  echo "EXIT;" >> /tmp/init.sql

  mysqld --user=root --bootstrap < /tmp/init.sql
  rm /tmp/init.sql
fi

exec "$@"
