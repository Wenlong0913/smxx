module Comment
  class Entry < ApplicationRecord
    belongs_to :resource, polymorphic: true
    belongs_to :user, optional: true
    belongs_to :parent, class_name: 'Comment::Entry'

    validate :check_parent_id

    def check_parent_id
      errors.add(:parent_id, "parent_id don't exist") if parent && !resource.comments.exists?(parent_id) 
    end
  end
end
