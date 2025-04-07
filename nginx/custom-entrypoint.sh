#!/bin/sh
set -eu


certbot certonly --webroot --webroot-path=/var/www/certbot/ --email "${EMAIL}" --agree-tos --no-eff-email -d "${DOMAINS}"
