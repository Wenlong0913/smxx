#!/bin/sh
set -e
ln -sf /srv/${APP_NAME}/nginx/default.conf /etc/nginx/conf.d/
nginx -g 'daemon off;'