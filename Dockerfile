FROM php:8.2-apache
RUN docker-php-ext-install mysqli pdo_mysql
COPY . /var/www/html/
CMD rm -f /etc/apache2/mods-enabled/mpm_*.load /etc/apache2/mods-enabled/mpm_*.conf; a2enmod mpm_prefork; sed -i "s/^Listen 80\$/Listen ${PORT:-8080}/" /etc/apache2/ports.conf; sed -i "s/<VirtualHost \*:[0-9]*>/<VirtualHost *:${PORT:-8080}>/" /etc/apache2/sites-available/000-default.conf; exec apache2-foreground
