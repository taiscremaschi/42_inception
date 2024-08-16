
FROM debian:bullseye

RUN apt update && apt upgrade -y

RUN apt install nginx -y
RUN apt-get install -y openssl
RUN mkdir -p /etc/nginx/ssl
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/docker-entrypoint.sh /
COPY tools/ssl.sh /
RUN bash ssl.sh 
ENTRYPOINT [ "bash", "docker-entrypoint.sh" ]






