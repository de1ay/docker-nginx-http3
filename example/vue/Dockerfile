# Build stage
FROM node:latest 
WORKDIR /usr/app
COPY . /usr/app

RUN npm ci --silent && npm run build

# Runnig stage
FROM de1ay/nginx-http3:latest
COPY --from=0 /usr/app/dist /usr/app/dist

# Nginx configuration
RUN rm /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80/tcp
EXPOSE 443/tcp
EXPOSE 443/udp

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]