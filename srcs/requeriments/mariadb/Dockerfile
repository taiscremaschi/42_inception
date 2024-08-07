FROM debian:bullseye

RUN apt update && apt upgrade

RUN apt install mariadb-server

COPY ./docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mysqld"]
