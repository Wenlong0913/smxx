#! /bin/bash -l
ln -sf /etc/railsconfig/*.yml /srv/app/config/

exec $@
