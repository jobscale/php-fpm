FROM php:7.3-fpm-buster

WORKDIR /var/www

RUN apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata \
&& apt-get install -y lsb-release curl git vim \
&& apt-get install -y nginx nginx-extras unzip

COPY default /etc/nginx/sites-enabled/default
COPY zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf

COPY index.php html/index.php

EXPOSE 80
CMD ["bash", "-c", "nginx && php-fpm"]
