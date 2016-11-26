# == Schema Information
#
# Table name: user_weixins
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  uid        :string
#  name       :string
#  headshot   :string
#  city       :string
#  province   :string
#  country    :string
#  gender     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User::Weixin < ApplicationRecord
  belongs_to :user
  validates :uid, presence: true, uniqueness: true

  ##
  # get weixin_user base infromation
  # @param [Hash] auth is wexin omniauth request
  # @return [Object] return User::Weixin instance
  #
  def self.from_omniauth(auth)
    cond = auth.extra.raw_info.unionid ? \
      where("uid = ? OR unionid = ?", auth.uid, auth.extra.raw_info.unionid) : \
      where(uid: auth.uid)

    wx_user = cond.first || new
    wx_user.uid = auth.uid
    # wx_user.unionid = auth.extra.raw_info.unionid
    wx_user.name = auth.info.nickname
    wx_user.gender = auth.info.sex
    wx_user.province = auth.info.province
    wx_user.city = auth.info.city
    wx_user.country = auth.info.country
    wx_user.headshot = auth.info.headimgurl
    wx_user
  end

  ##
  # bind weixin_user with user
  # @param [String] user is a User instance
  # @param [Hash] auth is wexin omniauth request
  # @return [Object] return User::Weixin record
  #
  def self.connect_user(user, auth)
    weixin_user = from_omniauth(auth)
    weixin_user.user = user
    weixin_user.save
    weixin_user
  end

end
