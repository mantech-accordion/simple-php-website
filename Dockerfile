FROM php:5.6-apache

##############
COPY . /var/www/html/.

##############

RUN apache2ctl -k graceful
