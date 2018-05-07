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

FactoryGirl.define do
  factory :member_note do
    member nil
    user nil
    message "MyText"
  end
end
