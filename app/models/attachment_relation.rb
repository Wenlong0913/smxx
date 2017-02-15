class AttachmentRelation < ApplicationRecord
  audited

  belongs_to :attachment
  belongs_to :relation, polymorphic: true
end
