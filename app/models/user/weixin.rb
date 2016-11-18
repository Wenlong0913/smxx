class User::Weixin < ApplicationRecord
  belongs_to :user
  validates :uid, presence: true, uniqueness: true

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

  def self.process_weixin_user(user, auth)
    weixin_user = from_omniauth(auth)
    weixin_user.user = user
    weixin_user.user.save
    weixin_user
  end

end
