# == Schema Information
#
# Table name: forage_simples
#
#  id           :integer          not null, primary key
#  catalog      :string
#  title        :string
#  url          :string           not null
#  features     :jsonb
#  is_processed :string           default("n")
#  processed_at :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  run_key_id   :integer          not null
#

class Forage::Simple < ApplicationRecord
  audited

  store_accessor :features, :district_from, :original_catalog
  belongs_to :run_key, class_name: '::Forage::RunKey'

  store_accessor :features, :original_catalog, :district_from
  has_many :details, dependent: :destroy
  validates_uniqueness_of :url, scope: :run_key_id
end
