<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: communities
#
#  id               :integer          not null, primary key
#  name             :string
#  features         :jsonb
#  address_line     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  address_alias_id :integer
#  is_published     :boolean          default(TRUE)
#  updated_by       :integer
#  owned_by         :integer
#  contact_info     :string
#  note             :text
#  lng              :decimal(20, 14)
#  lat              :decimal(20, 14)
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :community do
    name "MyString"
    features ""
    address_line "MyString"
  end
end
