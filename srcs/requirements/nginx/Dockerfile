FROM alpine:3.15

RUN apk update && \
    apk add nginx

COPY ./conf/default.conf /etc/nginx/http.d/default.conf
COPY ./tools/server.crt /etc/ssl/server.crt
COPY ./tools/server.key /etc/ssl/server.key

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]