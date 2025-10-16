FROM nginx:mainline
WORKDIR /usr/share/nginx
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
 ca-certificates lsb-release curl git vim unzip tzdata \
 $(apt-cache search php | grep "^php8" | grep -vw apcu | grep -vw gmagick | grep -vw yac | awk '{print $1}') \
 && apt-get clean && rm -fr /var/lib/apt/lists/*
RUN curl -sLo composer-setup.php https://getcomposer.org/installer \
 && php composer-setup.php && rm composer-setup.php \
 && mv composer.phar /usr/local/bin/composer

COPY default.conf /etc/nginx/conf.d/default.conf
COPY public public
RUN rm -fr html && ln -sfn public html
EXPOSE 80
RUN mkdir -p /run/php
RUN chown -R nginx. .
CMD ["bash", "-c", "nginx && php-fpm8.4"]
