
#sed para substituir a string database_name_here no arquivo wp-config.php pelo valor da variável de ambiente $DATABASE. 
#Este valor deve corresponder ao nome do banco de dados que o WordPress irá utilizar. O comando -i faz a substituição no próprio arquivo (in-place).
sed -i "s/database_name_here/$DATABASE/g" /var/www/html/wp-config.php
sed -i "s/username_here/$MARIA_USER/g" /var/www/html/wp-config.php
sed -i "s/password_here/$MARIA_PASSWORD/g" /var/www/html/wp-config.php
#Esta linha substitui localhost no wp-config.php por mariadb, que é o nome do serviço do contêiner MariaDB conforme definido no docker-compose.yml.
#Isso informa ao WordPress que o banco de dados não está rodando no localhost, mas sim em um contêiner separado com o nome mariadb.
sed -i "s/localhost/mariadb/g" /var/www/html/wp-config.php

#Finalmente, esta linha inicia o PHP-FPM versão 7.4 no modo "não-daemon" (--nodaemonize). Isso significa que o PHP-FPM será executado em primeiro plano (foreground),
# é necessário para que o contêiner Docker continue rodando. No Docker, se o processo principal (neste caso, o PHP-FPM) terminar, o contêiner será encerrado, por isso é importante que o PHP-FPM continue rodando.
php-fpm7.4 --nodaemonize


