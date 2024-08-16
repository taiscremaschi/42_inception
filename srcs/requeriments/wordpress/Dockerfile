#Debian é uma distribuição Linux conhecida pela sua estabilidade.
FROM debian:bullseye
RUN apt update && apt upgrade -y

RUN apt-get install -y php7.4 php7.4-cli php7.4-fpm php7.4-mysql php7.4-json \
php7.4-opcache php7.4-mbstring php7.4-xml php7.4-gd php7.4-curl wget unzip

RUN mkdir -p /var/run/

#Cria o diretório /run/php, onde serão armazenados os arquivos de execução do PHP-FPM (por exemplo, o arquivo de socket para comunicação com o servidor web).
RUN  mkdir -p /run/php

#Define o diretório de trabalho dentro do contêiner. A partir dessa linha, todos os comandos serão executados dentro do diretório /var/www/html, que é o diretório padrão para sites no Linux.

WORKDIR /var/www/html
# Este comando baixa o arquivo mais recente do WordPress em formato tar.gz (wget), descompacta o conteúdo (tar -zxvf), move os arquivos descompactados 
# para o diretório atual (mv wordpress/* .), e então remove o diretório temporário wordpress (rm -rf wordpress). Basicamente, ele prepara a instalação do WordPress no diretório /var/www/html.
RUN wget https://wordpress.org/latest.tar.gz && tar -zxvf latest.tar.gz && mv wordpress/* . && rm -rf wordpress

#chown -R www-data:www-data *: Altera o proprietário e grupo de todos os arquivos e diretórios para www-data, que é o usuário padrão do servidor web Apache/Nginx.
#chmod -R 755 *: Define as permissões para todos os arquivos e diretórios como 755, o que significa que o proprietário pode ler, escrever e executar, e outros usuários podem apenas ler e executar.
# mv wp-config-sample.php wp-config.php: Renomeia o arquivo de configuração de exemplo do WordPress para wp-config.php, preparando-o para configuração personalizada.
RUN chown -R www-data:www-data * && chmod -R 755 * && mv wp-config-sample.php wp-config.php
#copia um arquivo de configuração personalizado www.conf para o diretório de configuração do PHP-FPM.
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /
#Copia um script docker-entrypoint.sh da pasta tools no host para o diretório root / do contêiner. Este script será o ponto de entrada do contêiner, responsável por executar comandos iniciais necessários.
COPY tools/docker-entrypoint.sh /

# Define o ponto de entrada do contêiner. Quando o contêiner for iniciado, o comando bash docker-entrypoint.sh será executado, o que geralmente inicia o servidor PHP-FPM ou configurações específicas do WordPress.
ENTRYPOINT ["bash", "docker-entrypoint.sh" ]
