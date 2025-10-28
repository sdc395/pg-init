#/bin/sh
set -euo pipefail

SCRIPT_DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
INIT_DIR="${SCRIPT_DIR}/init-db.d"

echo "initialising database..."

find "$INIT_DIR" -type f -iname '*.sql' -print0 | sort -z | while read -d $'\0' file
do
    echo "$file"
    psql -v ON_ERROR_STOP=1 -f "$file"
done
