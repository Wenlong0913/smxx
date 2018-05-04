<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: member_catalogs
#
#  id         :integer          not null, primary key
#  key        :string           not null
#  value      :text             default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :member_catalog do
    key "MyString"
    value "MyText"
  end
end
