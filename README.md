# docker-nginx-http3

[![](https://img.shields.io/docker/cloud/build/de1ay/nginx-http3?style=flat-square)](https://hub.docker.com/r/de1ay/nginx-http3)
[![](https://img.shields.io/docker/cloud/automated/de1ay/nginx-http3?style=flat-square)](https://hub.docker.com/r/de1ay/nginx-http3)
[![](https://img.shields.io/docker/pulls/de1ay/nginx-http3?style=flat-square)](https://hub.docker.com/r/de1ay/nginx-http3)

Alpine Linux Nginx with HTTP/3 and Brotli support
## Usage

[DockerHub](https://hub.docker.com/r/de1ay/nginx-http3)

Use Image only as **base** via ```FROM de1ay/nginx-http3``` <br/>

## Server features

* **HTTP/3 (QUIC)** - implementation by [Cloudflare](https://github.com/cloudflare/quiche)
* **Brotli** compression - implementation by [Google](https://github.com/google/ngx_brotli)
* **HTTP/2**
* **BoringSSL** *(OpenSSL not working with HTTP/3 yet)*

## Examples of use

* [VueJS](https://github.com/de1ay/docker-nginx-http3/tree/master/example/vue)
