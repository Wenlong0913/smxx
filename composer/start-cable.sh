#!/bin/bash
set -e
source /etc/profile

dir=`pwd`
cd $(dirname $0)/..
rails_root=`pwd`
cd $dir

# bundle exec puma -C config/puma.rb -b unix://${rails_root}/tmp/sockets/cable.sock ${rails_root}/cable/config.ru
mkdir -p ${rails_root}/tmp/sockets
ENABLE_ACTION_CABLE=true bundle exec puma -C config/puma.rb -b tcp://0.0.0.0 -p 5000