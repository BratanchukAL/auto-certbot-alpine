#!/bin/sh
set -eu pipefail

# parallel crond, certbot, nginx
    /usr/sbin/crond -f -l 8 -d 8 \
&   certbot certonly --webroot --webroot-path=/var/www/certbot/ --email "${EMAIL}" --agree-tos --no-eff-email -d "${DOMAINS}" \
&   sh /docker-entrypoint.sh nginx -g "daemon off;"

