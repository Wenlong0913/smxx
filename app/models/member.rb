class Member < ApplicationRecord
  audited
  belongs_to :user
  # validates_presence_of :user
  # validates_uniqueness_of :user_id, scope: :site_id
  belongs_to :site
  validates_presence_of :site, :name
  validates :email, email: true, allow_blank: true
  validates :qq, qq: true, allow_blank: true
  before_validation :create_user, if: -> { user_id.blank? && mobile_phone.present? }
  has_many :member_notes

  def last_updated_at
    member_notes.any? ? member_notes.last.updated_at : updated_at
  end

  def orders
    Order.where(member_id: id)
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
        self.user_id = user.id
      else
        errors.add :mobile_phone, "手机号错误"
      end
    end
  end

end
