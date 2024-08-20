
cd /var/www/html

if [ ! -e "/var/www/html/wp-config.php" ]; then
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

php-fpm7.4 --nodaemonize


