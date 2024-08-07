FROM debian:bullseye

RUN apt update && apt upgrade -y

RUN apt install mariadb-server -y

COPY tools/docker-entrypoint.sh /
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["bash", "docker-entrypoint.sh"]

