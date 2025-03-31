FROM alpine/psql:17.4 as dist

RUN apk add --no-cache busybox

WORKDIR /pg-init
COPY init-db.sh ./
RUN chmod +x ./init-db.sh

ENV PGDATABASE=skooster
ENV PGUSER=skooster_pg_init
ENV PGSSLMODE=verify-full
ENV PGSSLCERTMODE=require
ENV PGSSLCERT=/pg-init/tls/tls.crt
ENV PGSSLKEY=/pg-init/tls/tls.key
ENV PGSSLROOTCERT=/pg-init/tls/ca.crt

ENTRYPOINT ["sh", "./init-db.sh"]
