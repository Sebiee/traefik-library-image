FROM sebieee/traefik:${VERSION}-alpine AS alpine-source
FROM scratch
COPY --from=alpine-source /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=alpine-source /usr/share/zoneinfo /usr/share/
COPY --from=alpine-source /usr/local/bin/traefik /

EXPOSE 80
VOLUME ["/tmp"]
ENTRYPOINT ["/traefik"]

# Metadata
LABEL org.opencontainers.image.vendor="Sebiee" \
    org.opencontainers.image.url="https://github.com/Sebiee/traefik" \
    org.opencontainers.image.source="https://github.com/Sebiee/traefik" \
    org.opencontainers.image.title="Traefik" \
    org.opencontainers.image.description="A modern reverse-proxy (custom build)" \
    org.opencontainers.image.version="$VERSION" \
    org.opencontainers.image.documentation="https://docs.traefik.io"
