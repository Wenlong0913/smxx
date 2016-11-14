RestClient.log = Logger.new(STDOUT) unless Rails.env.producton?
Sms::Services::YunPianService.api_key = Settings.sms.yun_pian_v1.api_key