RestClient.log = Logger.new(STDOUT) unless Rails.env.producton?
Sms.setup do |s|
  s.service =
    lambda do |token_body|
      if Rails.env.producton? || Rails.env.staging?
        Sms::Services::YunPianService.send_text(token_body.mobile_phone, token_body.message)
      else
        Sms::Services::YunPianService::SendResponse.new('code' => 0)
      end
    end
end
Sms::Services::YunPianService.api_key = Settings.sms.yun_pian_v1.api_key