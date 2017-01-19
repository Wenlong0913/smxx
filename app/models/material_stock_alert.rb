class MaterialStockAlert < ApplicationRecord
  audited

  enum status: [:unprocessed, :processed]

  belongs_to :material
end
