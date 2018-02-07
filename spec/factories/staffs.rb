# == Schema Information
#
# Table name: staffs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  features   :jsonb
#  type       :string
#

FactoryGirl.define do
  factory :staff do
    
  end
end
