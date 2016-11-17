module Comment
  class Entry < ApplicationRecord
    belongs_to :resource, polymorphic: true
  end
end
