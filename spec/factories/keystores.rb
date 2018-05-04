<<<<<<< HEAD
=======
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

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :keystore do
    key "MyString"
    value "MyString"
    description "MyString"
  end
end
