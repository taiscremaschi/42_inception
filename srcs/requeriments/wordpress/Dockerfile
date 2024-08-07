FROM debian:bullseye

RUN apt update && apt upgrade -y

RUN apt-get install -y php7.4 php7.4-cli php7.4-fpm php7.4-mysql php7.4-json \
php7.4-opcache php7.4-mbstring php7.4-xml php7.4-gd php7.4-curl wget unzip

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz && tar -zxvf latest.tar.gz && mv wordpress/* . && rm -rf wordpress

RUN chown -R www-data:www-data * && chmod -R 755 * && mv wp-config-sample.php wp-config.php

RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/7.4/fpm/php.ini

EXPOSE 9000

CMD ["php-fpm7.4", "--nodaemonize"]