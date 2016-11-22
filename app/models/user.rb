class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable
  audited
  has_one :mobile, dependent: :destroy
  has_one :weixin, dependent: :destroy
  attr_accessor :mobile_phone
  validates_presence_of :mobile_phone

  def email_required?
    false
  end

  def permission?(klass, action)
    return true if has_role?('admin')
    !!roles.detect{|r| r.permission?(klass, action)}
  end

end
