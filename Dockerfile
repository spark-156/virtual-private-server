FROM caddy:builder AS builder

RUN xcaddy build --with github.com/caddy-dns/cloudflare@latest

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
