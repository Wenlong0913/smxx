# == Schema Information
#
# Table name: cms_keystores
#
#  id          :integer          not null, primary key
#  site_id     :integer
#  key         :string           not null
#  value       :string           not null
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cms::Keystore < ApplicationRecord
  audited
  belongs_to :site, class_name: '::Cms::Site'
  validates_presence_of :key, :value
  validates_uniqueness_of :key, scope: [:site_id]

  #methods is in cms/site.rb
end
