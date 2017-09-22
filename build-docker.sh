#!/bin/sh
set -e

RAILS_ENV=${RAILS_ENV:-production}
version=`date +%Y%m%d%H%M%S`
build_assets () {
    PROJECT_NAME=${PROJECT_NAME:-dagle} bundle exec \
        rails dbadapter=nulldb \
            assets:clobber \
            assets:precompile \
            webpack:compile
}

build_docker () {
    docker build -t registry.corp.tanmer.com:5000/products/dagle:${version} -f composer/Dockerfile \
    --build-arg BUNDLE_GEMS__TANMER__COM=${BUNDLE_GEMS__TANMER__COM} \
    .
}

build_assets && \
build_docker && echo "

you can push image to out reigistry with this command:

    docker tag registry.corp.tanmer.com:5000/products/dagle:{${version},latest}
    docker push registry.corp.tanmer.com:5000/products/dagle
"