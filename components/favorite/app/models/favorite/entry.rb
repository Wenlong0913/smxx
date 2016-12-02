module Favorite
  class Entry < ApplicationRecord
    belongs_to :resource, polymorphic: true
    belongs_to :user
  end
end

