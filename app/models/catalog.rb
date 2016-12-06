class Catalog < ApplicationRecord
  audited

  belongs_to :parent
end
