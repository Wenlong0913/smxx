# == Schema Information
#
# Table name: user_weixins
#
#  id                       :integer          not null, primary key
#  user_id                  :integer
#  uid                      :string
#  name                     :string
#  headshot                 :string
#  city                     :string
#  province                 :string
#  country                  :string
#  gender                   :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  access_token             :string
#  refresh_token            :string
#  unionid                  :string
#  access_token_expired_at  :datetime
#  refresh_token_expired_at :datetime
#

FactoryGirl.define do
  factory :user_weixin, class: 'User::Weixin' do
    
  end
end
