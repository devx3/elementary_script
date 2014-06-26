elementary_script
=================

Script de pós-instalação do Elementary O.S

Esse script provê a instalação de alguns componentes comuns após a instalação do sistema operacional.
Para executar, basta digitar no terminal ./install.sh.

O que ele instala:

Básicos:
- Firefox 
- Google Chrome
- Sublime Text 3
- oracle-java8-install

Crontab:

Será agendado a execução de um arquivo responsável
por manter o sistema toda sexta-feira às 20h30.

Você pode alterar esse horário no arquivo 
setting_crontab.sh

ATENÇÃO

Esse arquivo adiciona uma regra no arquivo 
/etc/crontab

Sempre que executado irá acrescentar a linha no
final do arquivo. Por isso é importante executar
o script somente uma vez, que é a finalidade do 
mesmo. Mas caso execute mais de uma vez, apague
as linhas duplicadas do arquivo acima.


WebServer 

- apache2
- php5
- php5-curl
- php5-gd
- mysql-client
- mysql-server
- libapache2-mod-auth-mysql
- php5-mysql 

- phpmyadmin

Após a instalação, começam as configurações como:

- Ativar mod_rewrite do apache
- Configuração do PHP para modo de desenvolvimento

Feito isso, será restartado o serviço do apache

Para testar, digite o seguinte no terminal:

cd /var/www/
echo "<?php phpinfo();" > phpinfo.php

Agora basta você abrir um browser e digitar

localhost/phpinfo.php

