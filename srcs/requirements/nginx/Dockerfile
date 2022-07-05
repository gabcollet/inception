FROM alpine:3.15

RUN apk update && \
    apk add nginx && \
    apk add php-fpm && \
    apk add php-mysqli && \
    apk add bash

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./tools/setup.sh /tmp/setup.sh

RUN chmod 777 /tmp/setup.sh

# RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80
# EXPOSE 443

ENTRYPOINT [ "/tmp/setup.sh" ]


CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7; exec nginx -g 'daemon off;';"]
# CMD [ "php-fpm7", "-F"]
# CMD ["nginx", "-g", "daemon off;"]
# CMD ["nginx", "-t"]