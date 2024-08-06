FROM debian:bullseye

RUN apt update && apt upgrade

RUN apt install mariadb-server  && systemctl enable mariadb.service && mysql_secure_installation
# RUN mysql -u root -p
RUN apt-get install php7.2 php7.2-cli php7.2-fpm php7.2-mysql php7.2-json php7.2-opcache php7.2-mbstring php7.2-xml php7.2-gd php7.2-curl

