#!/bin/sh
set -eu


certonly --webroot --webroot-path=/var/www/certbot/ --email "${EMAIL}" --agree-tos --no-eff-email -d "${DOMAINS}"
