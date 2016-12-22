class Catalog < ApplicationRecord
  audited
  has_closure_tree dependent: :destroy
  belongs_to :parent

  validates_presence_of :name
  validates_uniqueness_of :name

end
