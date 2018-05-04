<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: produces
#
#  id          :integer          not null, primary key
#  order_id    :integer
#  status      :integer
#  assignee_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :produce do
    order nil
    status 1
    current_task_id 1
    assignee_id 1
  end
end
