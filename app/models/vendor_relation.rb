class VendorRelation < ApplicationRecord
  audited

  belongs_to :vendor
  belongs_to :relation, polymorphic: true
end
