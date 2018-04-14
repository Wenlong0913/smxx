# == Schema Information
#
# Table name: permissions
#
#  id          :integer          not null, primary key
#  symbol_name :string
#  name        :string
#  group_name  :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :permission do
    
  end
end
