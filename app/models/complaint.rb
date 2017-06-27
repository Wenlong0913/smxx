class Complaint < ApplicationRecord
  audited

  belongs_to :user
  belongs_to :source, polymorphic: true
  belongs_to :processed_user, foreign_key: :processed_by, class_name: "User"

  validates_presence_of :source, :user, :reason

  enum status: {
    rejected: 0,
    approved: 1
  }

  after_create do
    complaint_source = self.source
    complaint_source.complaints_count += 1
    if complaint_source.complaints_count > 3 && !complaint_source.is_complainted
      complaint_source.is_complainted = true
    end
    complaint_source.save!
  end

end
