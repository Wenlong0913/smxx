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
  validates_presence_of :mobile_phone, if: ->{ mobile.nil? }

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

  # def mobile_phone
  #   mobile.phone_number if mobile
  # end

  def display_headshot
    headshot || weixin.try(:headshot) || 'logo.png'
  end

  def display_name
    nickname.presence || username.presence || mobile.phone_number
  end

  def display_role
    roles.map(&:name).join(', ')
  end

end
