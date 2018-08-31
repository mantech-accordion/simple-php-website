FROM php:5.6-apache

RUN apt-get update
RUN apt-get install -y git zip

RUN docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
&& docker-php-ext-install gd

RUN apt-get install -y libssl-dev openssl
RUN docker-php-ext-install phar

RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

##############
COPY . /var/www/html/.

##############

RUN a2enmod rewrite
RUN a2enmod headers
RUN apache2ctl -k graceful
