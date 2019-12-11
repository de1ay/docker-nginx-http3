FROM alpine:latest
LABEL maintainer="Nikita Ivanov <6de1ay@gmail.com>"

RUN  echo 'http://nl.alpinelinux.org/alpine/edge/main'>> /etc/apk/repositories \
  && echo 'http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories \
  && apk add --no-cache --virtual .build-deps \
                gcc \
                libc-dev \
                make \
                cmake \
                openssl-dev \
                pcre-dev \
                zlib-dev \
                linux-headers \
                libxslt-dev \
                gd-dev \
                geoip-dev \
                perl-dev \
                libedit-dev \
                mercurial \
                bash \
                alpine-sdk \
                findutils \
                git \
                tar \
                curl \
                go \
                rust \
                cargo \
  # Base folder
  && cd /opt \
  # Google brotli module
  && git clone --recursive https://github.com/google/ngx_brotli.git \
  # Nginx source
  && curl -O https://nginx.org/download/nginx-1.16.1.tar.gz \
  && tar xvzf nginx-1.16.1.tar.gz \
  # QUIC
  && git clone --recursive https://github.com/cloudflare/quiche \
  && cd /opt/nginx-1.16.1 \
  && patch -p01 < ../quiche/extras/nginx/nginx-1.16.patch \
  # Nginx build
  && ./configure \
   	--prefix=/etc/nginx \
	--modules-path=/usr/lib/nginx/modules \
	--conf-path=/etc/nginx/nginx.conf \
	--error-log-path=/var/log/nginx/error.log \
	--http-log-path=/var/log/nginx/access.log \
	--pid-path=/var/run/nginx.pid \
	--lock-path=/var/run/nginx.lock \
   	--with-http_ssl_module \
   	--with-http_v2_module \
   	--with-http_v3_module \
   	--with-openssl=../quiche/deps/boringssl \
   	--with-quiche=../quiche \
    --add-module=../ngx_brotli \
  && make && make install \
  && apk del .build-deps
