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

class ApiToken < ApplicationRecord
  belongs_to :user
  validates :token, presence: true, uniqueness: true
  before_validation :generate_token, on: :create
  def expired?
    return false if expired_at.blank?
    expired_at < Time.now
  end
  private
  def generate_token
    self.token = Digest::SHA1.hexdigest("--#{user_id}--#{Time.now.to_f}--") if self.token.blank?
  end
end
