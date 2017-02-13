# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  nickname               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  username               :string
#

class User < ApplicationRecord
  MAIN_ID = 1
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable
  audited
  has_one :mobile, dependent: :destroy
  has_one :weixin, dependent: :destroy
  has_many :image_items, dependent: :destroy, as: :owner
  has_many :members, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :sites
  attr_accessor :mobile_phone
  validates :mobile_phone, mobile_phone: true, allow_blank: true

  # Find user by phone number
  # @param [String] phone_number
  # @return [User]
  def self.find_by_phone_number(phone_number)
    User::Mobile.find_by(phone_number: phone_number).try(:user)
  end

  ##
  # Devise default required email, if you don't want it , need to define this method.
  #
  def email_required?
    false
  end

  def super_admin_or_admin?
    has_any_role?({name: :admin, resource: :any}, {name: :super_admin, resource: :any})
  end

  def token
    AuthToken.encode(user_id: self.id)
  end

end
