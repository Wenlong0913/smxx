class PreorderConversition < Ticket
  audited

  has_many_comments
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
  has_many :attachment_relations, as: :relation
  has_many :attachments, :through => :attachment_relations
end
