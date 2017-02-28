class AttachmentRelation < ApplicationRecord
  audited

  belongs_to :attachment
  belongs_to :relation, polymorphic: true
  validates_uniqueness_of :attachment_id, scope: [:relation_type, :relation_id]
end
