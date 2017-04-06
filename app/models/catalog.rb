# == Schema Information
#
# Table name: catalogs
#
#  id         :integer          not null, primary key
#  parent_id  :integer
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string
#  features   :jsonb
#

class Catalog < ApplicationRecord
  audited
  has_closure_tree dependent: :destroy
  store_accessor :features, :settings

  validates :name, uniqueness: {scope: [:parent_id, :type]}, presence: true
end
