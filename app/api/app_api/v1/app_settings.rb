module AppAPI::V1
  class AppSettings < Grape::API
    helpers AppAPI::SharedParams
    resources :app_settings do

      desc 'App配置信息'
      get do
        info = AppSetting.where(key_word: 'APP-Setting').first
        app_data = {
          site_share_url_pattern: info.site_share_url_pattern,
          product_share_url_pattern: info.product_share_url_pattern,
          system_rooms: begin eval(info.system_rooms) rescue nil end,
          service_banners: begin eval(info.service_banners) rescue nil end,
          main_banners: begin eval(info.service_banners) rescue nil end,
          app_version_message: begin eval(info.app_version_message) rescue nil end
        }
        present app_data
      end

    end # end of resources
  end
end
