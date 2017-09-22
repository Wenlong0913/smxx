#!/bin/sh
set -e

pushd .
cd $PWD/$(dirname $0)/..
rails_root=`pwd`
popd

mkdir -p ${rails_root}/tmp/sockets
bundle exec puma -C config/puma.rb -b unix://${rails_root}/tmp/sockets/rails.sock