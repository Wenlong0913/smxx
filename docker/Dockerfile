FROM docker.corp.tanmer.com/tanmer/dockers/ubuntu:16.04

RUN apt-get install imagemagick libmagickwand-dev -y
ARG BUNDLE_GEMS__TANMER__COM
WORKDIR /srv/dagle
COPY Gemfile* /srv/dagle/
COPY components /srv/dagle/components
COPY vendor/cache vendor/cache
RUN bash -c "source /etc/profile && BUNDLE_GEMS__TANMER__COM=${BUNDLE_GEMS__TANMER__COM} bundle install --jobs 4 --deployment --without development test"
COPY .git .git
RUN git checkout -- . && echo $(git rev-parse --short HEAD) > public/VERSION && rm -rf .git .ruby-version .ruby-gemset

COPY public/assets public/assets
COPY public/webpack public/webpack
COPY public/ckeditor_assets public/ckeditor_assets
RUN cd public && ln -sf ../../cms-templates templetes
EXPOSE 3000
