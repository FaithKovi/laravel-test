#!/bin/bash

PYTHON=python2 amazon-linux-extras install epel 

yum -y install supervisor 

# Download composer script for centos
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

HASH="$(wget -q -O - https://composer.github.io/installer.sig)"

php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

php composer-setup.php --install-dir=/usr/local/bin --filename=composer

composer install
