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
  validates_presence_of :mobile_phone

  ##
  # Devise default required email, if you don't want it , need to define this method.
  #
  def email_required?
    false
  end

end
