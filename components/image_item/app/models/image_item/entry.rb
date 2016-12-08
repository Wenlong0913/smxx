module ImageItem
  class Entry < ApplicationRecord
    belongs_to :user, optional: true
    store_accessor :features, :image_url, :image_data, :description
  end
end
