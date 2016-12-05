require 'devise'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, :type => :controller
  # https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara
  #   login_as(user, :scope => :user)
  config.include Warden::Test::Helpers, type: :feature
end
