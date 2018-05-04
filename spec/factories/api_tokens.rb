<<<<<<< HEAD
=======
# == Schema Information
#
# Table name: api_tokens
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  token      :string(64)
#  device     :string
#  expired_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

>>>>>>> 60108ba2b98d9283f2800983444413f0b911c825
FactoryGirl.define do
  factory :api_token do
    user_id nil
    token "MyString"
    device "MyString"
    expired_at "2017-03-16 21:20:07"
  end
end
