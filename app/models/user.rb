class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable
  has_one :mobile, dependent: :destroy
  has_one :weixin, dependent: :destroy
  attr_accessor :mobile_phone
  validates_presence_of :mobile_phone

  def email_required?
    false
  end

end
