class Forage::CatalogRelation < ApplicationRecord
  audited

  belongs_to :catalog
end
