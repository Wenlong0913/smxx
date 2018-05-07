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

FactoryGirl.define do
  factory :user_community do
    user nil
    community nil
  end
end
