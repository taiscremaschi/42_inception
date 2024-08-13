
mkdir -p /var/run/mysqld
chown mysql:mysql /var/run/mysqld

if [ ! -d "/var/lib/mysql/$DATABASE" ]; 
then
    mysqld&

    while ! mysqladmin ping --silent; do
        sleep 1
    done

    mysql -uroot -e "CREATE DATABASE ${DATABASE};"
    mysql -uroot -e "CREATE USER '${MARIA_USER}'@'%' IDENTIFIED BY '${MARIA_PASSWORD}';"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${MARIA_USER}'@'%';"
    mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIA_ROOT_PASSWORD}';"
    mysql -uroot -e "FLUSH PRIVILEGES;"
    
     killall mysqld
fi

mysqld