FROM php:fpm-buster
WORKDIR /var/www
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y tzdata \
 && apt-get install -y lsb-release curl git vim \
 && apt-get install -y nginx nginx-extras unzip
RUN curl -sLo composer-setup.php https://getcomposer.org/installer \
 && php composer-setup.php && rm composer-setup.php \
 && mv composer.phar /usr/local/bin/composer
COPY default /etc/nginx/sites-enabled/default
COPY zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf
COPY public public
RUN rm -fr html && ln -sfn public html
RUN rm -fr /var/lib/apt/lists/*
EXPOSE 80
CMD ["bash", "-c", "nginx && php-fpm"]
