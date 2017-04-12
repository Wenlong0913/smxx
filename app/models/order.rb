# == Schema Information
#
# Table name: orders
#
#  id                       :integer          not null, primary key
#  code                     :string
#  user_id                  :integer
#  site_id                  :integer
#  price                    :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  description              :text
#  status                   :integer
#  internal_status          :integer
#  member_id                :integer
#  preorder_conversition_id :integer
#  create_by                :integer
#  update_by                :integer
#

class Order < ApplicationRecord
  audited
  if Settings.project.sxhop?
    enum status: {
      open: 0,      # 未付款
      pending: 1,   # 付款中
      paid: 2,      # 已付款
      delivering: 4,# 发货中
      cancelled: 3, # 已取消
      completed: 4  # 已完成
    } 
  else
    enum status: {
      processing: 0, # 处理中
      cancelled: 1,  # 已取消
      completed: 2   # 已完成
    }  
  end
  if Settings.project.dagle?
    enum internal_status: {
      packing: 0,    # 拆分物料
      packed: 1,     # 完成拆分
      producing: 2,  # 生产中（表示已创建生产任务了）
      produced: 3,   # 生产完成
      delivering: 4, # 发货中
      delivered: 5   # 已收货
    }
  end

  belongs_to :user
  belongs_to :site
  # belongs_to :member
  belongs_to :preorder_conversition
  belongs_to :create_user, class_name: 'User', foreign_key: :create_by
  belongs_to :update_user, class_name: 'User', foreign_key: :update_by

  has_many_comments
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  has_many :order_materials, dependent: :destroy
  has_many :materials, through: :order_materials
  has_many :image_item_relations, as: :relation, dependent: :destroy
  has_many :image_items, :through => :image_item_relations
  has_many :attachment_relations, as: :relation, dependent: :destroy
  has_many :attachments, :through => :attachment_relations
  has_many :order_cvs, dependent: :destroy
  has_one :produce, dependent: :destroy
  has_one :order_delivery, dependent: :destroy
  has_one :delivery, through: :order_delivery
  has_many :finance_histories, as: :owner, dependent: :destroy

  if Settings.project.sxhop?
    before_create :generate_code
  end
  # before_validation :check_member

  validates_presence_of :site
  # validates_presence_of :member_name, message: '客户名称错误'
  # validates_presence_of :member
  validates_uniqueness_of :code

  # attr_accessor :mobile_phone, :member_name
  #
  if Settings.project.dagle?
    belongs_to :member
    validates_presence_of :member
  end

  after_initialize do
    self.status ||= 0
    self.internal_status ||= 0
  end

  before_save do
    if self.price.blank?
      self.price = 0
    end
    if Settings.project.dagle?
      self.user = self.member.user
    end
    # self.user = self.member.user
  end

  def paid
    finance_histories.sum(&:amount)
  end
  
  def paid_status
    paid > (price/100) ? '已结清' : '未结清'
  end

  # def member
  #   return nil unless site
  #   return site.members.where(user: user).first if user
  #   return site.members.where(id: member_id).first
  #   nil
  # end

  private

  # def check_member
  #   if mobile_phone.blank?
  #     create_member
  #   else
  #     user = User.find_by_phone_number(mobile_phone)
  #     if user
  #       self.user_id = user.id
  #     else
  #       member = create_member
  #       self.user_id = member.try(:user_id)
  #     end
  #   end
  # end

  # def create_member
  #   member = Member.find
  #   flag, member = Member::Create.(mobile_phone: mobile_phone, name: member_name, site_id: site_id)
  #   if flag
  #     self.member_id = member.id
  #     return member
  #   else
  #     errors.add :mobile_phone, member.errors["mobile_phone"].first
  #     return nil
  #   end
  # end

  def generate_code
    prefix = Time.now.strftime('%Y%m%d')
    number = self.class.where("code LIKE ?", prefix+'%').count
    loop do
      self.code = "#{prefix}#{(number + 1).to_s.rjust(3, '0')}"
      break unless self.class.where(code: self.code).exists?
      number += 1
    end
  end
end
