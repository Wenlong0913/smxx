module Favorite
  class Entry < ApplicationRecord
    belongs_to :resource, polymorphic: true
    belongs_to :user
    validates_presence_of :resource, :user
  end
end

