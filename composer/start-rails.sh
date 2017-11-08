#!/bin/bash
set -e
source /etc/profile

dir=`pwd`
cd $(dirname $0)/..
rails_root=`pwd`
cd $dir

mkdir -p ${rails_root}/tmp/sockets
bundle exec puma -C config/puma.rb -b tcp://0.0.0.0 -p 3000