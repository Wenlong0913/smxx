class Discover < ApplicationRecord
  belongs_to :resource, polymorphic: true
end
