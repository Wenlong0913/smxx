class Classorder < ApplicationRecord
  audited
  belongs_to :site
  belongs_to :user
  belongs_to :course
  has_many :classorder_courses, dependent: :destroy
  has_many :courses, through: :classorder_courses
  validates_uniqueness_of :name
 
  if Settings.project.wgtong?
    enum status: {
      open: 0,      # 未选课
      pending: 1,   # 付款中
      paid: 2,      # 已选课
      cancelled: 3, # 已取消
      delivering: 4,# 发货中
      completed: 5, # 已完成
    }
    enum refund_status: {
      apply_refund: 1, # 申请退课
      refunding: 2,    # 退课中
      refunded: 3      # 退课完成
    }
  else
    enum status: {
      processing: 0, # 处理中
      cancelled: 1,  # 已取消
      completed: 2   # 已完成
    }
  end
  if Settings.project.meikemei?
    validates_presence_of :refund_description, :apply_refund_user, if: ->(classorder) { classorder.refund_status == 'apply_refund' }
  end
  after_initialize do
    self.status ||= 0
   
  end
  before_save do
    # 订单状态改变消息提醒
    if self.status_changed? && !self.new_record? && self.user
      if Settings.project.wgtong?
        content = nil
        case self.status
        when 'paid'
          content = '已选课: '
        when 'cancelled'
          content = '选课已取消: '
        when 'completed'
          content = '选课已完成: '
        end
        Notification.notice(self.site.user.id, nil, '课程订单', content + self.code.to_s, self, 'code') if content.present? && self.site.user
      else
        Notification.notice(self.site.user.id, nil, '课程订单', '订单状态更新了', self, 'code') if self.site.user
      end
    end

    if self.status_changed? && (Settings.project.wgtong?)
      # 支付成功后修改产品库存
      if self.paid?
        self.classorder_courses.each do |op|
          p = op.courses
          limitnu=self.member_attributes[0]["limitnu"]
          p.limit_number[limitnu]=p.stock[limitnu]-op.amount
          p.save!  
        end
      end
      # 确认消费后给用户发送短信通知
      if self.completed?
        OrderCompletedJob.perform_async(self.id, "由商家(#{self.site.title})")
      end
    end

    if self.refund_status_changed?
      # 订单退款成功后修改产品库存
      if self.refunded?
        self.order_products.each do |op|
          p = op.product
          stocknu=self.member_attributes[0]["stocknu"]
          p.stock[stocknu]=p.stock[stocknu]+op.amount
          p.save!
        end
      end
    end
  end
end
