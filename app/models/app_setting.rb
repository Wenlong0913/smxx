class AppSetting < ApplicationRecord
  audited

  store_accessor :app_data, :site_share_url_pattern, :product_share_url_pattern, :system_rooms, :service_banners, :main_banners, :app_version_message

  validates_presence_of :name, :key_word
  validates_uniqueness_of :name, scope: [:key_word]
end
