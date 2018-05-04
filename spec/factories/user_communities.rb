<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: user_communities
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  community_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_current   :boolean          default(FALSE)
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :user_community do
    user nil
    community nil
  end
end
