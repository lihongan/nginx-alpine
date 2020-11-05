FROM alpine:latest

RUN apk add --no-cache nginx curl
RUN mkdir -p /run/nginx

EXPOSE 8080 8443

COPY nginx.conf /etc/nginx/nginx.conf
COPY http/ /data/http/
COPY https/ /data/https/
COPY certs/ /etc/nginx/
COPY ca.pem /tmp/ca.pem
COPY entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
