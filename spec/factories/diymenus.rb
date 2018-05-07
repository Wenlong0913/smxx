# == Schema Information
#
# Table name: diymenus
#
#  id          :integer          not null, primary key
#  site_id     :integer
#  parent_id   :integer
#  button_type :integer
#  name        :string           not null
#  key         :string
#  url         :string(128)
#  is_show     :boolean          default(FALSE), not null
#  sort        :integer          default(1), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :diymenu do
    
  end
end
