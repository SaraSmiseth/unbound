FROM alpine:latest

RUN apk add --no-cache \
    bash \
    bind-tools \
    ca-certificates \
    curl \
    drill \
    s6 \
    unbound \
    && rm -rf /var/cache/apk/*

RUN curl -o /tmp/root.hints https://www.internic.net/domain/named.cache \
 && mv /tmp/root.hints /etc/unbound/root.hints

COPY rootfs/ /

RUN chmod +x /services/*/run
#RUN chmod +x /services/*/finish

EXPOSE 53/udp 53/tcp

# TODO Enable? But what domain name should I query?
#HEALTHCHECK --interval=5s --timeout=3s --start-period=5s CMD drill @127.0.0.1 cloudflare.com || exit 1

ENTRYPOINT ["/start/entrypoint.sh"]
