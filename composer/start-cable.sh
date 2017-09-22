#!/bin/sh
set -e

pushd .
cd $PWD/$(dirname $0)/..
rails_root=`pwd`
popd

# bundle exec puma -C config/puma.rb -b unix://${rails_root}/tmp/sockets/cable.sock ${rails_root}/cable/config.ru
mkdir -p ${rails_root}/tmp/sockets
ENABLE_ACTION_CABLE=true bundle exec puma -C config/puma.rb -b unix://${rails_root}/tmp/sockets/cable.sock