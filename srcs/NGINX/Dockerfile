FROM debian:12.5

RUN apt-get -qq update
RUN apt-get install -yqq nginx
RUN apt-get install -yqq nano

#index.html isn't in volume?
COPY index.html /var/www/html 
COPY useless /etc/nginx/conf.d
COPY wordpress.conf /etc/nginx/conf.d
COPY nginx.conf /etc/nginx

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]