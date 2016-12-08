require 'devise'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.include ControllerMacros, :type => :controller
  config.include ControllerMacros, :type => :request
end
