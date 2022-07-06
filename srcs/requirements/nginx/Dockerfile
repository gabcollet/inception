FROM alpine:3.15

RUN apk update && \
    apk add nginx

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE 80
# EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
# CMD ["nginx", "-t"]