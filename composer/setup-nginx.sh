#!/bin/sh
set -e
cat << EOS > /etc/nginx/conf.d/dagle.conf

upstream rails {
  server unix:///srv/dagle/tmp/sockets/rails.sock fail_timeout=0;
}

upstream cable {
  server unix:///srv/dagle/tmp/sockets/cable.sock fail_timeout=0;
}

server {
  listen 80;
  server_name $DOMAIN;
  root /srv/dagle/public;
  try_files $uri/index.html $uri @rails;

  client_max_body_size 32M;
  keepalive_timeout 10;

  access_log /srv/dagle/log/nginx.access.log;
  error_log /srv/dagle/log/nginx.error.log;
  
  location @rails {
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_set_header Host \$http_host;
    proxy_redirect off;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection "Upgrade";
    proxy_set_header X-Forwarded-Proto https;
    proxy_pass http://rails;
    # limit_req zone=one;
  }

  location ^~ /cable/ {
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_set_header Host \$http_host;
    proxy_set_header SERVICE Cable;
    proxy_redirect off;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection "Upgrade";
    proxy_set_header X-Forwarded-Proto https;
    proxy_pass http://cable;
  }

  location ^~ /assets/ {
    gzip_static on;
    expires max;
    add_header Cache-Control public;
  }

  if (\$request_method !~ ^(GET|HEAD|PUT|PATCH|POST|DELETE|OPTIONS)$ ){
    return 405;
  }
}
EOS