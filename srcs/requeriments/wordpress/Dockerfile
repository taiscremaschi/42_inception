FROM debian:bullseye

RUN apt update && apt upgrade -y

RUN apt-get install -y php7.4 php7.4-cli php7.4-fpm php7.4-mysql php7.4-json \
php7.4-opcache php7.4-mbstring php7.4-xml php7.4-gd php7.4-curl wget unzip

RUN mkdir -p /var/run/

RUN  mkdir -p /run/php

WORKDIR /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /

COPY tools/docker-entrypoint.sh /

ENTRYPOINT ["bash", "docker-entrypoint.sh" ]
