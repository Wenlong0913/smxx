# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  site_id     :integer
#  title       :string
#  short_title :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Page < ApplicationRecord
  belongs_to :site
  has_many :items, dependent: :destroy
  store_accessor :features, :short_title, :description

  validates_presence_of :title
  validates_presence_of :site
end
