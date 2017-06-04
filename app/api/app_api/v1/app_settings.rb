module AppAPI::V1
  class AppSettings < Grape::API
    helpers AppAPI::SharedParams
    resources :app_settings do

      desc 'App配置信息'
      get do
        Rails.application.config_for(:app_settings)
      end

    end # end of resources
  end
end
