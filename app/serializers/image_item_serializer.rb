# == Schema Information
#
# Table name: image_items
#
#  id         :integer          not null, primary key
#  owner_type :string
#  owner_id   :integer
#  name       :string
#  file_size  :integer
#  width      :integer
#  height     :integer
#  data       :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ImageItemSerializer < ActiveModel::Serializer
  attributes :id, :image_url
end
