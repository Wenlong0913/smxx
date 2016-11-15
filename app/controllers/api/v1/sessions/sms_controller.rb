class Api::V1::Sessions::SmsController < Api::V1::BaseController

  def create
    t = Sms::Token.new(params[:mobile_phone])
    code = (10000 + SecureRandom.random_number(10**8)).to_s[-5..-1]
    body = Settings.mobile.auth_token_template.gsub('#code#', code)
    t.create code: code, message: body
    unless Rails.env.development?
      response = t.post!
      response.valid!
    end
    render json: {message: '验证码发送成功！'}
  end

end