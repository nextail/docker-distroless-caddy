# syntax=docker/dockerfile:1.4
# https://github.com/caddyserver/caddy/releases
# https://github.com/caddyserver/caddy-docker/blob/00dd7e57fca3ae2e6fdf9cc08526458fd501db79/2.6/alpine/Dockerfile
ARG CADDY_VERSION=2.6.4

FROM caddy:${CADDY_VERSION}-alpine AS caddy_base

FROM gcr.io/distroless/static-debian12:nonroot as debian_nonroot
LABEL author="Ruben Suarez <rubensa@gmail.com>"

ENV CADDY_VERSION=v${CADDY_VERSION}

# See https://caddyserver.com/docs/conventions#file-locations for details
ENV XDG_CONFIG_HOME=/config
ENV XDG_DATA_HOME=/data

EXPOSE 80
EXPOSE 443
EXPOSE 443/udp
EXPOSE 2019

COPY --from=caddy_base --chown=nonroot:nonroot /usr/bin/caddy /usr/bin/caddy
COPY --from=caddy_base --chown=nonroot:nonroot /config /config
COPY --from=caddy_base --chown=nonroot:nonroot /data /data

COPY --from=caddy_base --chown=nonroot:nonroot /etc/caddy/Caddyfile /etc/caddy/Caddyfile
COPY --from=caddy_base --chown=nonroot:nonroot  /usr/share/caddy/ /usr/share/caddy/

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]