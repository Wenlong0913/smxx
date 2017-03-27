module AppAPI::V1
  class User < Grape::API
    helpers AppAPI::SharedParams
    resources :users do
      desc 'Ping status'
      get :ping do
        Time.now
      end

      desc '用户注册' do
        detail <<-DOC
目前只能够手机号+验证码注册
        DOC
        success AppAPI::Entities::User
      end
      params do
        requires :mobile_phone, type: String, desc: '手机号', documentation: { example: 'Jim' }
        requires :mobile_phone_code, type: String, desc: '手机验证码'
        optional :nickname, type: String, desc: '用户昵称'
        optional :device, type: String, desc: '设备信息，可以是UserAgent，也可以是自定义的名字。目的是让一个设备只生成一个access token'
      end
      post do
        flag, user = ::User::Create.(mobile_phone: params[:mobile_phone], nickname: params[:nickname])
        # flag = true
        # user = ::User.new(mobile_phone: params[:mobile_phone])
        error! user.errors unless flag
        api_token = user.api_tokens.find_or_initialize_by(device: params[:device])
        api_token.expired_at = 30.days.since
        api_token.save
        present user, with: AppAPI::Entities::User, access_token: api_token.token, type: :private
      end

      desc '登录认证' do
        detail <<-DOC
- username/email/mobile_phone 三种登录方式只能选择一个
- 如果登录账号是手机号，需要传入手机验证码 mobile_phone_code
- 如果是其他登录账号，需要传入密码 passwrod
        DOC
        success AppAPI::Entities::User
      end
      params do
        optional :username, type: String, desc: '用户名'
        optional :email, type: String, desc: '邮箱'
        optional :mobile_phone, type: String, desc: '手机号'
        exactly_one_of :username, :email, :mobile_phone
        optional :mobile_phone_code, type: String, desc: '手机验证码'
        optional :password, type: String, desc: '登录密码'
        exactly_one_of :mobile_phone_code, :password
        optional :device, type: String, desc: '设备信息，可以是UserAgent，也可以是自定义的名字。目的是让一个设备只生成一个access token'
      end
      post :auth do
        user =
          if params[:username]
            ::User.find_by(username: params[:username])
          elsif params[:email]
            ::User.find_by(email: params[:email])
          elsif params[:mobile_phone]
            ::User.find_by_phone_number(params[:mobile_phone])
          end
        error! "用户不存在", 200 if user.nil?
        error! "密码错误", 200 unless user.valid_password?(params[:password])
        api_token = user.api_tokens.find_or_initialize_by(device: params[:device])
        api_token.expired_at = 30.days.since
        api_token.save
        present user, with: AppAPI::Entities::User, access_token: api_token.token, type: :private
      end

      desc '获取自己的用户信息' do
        success AppAPI::Entities::User
      end
      get 'me' do
        authenticate!
        present current_user, with: AppAPI::Entities::User, type: :private
      end

      desc '获取用户信息' do
        success AppAPI::Entities::User
      end
      params do
        requires :id, type: Integer, desc: '用户ID'
      end
      get ':id' do
        present ::User.find(params[:id]), with: AppAPI::Entities::User
      end

      desc '获取用户列表' do
        success AppAPI::Entities::User.collection
      end
      params do
        use :pagination
        use :sort, fields: [:id, :created_at, :updated_at]
      end
      get do
        permission! :api_admin
        users = paginate_collection(sort_collection(::User.all), params)
        wrap_collection users, AppAPI::Entities::User
      end

    end # end of resources
  end
end
