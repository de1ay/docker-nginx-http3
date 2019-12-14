# VueJS example

## How to use

1. Clone repository
2. Replace examples at [nginx.conf](https://github.com/de1ay/docker-nginx-http3/blob/master/example/vue/nginx.conf)
3. Generate Diffie-Helman keys <br/> ```openssl dhparam -out /usr/app/ssl/dhparam.pem 2048```
4. Obtain SSL certificates
5. Build image <br/> ```docker build -t test:latest .```
6. Run image <br/> ```docker run -d --restart=always -v /usr/app/ssl:/usr/app/ssl test:latest```
7. don't forget to mount SSL files <br/> ```-v /usr/app/ssl:/usr/app/ssl```

## Nginx SSL paths

* **ssl_dhparam** - /usr/app/ssl/dhparam.pem
* **ssl_certificate** - /usr/app/ssl/fullchain.pem
* **ssl_certificate_key** - /usr/app/ssl/privkey.pem
* **ssl_trusted_certificate** - /usr/app/ssl/chain.pem