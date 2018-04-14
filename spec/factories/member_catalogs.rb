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

FactoryGirl.define do
  factory :member_catalog do
    key "MyString"
    value "MyText"
  end
end
