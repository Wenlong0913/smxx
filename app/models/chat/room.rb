# == Schema Information
#
# Table name: chat_rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_type :string
#  owner_id   :integer
#  created_by :integer
#

class Chat::Room < ApplicationRecord
  audited
  has_many :messages, dependent: :destroy
  belongs_to :owner, polymorphic: true
  belongs_to :user, foreign_key: :created_by, class_name: 'User'
end
