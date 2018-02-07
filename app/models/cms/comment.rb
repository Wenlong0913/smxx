# == Schema Information
#
# Table name: cms_comments
#
#  id           :integer          not null, primary key
#  contact      :string
#  content      :text
#  features     :jsonb
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  site_id      :integer          not null
#  source_type  :string
#  source_id    :integer
#  user_id      :integer
#  is_published :boolean          default(TRUE)
#

class Cms::Comment < ApplicationRecord
  audited
  belongs_to :site, class_name: '::Cms::Site'
  belongs_to :source, polymorphic: true
  store_accessor :features, :status, :properties, :name, :mobile_phone, :tel_phone,:email,:qq,
  :address,:gender,:birth,:hobby,:content2,:content3,:branch,:datetime

end
