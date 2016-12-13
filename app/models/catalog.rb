class Catalog < ApplicationRecord
  audited
  has_closure_tree dependent: :destroy
  belongs_to :parent
end
