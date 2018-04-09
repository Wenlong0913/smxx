# == Schema Information
#
# Table name: keystores
#
#  id          :integer          not null, primary key
#  key         :string           not null
#  value       :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :keystore do
    key "MyString"
    value "MyString"
    description "MyString"
  end
end
