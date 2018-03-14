#! /bin/bash -l
ln -sf /etc/railsconfig/*.yml /srv/app/config/
mkdir -p /srv/app/tmp/pids/

exec $@
