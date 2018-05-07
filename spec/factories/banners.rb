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

FactoryGirl.define do
  factory :banner do
    
  end
end
