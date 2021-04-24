FROM alpine:latest

RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    s6 \
    unbound \
    && rm -rf /var/cache/apk/*

RUN curl -o /tmp/root.hints https://www.internic.net/domain/named.cache \
 && mv /tmp/root.hints /etc/unbound/root.hints

COPY rootfs/ /

RUN chmod +x /services/*/run
#RUN chmod +x /services/*/finish

EXPOSE 53/udp 53/tcp

ENTRYPOINT ["/start/entrypoint.sh"]
