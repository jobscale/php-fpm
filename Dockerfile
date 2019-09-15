FROM php:7.3-fpm-buster
WORKDIR /var/www
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
&& apt-get install -y tzdata \
&& apt-get install -y lsb-release curl git vim \
&& apt-get install -y nginx nginx-extras unzip
COPY default /etc/nginx/sites-enabled/default
COPY zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf
COPY index.php html/index.php
EXPOSE 443 80
CMD ["bash", "-c", "nginx && php-fpm"]
