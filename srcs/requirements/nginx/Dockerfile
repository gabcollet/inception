FROM debian:buster

RUN apt-get update
RUN apt-get dist-upgrade -yq
RUN apt-get install -yq nginx
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx"]