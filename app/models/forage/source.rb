# == Schema Information
#
# Table name: forage_sources
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  catalog_name :string
#  url          :string
#  note         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Forage::Source < ApplicationRecord
  audited
  has_many :run_keys, dependent: :destroy
  validates_uniqueness_of :url
end
