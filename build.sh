#!/bin/bash


PYTHON=python2 amazon-linux-extras install epel 

yum -y install supervisor

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

php composer-setup.php --install-dir=/usr/local/bin --filename=composer

composer install

chmod -R 775 storage
chmod -R 775 bootstrap/cache