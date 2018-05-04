# == Schema Information
#
# Table name: forage_run_keys
#
#  id           :integer          not null, primary key
#  date         :date
#  is_processed :string           default("n")
#  processed_at :datetime
#  total_count  :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  source_id    :integer          not null
#

class Forage::RunKey < ApplicationRecord
  audited
  belongs_to :source, class_name: '::Forage::Source'
  has_many :simples, dependent: :destroy
  validates_uniqueness_of :source_id, scope: :date
end
