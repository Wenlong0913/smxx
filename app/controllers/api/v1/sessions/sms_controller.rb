class Api::V1::Sessions::SmsController < Api::V1::BaseController

  def create
    if User::Mobile.find_by(phone_number: params[:mobile]).try(:user)
      t = Sms::Token.new(params[:mobile])
      is_dev = !(Rails.env.staging? || Rails.env.production?)
      code = is_dev ? '1234' : (10000 + SecureRandom.random_number(10**8)).to_s[-5..-1]
      body = Settings.mobile.auth_token_template.gsub('#code#', code)
      t.create code: code, message: body
      begin
        response = t.post!
        response.valid!
        render json: {message: "验证码发送成功！#{is_dev && '非生成环境虚拟验证码[1234]'}", status: 'ok'}
      rescue Sms::Services::YunPianService::SentFailed
        render json: {message: '服务器出问题啦，请稍候在试！', status: 'error'}
      end
    else
      render json: {message: '手机号不存在，请检查！', status: 'error'}
    end
  end

end
