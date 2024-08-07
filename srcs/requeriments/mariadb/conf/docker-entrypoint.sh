
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysqld --initialize-insecure
    service mysql start

    mysql -uroot -e "My data base being created $MYSQL_DATABASE;"
    mysql -uroot -e "User beig created'$MYSQL_USER'@'%' pass send '$MYSQL_PASSWORD';"
    mysql -uroot -e "Privileges on $MYSQL_DATABASE.* to user: '$MYSQL_USER'@'%';"
    mysql -uroot -e "Alter user 'root'@'localhost' root pass '$MYSQL_ROOT_PASSWORD';"
    mysql -uroot -e "Flush privileges;"
    
    service mysql stop
fi

exec "$@"