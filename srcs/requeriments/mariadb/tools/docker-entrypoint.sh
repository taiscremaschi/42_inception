
mkdir -p /var/run/mysqld
#Altera a propriedade do diretório criado para o usuário mysql e o grupo mysql. 
#Isso é necessário porque o processo MySQL precisa de permissões adequadas para ler e escrever nesse diretório.
chown mysql:mysql /var/run/mysqld
#ifica se o diretório do banco de dados especificado ($DATABASE) já existe em /var/lib/mysql.
#! -d significa "se o diretório não existir". Se o diretório não existir, o script assume que o banco de dados ainda não foi inicializado.
if [ ! -d "/var/lib/mysql/$DATABASE" ]; 
then
#Inicia o servidor MySQL (mysqld) em segundo plano. Isso é necessário para poder executar comandos MySQL, como criar o banco de dados e configurar usuários.
    mysqld&
#Este loop while verifica se o servidor MySQL está pronto para aceitar conexões. O comando mysqladmin ping --silent retorna um status, e o loop continua até que o 
#servidor esteja acessível. sleep 1 pausa o script por 1 segundo entre as tentativas.
#O loop é importante para garantir que o MySQL esteja totalmente inicializado antes de executar comandos SQL.
    while ! mysqladmin ping --silent; do
        sleep 1
    done
#Cada uma dessas linhas executa um comando SQL usando o cliente MySQL (mysql) como o usuário root (-uroot). O -e permite que você passe o comando SQL diretamente no terminal.
    mysql -uroot -e "CREATE DATABASE ${DATABASE};"
    mysql -uroot -e "CREATE USER '${MARIA_USER}'@'%' IDENTIFIED BY '${MARIA_PASSWORD}';"
    mysql -uroot -e "GRANT ALL PRIVILEGES ON ${DATABASE}.* TO '${MARIA_USER}'@'%';"
    mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIA_ROOT_PASSWORD}';"
    mysql -uroot -e "FLUSH PRIVILEGES;"
#Encerra o servidor MySQL que foi iniciado em segundo plano. Isso é feito porque a inicialização do MySQL será realizada novamente de forma completa após o script terminar.    
     killall mysqld
fi
#Finalmente, o servidor MySQL é iniciado em primeiro plano. Isso é necessário para que o contêiner permaneça em execução e o MySQL esteja disponível para receber conexões.
mysqld