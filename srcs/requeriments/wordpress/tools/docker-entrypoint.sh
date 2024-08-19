
cd /var/www/html

if [ ! -e "/var/www/html/wp-config.php" ]; then
	echo "[wordpress:setup.sh] Initializing wordpress"
	wp core download --allow-root
	wp config create --allow-root --dbname=$DATABASE --dbuser=$MARIA_USER --dbpass=$MARIA_PASSWORD --dbhost=$HOST
	wp core install --allow-root --url="$DOMAIN" --title="$TITLE_WORD" \
	--admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASS" \
	--admin_email="$ADMIN_EMAIL" --skip-email
	wp user create --allow-root  $NORMAL_USER $NORMAL_EMAIL --user_pass=$NORMAL_PASS
	chown -R www-data:www-data *
else
	echo "[wordpress:setup.sh] worpdress has already been set up!"

fi

# sed -i "s/database_name_here/$DATABASE/g" /var/www/html/wp-config.php
# sed -i "s/username_here/$MARIA_USER/g" /var/www/html/wp-config.php
# sed -i "s/password_here/$MARIA_PASSWORD/g" /var/www/html/wp-config.php
# sed -i "s/localhost/mariadb/g" /var/www/html/wp-config.php

php-fpm7.4 --nodaemonize


