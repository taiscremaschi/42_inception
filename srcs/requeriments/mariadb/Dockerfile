FROM debian:bullseye

RUN apt update && apt upgrade -y

RUN apt install mariadb-server -y

COPY conf/docker-entrypoint.sh /

EXPOSE 3306

ENTRYPOINT ["bash", "docker-entrypoint.sh"]

