# == Schema Information
#
# Table name: forage_details
#
#  id            :integer          not null, primary key
#  url           :string           not null
#  migrate_to    :string
#  can_purchase  :boolean          default(FALSE)
#  purchase_url  :string
#  title         :string
#  keywords      :string
#  image         :string
#  description   :string
#  content       :text
#  date          :string
#  time          :string
#  address_line1 :string
#  address_line2 :string
#  phone         :string
#  price         :string
#  from          :string
#  has_site      :boolean          default(FALSE)
#  site_name     :string
#  note          :string
#  features      :jsonb
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  simple_id     :integer          not null
#  is_merged     :string           default("n")
#

class Forage::Detail < ApplicationRecord
  audited
  store_accessor :features, :original_catalog, :district_from

  belongs_to :simple, class_name: '::Forage::Simple'
  validates_uniqueness_of :url, scope: :simple_id

end
