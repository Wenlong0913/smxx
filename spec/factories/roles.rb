# == Schema Information
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  name          :string
#  resource_type :string
#  resource_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#  role_name     :string
#

FactoryGirl.define do
  factory :role do
    
  end
end
