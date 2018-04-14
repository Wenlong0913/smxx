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

class UserCommunity < ApplicationRecord
  audited
  belongs_to :user
  belongs_to :community
end
