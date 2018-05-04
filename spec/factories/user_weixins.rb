# == Schema Information
#
# Table name: user_weixins
#
<<<<<<< HEAD
#  id         :integer          not null, primary key
#  user_id    :integer
#  uid        :string
#  name       :string
#  headshot   :string
#  city       :string
#  province   :string
#  country    :string
#  gender     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
=======
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
>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
#

FactoryGirl.define do
  factory :user_weixin, class: 'User::Weixin' do
    
  end
end
