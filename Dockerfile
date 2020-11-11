FROM alpine:latest

RUN apk add --no-cache nginx curl

RUN mkdir -p /run/nginx && chmod -R 777 /run/nginx

EXPOSE 8080 8443

COPY nginx.conf /etc/nginx/nginx.conf
COPY http/ /data/http/
COPY https-default/ /data/https-default/
COPY https-sni/ /data/https-sni/
COPY certs/ /etc/nginx/
COPY ca.pem /tmp/ca.pem
COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod -R 777 /data && chmod -R 777 /var/lib/nginx && chmod -R 777 /var/log/nginx

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
