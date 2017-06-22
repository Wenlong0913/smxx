class Forage::RunKey < ApplicationRecord
  audited
  belongs_to :forage_source, class_name: '::Forage::Source'
  has_many :forage_simples, dependent: :destroy
  validates_uniqueness_of [:forage_source_id, :date]

end
