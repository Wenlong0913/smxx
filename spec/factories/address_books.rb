# == Schema Information
#
# Table name: address_books
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  name         :string           not null
#  gender       :string
#  mobile_phone :string           not null
#  city         :string           not null
#  street       :string           not null
#  house_number :string
#  features     :jsonb
#  note         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :address_book do
    user nil
    name "MyString"
    gender "MyString"
    mobile_phone "MyString"
    city "MyString"
    street "MyString"
    house_number "MyString"
    note "MyString"
  end
end
