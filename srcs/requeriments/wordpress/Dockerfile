FROM debian:bullseye

RUN apt update && apt upgrade

RUN  cd /var/www/html && wget https://wordpress.org/latest.tar.gz && tar -zxvf latest.tar.gz && mv wordpress/* . && rm -rf wordpress
RUN chown -R www-data:www-data * && chmod -R 755 * && mv wp-config-sample.php wp-config.php
COPY 

CMD 