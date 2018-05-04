# == Schema Information
#
# Table name: banners
#
#  id               :integer          not null, primary key
#  title            :string
#  banner_type      :integer
#  image_url        :string
#  redirect_web_url :string
#  redirect_app_url :string
#  features         :jsonb
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Banner < ApplicationRecord
  audited

  enum banner_type: {
    main: 0,      # app首页
    privated: 1,  # app私藏界面
    discover: 2,  # app发现界面
  }

  store_accessor :features, :description
  validates_presence_of :title, :banner_type, :image_url
  validates_uniqueness_of :title, scope: [:banner_type, :image_url]
end
