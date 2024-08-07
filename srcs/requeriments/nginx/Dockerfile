
FROM debian:bullseye

RUN apt update && apt upgrade -y

RUN apt install nginx -y

#copia minha conf para a conf padrao do nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY conf/docker-entrypoint.sh /

EXPOSE 443

ENTRYPOINT [ "bash", "docker-entrypoint.sh" ]
