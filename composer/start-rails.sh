#!/bin/sh
set -e

dir=`pwd`
cd $(dirname $0)/..
rails_root=`pwd`
cd $dir

mkdir -p ${rails_root}/tmp/sockets
bundle exec puma -C config/puma.rb -b unix://${rails_root}/tmp/sockets/rails.sock