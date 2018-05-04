# == Schema Information
#
# Table name: discovers
#
#  id            :integer          not null, primary key
#  resource_type :string
#  resource_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Discover < ApplicationRecord
  belongs_to :resource, polymorphic: true
end
