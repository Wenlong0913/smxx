class Forage::Simple < ApplicationRecord
  audited
  belongs_to :run_key, class_name: '::Forage::RunKey'
  has_many :details, dependent: :destroy
  validates_uniqueness_of :url
end
