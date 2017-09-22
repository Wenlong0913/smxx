#!/bin/sh
set -e

RAILS_ENV=${RAILS_ENV:-production}

build_assets () {
    PROJECT_NAME=${PROJECT_NAME:-dagle} bundle exec \
        rails dbadapter=nulldb \
            assets:clobber \
            assets:precompile \
            webpack:compile
}

build_docker () {
    docker build -t registry.corp.tanmer.com:5000/products/dagle:`date +%Y%m%d%H%M%S` -f composer/Dockerfile \
    --build-arg BUNDLE_GEMS__TANMER__COM=${BUNDLE_GEMS__TANMER__COM} \
    .
}

build_assets && \
build_docker
