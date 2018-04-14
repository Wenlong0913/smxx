# == Schema Information
#
# Table name: cms_keystores
#
#  id          :integer          not null, primary key
#  site_id     :integer
#  key         :string           not null
#  value       :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :cms_keystore, class: 'Cms::Keystore' do
    site nil
    key "MyString"
    value "MyString"
    description "MyString"
  end
end
