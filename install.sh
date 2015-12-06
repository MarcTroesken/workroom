#!/usr/bin/env bash

sudo apt-get update

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

sudo apt-get install -y vim curl python-software-properties
add-apt-repository ppa:ondrej/php-7.0
sudo apt-add-repository ppa:nginx/development

sudo apt-get update

sudo apt-get install -y nginx php7.0-fpm php7.0-cli php7.0-common mysql-server php7.0-mysql php7.0-json php7.0-opcache php7.0-phpdbg php7.0-dbg php7.0-gd php7.0-imap php7.0-ldap php7.0-pgsql php7.0-pspell php7.0-recode php7.0-snmp php7.0-tidy php7.0-dev php7.0-intl git-core sqlite3 redis-server

sudo service php7.0-fpm restart

curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

