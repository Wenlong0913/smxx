<<<<<<< HEAD
=======
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

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :banner do
    
  end
end
