<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: forage_sources
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  catalog_name :string
#  url          :string
#  note         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :forage_source, class: 'Forage::Source' do
    name "MyString"
    catalog_name "MyString"
    url "MyString"
    note "MyString"
  end
end
