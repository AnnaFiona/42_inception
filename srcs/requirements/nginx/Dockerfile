FROM debian:bullseye

RUN apt-get -qq update
RUN apt-get install -yqq nginx nano openssl

COPY aplank.42.fr.conf /etc/nginx/sites-available
COPY nginx.conf /etc/nginx
COPY setup_ssl-tls.bash .

RUN chmod 755 setup_ssl-tls.bash
RUN ln -s /etc/nginx/sites-available/aplank.42.fr.conf /etc/nginx/sites-enabled/aplank.42.fr.conf

EXPOSE 443

ENTRYPOINT [ "./setup_ssl-tls.bash" ]