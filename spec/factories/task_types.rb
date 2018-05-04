<<<<<<< HEAD
=======
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

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :task_type do
    type ""
    name "MyString"
    ordinal 1
    roles ""
  end
end
