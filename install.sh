#!/bin/bash
# ------------------------------------------------------------
#
#
#	Script de pós-instalação do Elementary-OS
#
#	Esse script provê a instalação de algumas bibliotecas, 
#	
# 	Programas e configuração do servidor web
#	
#	Author: Erick Bruno
#	Contact: <erickfabiani123@gmail.com>
#	Date: 2014-06-23
#	
#
# ------------------------------------------------------------

echo "Iniciando script de instalação"
sleep 1
echo "Update & Upgrade do Sistema"

#Update & Upgrade do sistema
sudo apt-get -y update
sudo apt-get -y upgrade

#adicionando repositórios
echo "Adicionando repositórios"
sleep 1
sudo add-apt-repository -y ppa:versable/elementary-update #Repositório do Elementary-OS
sudo add-apt-repository -y ppa:webupd8team/java #Repositório Java
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3 # Repositório Sublime Text 3
sudo add-apt-repository ppa:n-muench/vlc #VLC player
sudo add-apt-repository ppa:transmissionbt/ppa # Transmission
sudo add-apt-repository ppa:libreoffice/ppa # Libreoffice

# Dá um update na base do Sistema
sudo apt-get -y update

#instalando pacotes do sistema ---------------------------------------------------------

#elementary-tweaks
sudo apt-get -y install elementary-tweaks 

#Caso alguém deseje instalar alguns temas, abaixo uma lista

#sudo apt-get -y install elementary-blue-theme
#sudo apt-get -y install elementary-champagne-theme
#sudo apt-get -y install elementary-colors-theme
#sudo apt-get -y install elementary-dark-theme
#sudo apt-get -y install elementary-harvey-theme
#sudo apt-get -y install elementary-lion-theme
#sudo apt-get -y install elementary-matteblack-theme
#sudo apt-get -y install elementary-milk-theme
#sudo apt-get -y install elementary-plastico-theme

#Installing Firefox
sudo apt-get -y install firefox

#Baixando e instalando navegador chrome
echo "Baixando Google Chrome"
sleep 1
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
echo "Instalando..."
sleep 1
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo "Instalando flashplugin-installer"
sleep 1
# Flash player to Midori
sudo apt-get -y install flashplugin-installer nspluginwrapper
sudo nspluginwrapper -i /usr/lib/flashplugin-installer/libflashplayer.so
nspluginwrapper -v -a -n -i 


echo "Instalando o Java"
sleep 1
#installing java
sudo apt-get -y install oracle-java8-installer 
sudo apt-get -y install openjdk-7-jre
sudo apt-get -y install openjdk-7-jdk

echo "Instalando VLC Player"
sleep 1
sudo apt-get -y install vlc

echo "Instalando Libreoffice"
sleep 1
sudo apt-get -y install libreoffice

echo "Instalando Transmission"
sleep 1
sudo apt-get -y install transmission

echo "Instalando Thunderbird"
sleep 1
sudo apt-get -y install thunderbird

echo "Instalando Filezilla"
sleep 1
sudo apt-get -y install filezilla

echo "Instalando GiT"
sleep 1
sudo apt-get -y install git gitg

echo "Setando crontab que mantém atualizado o sistema"
#Chama script que cria um cron para manter o S.O sempre atualizado
./setting_crontab.sh

echo "Configurando o servidor web"
#Getting up the web server!
./installing_webserver.sh
