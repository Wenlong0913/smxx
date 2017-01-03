class Member < ApplicationRecord
  audited
  belongs_to :user
  belongs_to :site
  validates_presence_of :user
  validates_presence_of :site, :name
  validates_uniqueness_of :user_id, scope: :site_id
  validates :email, email: true, allow_blank: true
  validates :qq, qq: true, allow_blank: true
  enum gender: [ :male, :female, :secret ]
  attr_accessor :mobile_phone

  before_validation :create_user, if: -> { user_id.blank? && mobile_phone.present? }

  after_initialize do
    self.gender ||= 'secret'
  end

  private

  def create_user
    user = User.find_by_phone_number(mobile_phone)
    if user
      if Member.exists?(site_id: site_id, user_id: user.id)
        errors.add :mobile_phone, "手机号已经存在"
      else
        self.user_id = user.id
      end
    else
      flag, user = User::Create.(mobile_phone: mobile_phone, nickname: name)
      if flag
        self.user = user
      else
        errors.add :mobile_phone, "手机号错误"
      end
    end
  end

end
