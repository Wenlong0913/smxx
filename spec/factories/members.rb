<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: members
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  site_id      :integer
#  name         :string
#  birth        :date
#  qq           :string
#  email        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  mobile_phone :string
#  tel_phone    :string
#  wechat       :string
#  firm         :string
#  address      :string
#  note         :string
#  features     :jsonb
#  typo         :string
#  from         :string
#  owned        :string
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :member do
    user nil
    site nil
    name "MyString"
    gender 1
    birth "MyString"
    qq "MyString"
    email "MyString"
  end
end
