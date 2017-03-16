# == Schema Information
#
# Table name: member_notes
#
#  id         :integer          not null, primary key
#  member_id  :integer
#  user_id    :integer
#  message    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MemberNote < ApplicationRecord
  audited
  belongs_to :member
  belongs_to :user
end
