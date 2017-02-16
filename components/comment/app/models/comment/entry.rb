module Comment
  class Entry < ApplicationRecord
    store_accessor :features, :offer
    belongs_to :resource, polymorphic: true
    belongs_to :user, optional: true
    belongs_to :parent, class_name: 'Comment::Entry'
    has_many :children, class_name: 'Comment::Entry', foreign_key: :parent_id, dependent: :destroy
    has_many :image_item_relations, as: :relation, dependent: :destroy
    has_many :image_items, :through => :image_item_relations
    has_many :attachment_relations, as: :relation, dependent: :destroy
    has_many :attachments, :through => :attachment_relations

    validates_presence_of :content
    validate :check_parent_id

    def check_parent_id
      errors.add(:parent_id, "parent_id don't exist") if parent && !resource.comments.exists?(parent_id) 
    end
  end
end
