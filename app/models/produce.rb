class Produce < ApplicationRecord
  audited
  belongs_to :order
end
