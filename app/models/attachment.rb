class Attachment < ApplicationRecord
  audited
  belongs_to :owner, polymorphic: true

  store_accessor :data, :attachment, :attachment_file_name, :attachment_file_size, :attachment_content_type, :attachment_updated_at
  has_attached_file :attachment,
                    path: ":rails_root/public/attachments/:id/:style.:extension",
                    hash_secret: 'f240-r3i-3-',
                    :url => "/attachments/:id/:style.:extension"
  validates :attachment, attachment_presence: true
  validates_with AttachmentSizeValidator, attributes: :attachment, less_than: 10.megabytes
  validates_attachment_content_type :attachment, :content_type => /.*/

  def attachment_url
    Settings.site.host + attachment.url
  end
end
