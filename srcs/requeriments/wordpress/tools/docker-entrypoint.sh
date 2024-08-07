

sed -i "s/database_name_here/$DATABASE/g" /var/www/html/wp-config.php
sed -i "s/username_here/$MARIA_USER/g" /var/www/html/wp-config.php
sed -i "s/password_here/$MARIA_PASSWORD/g" /var/www/html/wp-config.php
sed -i "s/localhost/mari/g" /var/www/html/wp-config.php


php-fpm7.4 --nodaemonize


