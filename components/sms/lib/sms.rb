require 'redis'
require 'sms/token'
module Sms

  def self.setup
    yield self if block_given?
    self
  end

  @@redis = Redis.current
  def self.redis
    @@redis
  end

  def self.redis=(v)
    @@redis = v
  end

  @@key_prefix = 'tmf-sms:'
  def self.key_prefix
    @@key_prefix
  end

  def self.key_prefix=(v)
    @@key_prefix = v
  end

  # Should customize this service to send real sms
  @@service = ->(token_body) {  puts "[SMS] simulating to send sms : #{token_body.message}" }
  def self.service
    @@service
  end

  def self.service=(v)
    @@service = v
  end

  def self.cleanup!
    # TODO: delete all mobiles from Redis
  end

  # Get all mobiles whose token codes are not expired
  def self.mobiles
    # TODO: fetch mobiles from Redis
    []
  end
end
