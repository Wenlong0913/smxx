#!/bin/bash
set -e

dir=`pwd`
cd $(dirname $0)/..
rails_root=`pwd`
cd $dir

echo "Settting up env..."
${rails_root}/composer/setup-env.sh
echo "Setting up Nginx"
${rails_root}/composer/setup-nginx.sh