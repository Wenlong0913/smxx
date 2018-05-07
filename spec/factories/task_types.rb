# == Schema Information
#
# Table name: task_types
#
#  id         :integer          not null, primary key
#  type       :string
#  name       :string
#  ordinal    :integer
#  roles      :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :task_type do
    type ""
    name "MyString"
    ordinal 1
    roles ""
  end
end
