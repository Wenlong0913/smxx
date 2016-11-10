class User::Mobile < ApplicationRecord
  self.table_name = 'user_mobiles'
  belongs_to :user

  def send_text(provider_name, owner, content, extend = nil)
    Mobile::Sms.send_text provider_name, owner, self, content, extend
  end

  def self.send_sms_auth_token(mobile)
    k = "auth-token-#{mobile}"
    fail Mobile::SendSmsAuthTokenTooFrequently.new(mobile) if Sidekiq.redis { |c| c.get k }
    code = (10000 + SecureRandom.random_number(10**8)).to_s[-5..-1]
    body = Settings.mobile.auth_token_template.gsub('#code#', code)
    Mobile::Sms.send_text Settings.sms.provider, nil, mobile, body
    Sidekiq.redis do |c| 
      k = "auth-token-#{mobile}"
      c.set k, code
      c.expire k, Settings.mobile.auth_token_expires_in
    end
  end

  def self.valid_auth_token?(mobile, code)
    Sidekiq.redis{|c| c.get "auth-token-#{mobile}"} == code
  end

end
