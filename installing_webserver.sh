#!/bin/bash
# ------------------------------------------------------------
#
#
#	Script de pós-instalação do Elementary-OS
#
#	Instalando e configurando o servidor web
#	
#	Author: Erick Bruno
#	Contact: <erickfabiani123@gmail.com>
#	Date: 2014-06-23
#	
#
# ------------------------------------------------------------

#Instalando Apache, PHP e MySQL
sudo apt-get -y install apache2 php5 php5-curl php5-gd mysql-server mysql-client

#Linkando Apache ao MySQL e PHP ao MySQL
sudo apt-get -y install libapache2-mod-auth-mysql php5-mysql

#instalando PHPMyAdmin
sudo apt-get -y install phpmyadmin
#criando link simbólico para a pasta root do localhost
sudo ln -s /usr/share/phpmyadmin /var/www/

#Habilitando módulo Rewrite do apache
sudo a2enmod rewrite
sudo cp -r /etc/apache2/sites-available/default /etc/apache2/sites-available/default-bkp
sudo sed -i 's/^\(AllowOverride\) .*&/\1 All/' /etc/apache2/sites-available/default

#Reiniciando servidor apache
sudo service apache2 restart

#Configurando php.ini ----------------------------------------
#Fazendo cópia de segurança do arquivo php.ini
echo "Fazendo cópia de segurança do arquivo php.ini"
sleep 1
sudo cp -r /etc/php5/apache2/php.ini /etc/php5/apache2/php-bkp.ini
#Habilitando display errors
sudo sed -i 's/^\(display_errors = \).*$/\1On/' /etc/php5/apache2/php.ini

#Alterando error reporting para modo de desenvolvimento
sudo sed -i 's/^\(error_reporting = \).*$/\1E_ALL | E_STRICT/' /etc/php5/apache2/php.ini

#restarting web server again
sudo service apache2 restart

echo "<?php phpinfo(); " > /var/www/phpinfo.php
