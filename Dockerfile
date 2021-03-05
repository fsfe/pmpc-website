FROM php:7-apache

COPY site/public/ /var/www/html

COPY 000-default.conf /etc/apache2/sites-enabled/

RUN a2enmod rewrite

CMD apache2-foreground
