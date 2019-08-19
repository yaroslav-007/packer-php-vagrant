#!/usr/bin/env bash


###Install nginx, php
apt-get update
apt-get -y install nginx php-fpm


systemctl stop nginx
# remove default config
[ -f /etc/nginx/sites-enabled/default ] && unlink /etc/nginx/sites-enabled/default

