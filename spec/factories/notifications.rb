<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: notifications
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  actor_id           :integer
#  notify_type        :string           not null
#  target_type        :string
#  target_id          :integer
#  target_url         :string
#  target_name        :string
#  second_target_type :string
#  second_target_id   :integer
#  second_target_url  :string
#  second_target_name :string
#  third_target_type  :string
#  third_target_id    :integer
#  third_target_url   :string
#  third_target_name  :string
#  content            :string
#  read_at            :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :notification do
    user_id 1
    actor_id 1
    notify_type "MyString"
    target nil
    second_target nil
    third_target nil
    read_at "2017-08-04 11:23:46"
  end
end
