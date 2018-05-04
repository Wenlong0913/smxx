# == Schema Information
#
# Table name: finance_histories
#
#  id           :integer          not null, primary key
#  operate_date :date
#  amount       :decimal(8, 2)
#  operate_type :integer
#  owner_type   :string
#  owner_id     :integer
#  created_by   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  features     :jsonb
#

class FinanceHistory < ApplicationRecord
  audited
  belongs_to :owner, polymorphic: true
  has_many :image_item_relations, as: :relation, dependent: :destroy
  has_many :image_items, :through => :image_item_relations
  validates_presence_of :amount
  validates_presence_of :owner_id, :owner_type
  store_accessor :features, :note

  enum operate_type: {
    in:  0, #收款
    out: 1 #付款
  }

  def image_url
    image_items.first.try(:image_url)
  end
  
end
