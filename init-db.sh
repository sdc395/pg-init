#/bin/sh

echo "intialising database..."

find /init-db.d -type f -iname '*.sql' -print0 | sort -z | xargs -0 -t -n1 psql -v ON_ERROR_STOP=1 -f
