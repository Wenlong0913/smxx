redis_config = Rails.application.config_for(:redis)
redis_setting = {
  url: redis_config['url'],
  namespace: [ENV['PROJECT_NAME'], Rails.env, redis_config['namespace_suffix']].compact.join('-')
}
Sidekiq.configure_server do |config|
  config.redis = redis_setting
end

Sidekiq.configure_client do |config|
  config.redis = redis_setting
end

Sidekiq.redis { |conn| Redis.current = conn }
