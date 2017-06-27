class Forage::Detail < ApplicationRecord
  audited
  belongs_to :forage_simple, class_name: '::Forage::Simple'
  validates_uniqueness_of :url

end
