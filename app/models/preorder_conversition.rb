class PreorderConversition < Ticket
  audited
  store_accessor :features, :offer, :member_name, :member_phone, :member_address, :site_confirm, :factory_confirm
  validates_presence_of :site, :member_name
  has_many_comments
  has_many :image_item_relations, as: :relation
  has_many :image_items, :through => :image_item_relations
  has_many :attachment_relations, as: :relation
  has_many :attachments, :through => :comments

  before_save do
    self.site_confirm = false if site_confirm.blank?
    self.factory_confirm = false if factory_confirm.blank?
  end

end
