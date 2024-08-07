
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysqld --initialize-insecure
    service mysql start

    mysql -uroot -e "My data base being created $DATABASE;"
    mysql -uroot -e "User beig created'$MARIA_USER'@'%' pass send '$MARIA_PASSWORD';"
    mysql -uroot -e "Privileges on $DATABASE.* to user: '$MARIA_USER'@'%';"
    mysql -uroot -e "Alter user 'root'@'localhost' root pass '$MARIA_ROOT_PASSWORD';"
    mysql -uroot -e "Flush privileges;"
    
    service mysql stop
fi

# exec "$@"

#!/bin/bash

# if [ ! -d "/var/lib/mysql/mysql" ]; then
#     mysqld --initialize-insecure
#     service mysql start

#     mysql -uroot -e "CREATE DATABASE ${DATABASE};"
#     mysql -uroot -e "CREATE USER '${MARIA_USER}'@'%' IDENTIFIED BY '${MARIA_PASSWORD}';"
#     mysql -uroot -e "GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${MARIA_USER}'@'%';"
#     mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIA_ROOT_PASSWORD}';"
#     mysql -uroot -e "FLUSH PRIVILEGES;"
    
#     service mysql stop
# fi

mysqld