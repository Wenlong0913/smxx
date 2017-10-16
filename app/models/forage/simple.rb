class Forage::Simple < ApplicationRecord
  audited
  belongs_to :run_key, class_name: '::Forage::RunKey'

  store_accessor :features, :original_catalog, :district_from
  has_many :details, dependent: :destroy
  validates_uniqueness_of :url
end
