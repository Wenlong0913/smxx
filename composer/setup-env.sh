#!/bin/sh

set -e

cat << EOS > /srv/dagle/config/application.yml
PROJECT_NAME: ${PROJECT_NAME}
POSTGRESQL_DATABASE_HOST: ${POSTGRESQL_DATABASE_HOST}
POSTGRESQL_DATABASE_NAME: ${POSTGRESQL_DATABASE_NAME}
POSTGRESQL_DATABASE_USERNAME: ${POSTGRESQL_DATABASE_USERNAME}
POSTGRESQL_DATABASE_PASSWORD: ${POSTGRESQL_DATABASE_PASSWORD}
RAILS_MAX_THREADS: ${RAILS_MAX_THREADS}
SECRET_KEY_BASE: ${SECRET_KEY_BASE}
REDIS_URL: ${REDIS_URL}
EOS

echo "${SETTINGS_YML}" > /srv/dagle/config/settings.${PROJECT_NAME}.yml

# link cms-templates
if [ -L /srv/dagle/public/templetes ]; then unlink /srv/dagle/public/templetes ;fi
if [ -d /srv/dagle/public/templetes ]; then rmdir -rf /srv/dagle/public/templetes ;fi
ln -sf /srv/cms-templates /srv/dagle/public/templetes

# seed db if database doesn't exists
(bundle exec rails r "1" 2>&1|grep "NoDatabaseError" || \
 bundle exec rails r "puts User.table_exists?" | grep "false"
) && bundle exec rails db:setup
