require "tracker/engine"
require 'tracker/options'
require 'tracker/handler'
require 'tracker/acts_as_trackable'

module Tracker
  # Your code goes here...
  @@user_model_name = 'User'
  mattr_accessor :user_model_name
end
