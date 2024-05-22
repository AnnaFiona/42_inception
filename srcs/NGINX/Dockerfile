FROM debian:12.5

RUN apt-get -qq update
RUN apt-get install -yqq nginx
RUN apt-get install -yqq nano

#index.html isn't in volume?
COPY index.html /var/www/html 
COPY useless.conf /etc/nginx/conf.d
COPY wordpress.conf /etc/nginx/conf.d
COPY nginx.conf /etc/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]