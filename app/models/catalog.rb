class Catalog < ApplicationRecord
  audited
  has_closure_tree dependent: :destroy
  store_accessor :features, :settings

  validates :name, uniqueness: {scope: :parent_id}, presence: true
end
