Rails.application.config.action_cable.allowed_request_origins = [
  %r{.*}
]

require_relative 'sidekiq'
require 'action_cable/subscription_adapter/redis'
# 让ActionCable使用带namespace的Redis连接, 同时保持跟Sidekiq使用同一个Redis
ActionCable::SubscriptionAdapter::Redis.redis_connector = ->(config) do
   Sidekiq.redis { |redis| redis }
end