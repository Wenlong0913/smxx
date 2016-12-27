class Catalog < ApplicationRecord
  audited
  has_closure_tree dependent: :destroy

  validates :name, uniqueness: {scope: :parent_id}, presence: true

end
