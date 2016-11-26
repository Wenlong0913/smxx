# 物件：抽象所有的物品，包含多个特征
class Item < ApplicationRecord
  belongs_to :site
  has_and_belongs_to_many :items, join_table: 'item_relations', foreign_key: :master_id, association_foreign_key: :slave_id
  store_accessor :features, :description

  validates_presence_of :name
  validates_presence_of :site
  validates_uniqueness_of :name, scope: :site
end
