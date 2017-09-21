# FROM registry.corp.tanmer.com:5000/tanmer/ruby:2.3-20170919
FROM ruby:2.3.3-alpine
RUN sed -i 's!http://dl-cdn.alpinelinux.org!http://mirrors.aliyun.com!' /etc/apk/repositories

ARG BUNDLE_GEMS__TANMER__COM
WORKDIR /srv/dagle
COPY Gemfile* /srv/dagle/
COPY components /srv/dagle/components
COPY vendor/cache vendor/cache
RUN apk --update add --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers git\
    openssl-dev postgresql-dev libxml2-dev libxslt-dev && \
    BUNDLE_GEMS__TANMER__COM=${BUNDLE_GEMS__TANMER__COM} bundle install --jobs 4 --deployment --without development test
COPY . .
RUN rm -rf vendor/cache
EXPOSE 3000
CMD ["compose/startup.sh"]