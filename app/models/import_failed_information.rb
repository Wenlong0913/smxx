# == Schema Information
#
# Table name: import_failed_informations
#
#  id           :integer          not null, primary key
#  origin_type  :string
#  file_name    :string
#  line         :integer
#  name         :string
#  features     :jsonb
#  is_processed :string           default("n")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ImportFailedInformation < ApplicationRecord
  # audited

  store_accessor :features, :name, :province, :real_city, :city, :district, :address_str, :telephone, :lat, :lng, :tags, :image,
                 :uid, :street, :keyword,
                 :is_published, :big_cate, :small_cate, :business_area, :business_hours, :avg_price, :parking, :recommendation, :good_summary, :bad_summary
end
