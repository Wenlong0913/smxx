class Forage::Detail < ApplicationRecord
  audited
  store_accessor :features

  belongs_to :simple, class_name: '::Forage::Simple'
  validates_uniqueness_of :url

end
