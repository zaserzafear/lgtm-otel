FROM memcached:1.6.39

USER root
RUN apt-get update \
 && apt-get install -y netcat-openbsd \
 && rm -rf /var/lib/apt/lists/*

USER memcache
HEALTHCHECK --interval=10s --timeout=3s --retries=3 \
  CMD echo stats | nc 127.0.0.1 11211 || exit 1
