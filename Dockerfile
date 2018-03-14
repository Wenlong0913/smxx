FROM docker.corp.tanmer.com/tanmer/dockers/ubuntu:16.04
RUN apt-get update && apt-get install imagemagick -y
WORKDIR /srv/app
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
ADD components /srv/dagle/components
ADD vendor/cache vendor/cache
# ADD client client
RUN bash -l -c "bundle i --without development test"
ADD .git .git
ADD public/assets public/assets
ADD public/webpack public/webpack
ADD public/ckeditor_assets public/ckeditor_assets

RUN cd public \
    && ln -sf ../../cms-templates templetes \
    && git checkout -- . \
    && echo $(git rev-parse --short HEAD) > public/VERSION \
    && rm -rf .git .ruby-version .ruby-gemset

CMD ["entrypoint.sh"]
