#!/bin/bash
# ------------------------------------------------------------
#
#
#	Script de pós-instalação do Elementary-OS
#
#	Setando crontab que mantem atualizado o O.S
#	
#	Author: Erick Bruno
#	Contact: <erickfabiani123@gmail.com>
#	Date: 2014-06-23
#	
#
# ------------------------------------------------------------

#Cópia de segurança do arquivo crontab
sudo cp -r /etc/crontab /etc/crontab-bkp
#Copia o script de atualização para o /usr/bin
sudo cp upgrade_system-o.sh /usr/bin/upgrade_system-o

#Programando atualização no cron
#Programe abaixo de acordo com sua necessidade
#Lembre-se: Minuto Hora dia_do_mes mes dia_semana
sudo sed -i '$s/$/\n#Responsável pelo upgrade semanal do S.O\n30 20 * * 5 root upgrade_system-o/' /etc/crontab
