class Complaint < ApplicationRecord
  audited

  belongs_to :user
  belongs_to :source, polymorphic: true
  belongs_to :processed_user, foreign_key: :processed_by, class_name: "User"

  validates_presence_of :complaint_type, :user, :reason

  enum complaint_type: {
    complaint: 0,
    community_feedback: 1
  }

  enum status: {
    rejected: 0,
    approved: 1
  }

  after_create do
    complaint_source = self.source
    unless complaint_source.blank?
      complaint_source.complaints_count += 1
      if complaint_source.complaints_count > 3 && !complaint_source.is_complainted
        complaint_source.is_complainted = true
      end
      complaint_source.save!
    end
  end

end
