class Article < ApplicationRecord
  audited
  has_many :image_item_relations, as: :relation, dependent: :destroy
  has_many :image_items, :through => :image_item_relations
  has_many :article_products, dependent: :destroy
  has_many :products, :through => :article_products
  has_many :article_users, dependent: :destroy
  # 活动参与人员
  has_many :users, :through => :article_users
  has_many :discovers, as: :resource, dependent: :destroy
  has_many_comments
  has_many_likes
  belongs_to :user, foreign_key: :author, class_name: 'User'
  acts_as_taggable
  after_save do
    discover = self.discovers.find_or_create_by(resource: self)
    discover.save!
  end

  def api_created_at
    created_at.to_i
  end
end
