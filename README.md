elementary_script
=================

<h2>Script de pós-instalação do Elementary O.S</h2>

Esse script provê a instalação de alguns componentes comuns após a instalação do sistema operacional.
Para executar, basta digitar no terminal 
<pre>$ ./install.sh</pre>
<h3>O que ele instala:</h3>

<b>Básicos:</b>

- Firefox 
- Google Chrome
- Sublime Text 3
- openjdk-7-jre
- openjdk-7-jdk
- oracle-java8-install
- VLC
- Libreoffice
- Transmission (cliente torrent)

<b>Crontab:</b>

Será agendado a execução de um arquivo responsável
por manter o sistema toda sexta-feira às 20h30.

Você pode alterar esse horário no arquivo 
setting_crontab.sh

<b>ATENÇÃO:</b>

Esse arquivo adiciona uma regra no arquivo 
<pre>/etc/crontab</pre>
Sempre que executado irá acrescentar a linha no
final do arquivo. Por isso é importante executar
o script somente uma vez, que é a finalidade do 
mesmo. Mas caso execute mais de uma vez, apague
as linhas duplicadas do arquivo acima.

<b>WebServer:</b>

- apache2
- php5
- php5-curl
- php5-gd
- mysql-client
- mysql-server
- libapache2-mod-auth-mysql
- php5-mysql 
- phpmyadmin

<b>Após a instalação, começam as configurações como:</b>

- Ativar mod_rewrite do apache
- Configuração do PHP para modo de desenvolvimento

Feito isso, será restartado o serviço do apache

<b>Para testar, digite o seguinte no terminal:</b>
<pre>
$ sudo chmod 777 -R /var/www/
$ cd /var/www/
$ echo "&lt;?php phpinfo();" &gt; phpinfo.php
</pre>
<b>Agora basta você abrir um browser e digitar:</b>
<pre>localhost/phpinfo.php</pre>

