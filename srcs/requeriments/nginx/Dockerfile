
FROM debian:bullseye

RUN apt install nginx -y

#copia minha conf para a conf padrao do nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx","-g","'daemon off;'"]
