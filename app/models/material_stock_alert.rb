class MaterialStockAlert < ApplicationRecord
  audited

  enum status: [:unprocessed, :processed]

  belongs_to :owner, polymorphic: true
end
