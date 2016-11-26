source "https://gems.ruby-china.org"


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use mysql as the database for Active Record
#gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'kaminari', '~> 0.17.0'
gem 'kaminari-i18n', '~> 0.4.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem "rolify", '~> 5.1.0'
gem "pundit", '~> 1.1.0'
gem 'slim-rails', '~> 3.1.1'
gem 'devise', '~> 4.2.0'
gem 'devise-i18n'
gem 'jwt', '~> 1.5.6'
gem 'settingslogic', '~> 2.0.9'
gem 'swagger-docs'
gem 'font-awesome-rails', '~> 4.7.0'
gem 'simple_form', '~> 3.3.1'

# In Rails 5, active_model/serializers/xml has been extracted into its own gem.
#   So, a quick solution is to add the activemodel-serializers-xml gem to your Gemfile
#   https://github.com/drapergem/draper/issues/697
gem 'draper', '~> 2.1.0'
gem 'activemodel-serializers-xml', git: 'https://github.com/rails/activemodel-serializers-xml'

# Audited (previously acts_as_audited) is an ORM extension that logs all changes
#   to your models. Audited can also record who made those changes, save comments
#   and associate models related to the changes.
gem "audited", "~> 4.3"
gem "rails-observers", github: 'rails/rails-observers'

#weixin
gem "weixin_rails_middleware", '~> 1.3', '>= 1.3.1'
gem 'weixin_authorize', '1.6.3'
gem "omniauth-wechat-oauth2", "~> 0.1.0"

# require components
gem 'sms', path: 'components/sms'
gem 'tracker', path: 'components/tracker'
gem 'theme_color_admin', git: 'git@gitlab.tanmer.com:tm-themes/theme_color_admin.git'
gem 'theme_card', git: 'git@gitlab.tanmer.com:tm-themes/theme_card.git'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'pry-rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'bower-rails'
  gem 'webmock'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-livereload'
end

group :development, :doc do
  # https://github.com/lsegal/yard
  gem 'yard'
  # https://github.com/ctran/annotate_models
  gem 'annotate'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
