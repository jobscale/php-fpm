### run with container
```
git clone https://github.com/jobscale/php-fpm.git
cd php-fpm
main() {
  docker build . -t local/php-fpm
  docker run --rm --name php-fpm -p 3000:80 -d local/php-fpm
  timeout 5 docker logs -f php-fpm
  http_proxy= curl -v 127.0.0.1:3000
} && main
```
