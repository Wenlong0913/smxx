#!/bin/bash
set -e
source /etc/profile

dir=`pwd`
cd $(dirname $0)/..
rails_root=`pwd`
cd $dir

cat << EOS > ${rails_root}/config/application.yml
PROJECT_NAME: ${PROJECT_NAME}
POSTGRESQL_DATABASE_HOST: ${POSTGRESQL_DATABASE_HOST}
POSTGRESQL_DATABASE_NAME: ${POSTGRESQL_DATABASE_NAME}
POSTGRESQL_DATABASE_USERNAME: ${POSTGRESQL_DATABASE_USERNAME}
POSTGRESQL_DATABASE_PASSWORD: ${POSTGRESQL_DATABASE_PASSWORD}
RAILS_MAX_THREADS: ${RAILS_MAX_THREADS}
SECRET_KEY_BASE: ${SECRET_KEY_BASE}
REDIS_URL: ${REDIS_URL}
EOS

echo "${SETTINGS_YML}" > ${rails_root}/config/settings.${PROJECT_NAME}.yml

# link cms-templates
# if [ -L ${rails_root}/public/templetes ]; then unlink ${rails_root}/public/templetes ;fi
# if [ -d ${rails_root}/public/templetes ]; then rmdir -rf ${rails_root}/public/templetes ;fi
# ln -sf /srv/cms-templates ${rails_root}/public/templetes

# seed db if database doesn't exists
(bundle exec rails r "1" 2>&1|grep "NoDatabaseError" || \
 bundle exec rails r "puts User.table_exists?" | grep "false"
) && bundle exec rails db:setup

exit 0