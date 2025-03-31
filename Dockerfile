FROM alpine/psql:17.4 as dist

RUN apk add --no-cache busybox

WORKDIR /
COPY init-db.sh ./
RUN chmod +x ./init-db.sh

ENV PGDATABASE=skooster
ENV PGUSER=skooster_pg_init
ENV PGSSLMODE=verify-full
ENV PGSSLCERTMODE=require
ENV PGSSLCERT=tls.crt
ENV PGSSLKEY=tls.key
ENV PGSSLROOTCERT=ca.crt

ENTRYPOINT ["sh", "./init-db.sh"]
