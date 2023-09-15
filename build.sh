#!/bin/bash


PYTHON=python2 amazon-linux-extras install epel 

yum -y install supervisor

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

php composer-setup.php --install-dir=/usr/local/bin --filename=composer

composer install

chown 777 -R ./storage