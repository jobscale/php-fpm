FROM php:7.3-fpm-buster

WORKDIR /var/www/html

RUN apt update && apt install -y nginx nginx-extras

COPY index.php .
COPY default /etc/nginx/sites-enabled/default

EXPOSE 443 80
CMD ["bash", "-c", "nginx && php-fpm"]
