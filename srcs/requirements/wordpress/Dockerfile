FROM debian:buster

RUN apt-get update
RUN apt-get dist-upgrade -yq
RUN apt-get install -yq
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/

EXPOSE 443

CMD ["nginx"]