class Order < ApplicationRecord
  audited

  enum status: {
    processing: 0, # 处理中
    cancelled: 1,  # 已取消
    completed: 2   # 已完成
  }

  enum internal_status: {
    picking: 0,
    picked: 1,
    packing: 2,
    packed: 3
  }

  belongs_to :user
  belongs_to :site
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  before_create :generate_code

  validates_presence_of :user, :site
  validates_uniqueness_of :code

  after_initialize do
    self.status ||= 0
  end

  private

  def generate_code
    time = Time.now.strftime('%Y%m%d%H%M%S')
    max_length = 20
    time_length = time.length
    site_length = site.id.to_s.length
    rnd_length = max_length - time_length - site_length - 1
    fail "run out of order code!!!" if rnd_length < 1
    loop do
      r = SecureRandom.random_number(10**rnd_length)
      self.code = "#{time}#{r.to_s.ljust(rnd_length, '0')}0#{site.id}"
      break unless self.class.where(code: self.code).exists?
    end
  end
end
