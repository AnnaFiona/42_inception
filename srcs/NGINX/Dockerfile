FROM debian:12.5

RUN apt-get -qq update
RUN apt-get install -yqq nginx nano openssl

#index.html isn't in volume?
COPY index.html /var/www/html 
COPY useless.conf /etc/nginx/conf.d
COPY aplank.42.fr.conf /etc/nginx/conf.d
COPY nginx.conf /etc/nginx
COPY setup_ssl-tls.bash .

RUN chmod 777 setup_ssl-tls.bash

EXPOSE 443 80

ENTRYPOINT [ "./setup_ssl-tls.bash" ]
#CMD ["nginx", "-g", "daemon off;"]