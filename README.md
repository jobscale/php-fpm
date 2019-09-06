### run with container
```
git clone https://github.com/jobscale/php-fpm.git
cd php-fpm
main() {
  docker build . -t local/php-fpm:0.0.1
  docker run --rm -d --name php-fpm -p 80:80 local/php-fpm:0.0.1
  timeout 5 docker logs -f php-fpm
  http_proxy= curl -v 127.0.0.1
} && main
```
