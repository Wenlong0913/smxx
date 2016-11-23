module Comment
  class Entry < ApplicationRecord
    belongs_to :resource, polymorphic: true
    belongs_to :user, optional: true

    def replies
      Comment::Entry.where(resource: self)
    end
  end
end
