#!/bin/sh
set -e

dir=`pwd`
cd $(dirname $0)/..
rails_root=`pwd`
cd $dir

cat << EOS > /etc/nginx/conf.d/dagle.conf

upstream rails {
  server unix://${rails_root}/tmp/sockets/rails.sock fail_timeout=0;
}

upstream cable {
  server unix://${rails_root}/tmp/sockets/cable.sock fail_timeout=0;
}

server {
  listen 80;
  server_name $DOMAIN;
  root ${rails_root}/public;
  try_files \$uri/index.html \$uri @rails;

  client_max_body_size 32M;
  keepalive_timeout 10;

  access_log ${rails_root}/log/nginx.access.log;
  error_log ${rails_root}/log/nginx.error.log;
  
  location @rails {
    proxy_pass http://rails;
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_set_header Host \$http_host;
    proxy_redirect off;
  }

  location /cable {
    proxy_pass http://cable;
    proxy_http_version 1.1;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection "upgrade";
  }

  location ^~ /assets/ {
    gzip_static on;
    expires max;
    add_header Cache-Control public;
  }

  if (\$request_method !~ ^(GET|HEAD|PUT|PATCH|POST|DELETE|OPTIONS)\$ ){
    return 405;
  }
}
EOS