FROM php:fpm-buster
WORKDIR /var/www
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
 && apt-get install -y tzdata \
 && apt-get install -y lsb-release curl git vim \
 && apt-get install -y nginx nginx-extras unzip
RUN curl -o composer-setup.php https://getcomposer.org/installer \
 && php composer-setup.php && rm composer-setup.php \
 && mv composer.phar /usr/local/bin/composer
COPY default /etc/nginx/sites-enabled/default
COPY zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf
COPY index.php html/index.php
EXPOSE 443 80
CMD ["bash", "-c", "nginx && php-fpm"]
