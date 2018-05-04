<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  site_id       :integer
#  title         :string
#  description   :text
#  creator_id    :integer
#  assignee_id   :integer
#  resource_type :string
#  resource_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ordinal       :integer
#  task_type_id  :integer
#  status        :integer
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :task do
    site nil
    title "MyString"
    description "MyText"
    creator_id 1
    assignee_id 1
    resource nil
  end
end
