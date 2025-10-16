FROM ghcr.io/jobscale/php-fpm
WORKDIR /usr/share/nginx
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
 php-xdebug \
 && apt-get clean && rm -fr /var/lib/apt/lists/*

COPY zz-docker.conf /etc/php/7.4/fpm/pool.d/zz-docker.conf
COPY xdebug.ini /etc/php/7.4/mods-available/xdebug.ini
