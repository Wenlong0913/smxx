#!/bin/sh
set -e

rails_root=$PWD/$(dirname $0)/..
bundle exec puma -C config/puma.rb -b unix://${rails_root}/tmp/sockets/rails.sock