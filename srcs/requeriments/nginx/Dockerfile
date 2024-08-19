
FROM debian:bullseye

RUN apt update && apt upgrade -y

RUN apt install nginx -y
#Instala o openssl, uma ferramenta de linha de comando para trabalhar com certificados SSL/TLS. 
#Isso será usado para gerar certificados autoassinados para criptografar o tráfego HTTP com HTTPS.
RUN apt-get install -y openssl
RUN mkdir -p /etc/nginx/ssl
#    Copia o arquivo de configuração do Nginx (nginx.conf) da pasta conf no host para o diretório de configuração do Nginx dentro do contêiner, 
#sobrescrevendo o arquivo de configuração padrão. Este arquivo provavelmente define como o Nginx servirá o conteúdo e como ele utilizará SSL.
COPY conf/nginx.conf /etc/nginx/nginx.conf
#Copia o script docker-entrypoint.sh da pasta tools no host para o diretório root (/) do contêiner. Este script será executado quando o contêiner for iniciado.
COPY tools/docker-entrypoint.sh /

COPY tools/ssl.sh /
RUN bash ssl.sh 
ENTRYPOINT [ "bash", "docker-entrypoint.sh" ]






